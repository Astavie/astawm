package desktop

import "../vendor/xcb"
import "../errors"
import "../windows"

import "core:builtin"
import "core:slice"

ScrollDirection :: enum {
    NONE,
    VERTICAL,
    HORIZONTAL,
    BOTH,
}

VirtualDesktop :: struct {
    viewport : xcb.Window,
    desktop : xcb.Window,

    width : u16,
    height : u16,
    gap : u16,
    padding : Padding,

    columns : []f32,
    rows : []f32,
    scroll : ScrollDirection,

    views_horiz : u16,
    views_vert : u16,

    grid_windows     : map[xcb.Window]Cell,
    floating_windows : map[xcb.Window]struct{},
}

Padding :: struct {
    left : u16,
    top : u16,
    right : u16,
    bottom : u16,
}

Cell :: struct {
    x : u16,
    y : u16,
    width : u16,
    height : u16,
}

// Settings
CELLS_COLUMNS :: []f32{4, 3}
CELLS_ROWS :: []f32{1, 1, 1}
CELLS_DIRECTION :: ScrollDirection.VERTICAL

CELLS_GAP :: 8
CELLS_PADDING :: Padding {
    left = CELLS_GAP,
    top = 24,
    right = CELLS_GAP,
    bottom = 24,
}

// Create virtual desktop
make :: proc(conn : ^xcb.Connection, screen : ^xcb.Screen, geometry : windows.Geometry) -> (vd : VirtualDesktop, e : Maybe(errors.X11Error)) {
    // create viewport
    viewport := xcb.generate_id(conn)

    errors.check_cookie(
        conn,
        xcb.create_window_checked(
            conn, screen.root_depth, viewport, screen.root,
            geometry.x, geometry.y, geometry.width, geometry.height, geometry.border_width,
            xcb.WINDOW_CLASS_INPUT_OUTPUT, screen.root_visual, 0, nil,
        ),
        "Could not create viewport window\n",
    ) or_return

    errors.check_cookie(
        conn,
        xcb.map_window_checked(conn, viewport),
        "Could not map viewport window to screen\n",
    ) or_return

    // create desktop
    desktop := xcb.generate_id(conn)
    mask : u32 = xcb.CW_EVENT_MASK
    values := xcb.EVENT_MASK_SUBSTRUCTURE_REDIRECT | xcb.EVENT_MASK_SUBSTRUCTURE_NOTIFY

    errors.check_cookie(
        conn,
        xcb.create_window_checked(
            conn, screen.root_depth, desktop, viewport,
            0, 0, geometry.width, geometry.height, 0,
            xcb.WINDOW_CLASS_INPUT_OUTPUT, screen.root_visual, mask, &values,
        ),
        "Could not create virtual desktop window\n",
    ) or_return

    errors.check_cookie(
        conn,
        xcb.map_window_checked(conn, desktop),
        "Could not map virtual desktop window to screen\n",
    ) or_return

    // return
    return VirtualDesktop {
        viewport = viewport,
        desktop = desktop,

        width = geometry.width,
        height = geometry.height,
        gap = CELLS_GAP,
        padding = CELLS_PADDING,

        columns = slice.clone(CELLS_COLUMNS),
        rows = slice.clone(CELLS_ROWS),
        scroll = CELLS_DIRECTION,

        views_horiz = 1,
        views_vert = 1,

        grid_windows     = builtin.make(map[xcb.Window]Cell),
        floating_windows = builtin.make(map[xcb.Window]struct{}),
    }, nil
}

// Delete desktop
delete :: proc(conn : ^xcb.Connection, vd : VirtualDesktop) {
    builtin.delete(vd.grid_windows)
    builtin.delete(vd.floating_windows)

    builtin.delete(vd.columns)
    builtin.delete(vd.rows)

    // destroy_window also destroys all subwindows, so just the viewport needs to be destroyed
    xcb.destroy_window(conn, vd.viewport)
}

// Removes a window from the virtual desktop
// TODO: possibly shrink
remove_window :: proc(conn : ^xcb.Connection, screen : ^xcb.Screen, vd : ^VirtualDesktop, wid : xcb.Window) {
    // Remove window from being tracked
    if !(wid in vd.grid_windows) {
        if !(wid in vd.floating_windows) do return
        delete_key(&vd.floating_windows, wid)
    } else {
        delete_key(&vd.grid_windows, wid)
    }

    // Reparent the window to root
    // We discard the replies because the window might already be destroyed, causing a server error
    xcb.discard_reply(conn, xcb.reparent_window(conn, wid, screen.root, 0, 0).sequence)
    xcb.discard_reply(conn, xcb.change_save_set(conn, xcb.SET_MODE_DELETE, wid).sequence)
}

// Get distance between screens
view_distance :: proc(vd : VirtualDesktop) -> (u16, u16) {
    xdis := vd.width  - vd.padding.left - vd.padding.right  + vd.gap
    ydis := vd.height - vd.padding.top  - vd.padding.bottom + vd.gap
    return xdis, ydis
}

scrolls_horizontal :: proc(scroll : ScrollDirection) -> bool {
    return scroll == .HORIZONTAL || scroll == .BOTH
}

scrolls_vertical :: proc(scroll : ScrollDirection) -> bool {
    return scroll == .VERTICAL || scroll == .BOTH
}

// Resizes the virtual desktop
resize :: proc(conn : ^xcb.Connection, vd : ^VirtualDesktop, left, top, right, bottom : i16) -> Maybe(errors.X11Error) {
    xdis, ydis := view_distance(vd^)

    left_px   := left   * i16(xdis)
    top_px    := top    * i16(ydis)
    right_px  := right  * i16(xdis)
    bottom_px := bottom * i16(ydis)

    if left != 0 || top != 0 {
        // Update grid window cells
        columns := left * i16(len(vd.columns))
        rows    :=  top * i16(len(vd.rows))

        for wid in vd.grid_windows {
            rect := &vd.grid_windows[wid]
            rect.x = u16(i16(rect.x) + columns)
            rect.y = u16(i16(rect.y) + rows)
        }

        // Move all windows (left, top)
        children := windows.get_children(conn, vd.desktop) or_return

        for wid in children do windows.move_unchecked(conn, wid, left_px, top_px)

        builtin.delete(children)
    }

    // Resize desktop
    vd.views_horiz = u16(i16(vd.views_horiz) + left + right)
    vd.views_vert  = u16(i16(vd.views_vert)  + top  + bottom)

    windows.resize_checked(conn, vd.desktop, left_px, top_px, right_px, bottom_px) or_return

    return nil
}
