package desktop

import "../vendor/xcb"
import "../wm"
import "../windows"
import "../util"

import "core:slice"

ScrollDirection :: enum {
    NONE,
    VERTICAL,
    HORIZONTAL,
    BOTH,
}

VirtualDesktop :: struct {
    viewport : xcb.Window,

    width : u16,
    height : u16,
    gap : u16,
    padding : Padding,

    default_columns : []f32,
    default_rows : []f32,
    custom_columns : map[i16]f32,
    custom_rows : map[i16]f32,

    scroll : ScrollDirection,
    scroll_x : i16,
    scroll_y : i16,

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
    x : i16,
    y : i16,
    width : u16,
    height : u16,
}

// Settings
CELLS_COLUMNS :: []f32{ 4.0 / 7, 3.0 / 7 }
CELLS_ROWS :: []f32{ 1.0 / 3 }
CELLS_DIRECTION :: ScrollDirection.VERTICAL

CELLS_GAP :: 8
CELLS_PADDING :: Padding {
    left = CELLS_GAP,
    top = 24,
    right = CELLS_GAP,
    bottom = 24,
}

// Create virtual desktop
create :: proc(screen : ^xcb.Screen, geometry : util.Geometry) -> (vd : ^VirtualDesktop, e : Maybe(wm.X11Error)) {

    viewport := xcb.generate_id(wm.connection)

    wm.check_cookie(
        xcb.create_window_checked(
            wm.connection, screen.root_depth, viewport, screen.root,
            geometry.x, geometry.y, geometry.width, geometry.height, geometry.border_width,
            xcb.WINDOW_CLASS_INPUT_OUTPUT, screen.root_visual,
            xcb.CW_EVENT_MASK, &[1]u32{xcb.EVENT_MASK_SUBSTRUCTURE_REDIRECT | xcb.EVENT_MASK_SUBSTRUCTURE_NOTIFY},
        ),
        "Could not create viewport window\n",
    ) or_return

    wm.check_cookie(
        xcb.change_window_attributes_checked(wm.connection, viewport, xcb.CW_BACK_PIXEL, &[1]u32{0x0000FF}),
        "Could not change attributes of viewport window\n",
    ) or_return

    wm.check_cookie(
        xcb.map_window_checked(wm.connection, viewport),
        "Could not map viewport window to screen\n",
    ) or_return

    vd = new(VirtualDesktop)

    vd.viewport = viewport

    vd.width = geometry.width
    vd.height = geometry.height
    vd.gap = CELLS_GAP
    vd.padding = CELLS_PADDING
    
    vd.default_columns = slice.clone(CELLS_COLUMNS)
    vd.default_rows = slice.clone(CELLS_ROWS)
    vd.custom_columns = make(map[i16]f32)
    vd.custom_rows = make(map[i16]f32)

    vd.scroll = CELLS_DIRECTION

    vd.grid_windows     = make(map[xcb.Window]Cell)
    vd.floating_windows = make(map[xcb.Window]struct{})

    return
}

// Delete desktop
destroy :: proc(vd : ^VirtualDesktop) {
    xcb.destroy_window(wm.connection, vd.viewport)

    delete(vd.grid_windows)
    delete(vd.floating_windows)

    delete(vd.default_columns)
    delete(vd.default_rows)
    delete(vd.custom_columns)
    delete(vd.custom_rows)

    free(vd)
}

// Removes a window from the virtual desktop
remove_window :: proc(vd : ^VirtualDesktop, wid : xcb.Window) {
    delete_key(&vd.floating_windows, wid)
    delete_key(&vd.grid_windows, wid)
}

// Checks if this desktop is tracking this window
has_window :: proc(vd : ^VirtualDesktop, wid : xcb.Window) -> bool {
    return wid in vd.floating_windows || wid in vd.grid_windows
}

// Get all windows
get_windows :: proc(vd : ^VirtualDesktop) -> []xcb.Window {
    return slice.concatenate([][]xcb.Window{
        slice.map_keys(vd.floating_windows),
        slice.map_keys(vd.grid_windows),
    })
}
