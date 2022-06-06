package desktop

import "../vendor/xcb"
import "../errors"
import "../windows"
import "../server"

import "core:builtin"
import "core:slice"

ScrollDirection :: enum {
    NONE,
    VERTICAL,
    HORIZONTAL,
    BOTH,
}

VirtualDesktop :: struct {
    viewport : windows.Geometry,
    gap : u16,
    padding : Padding,

    columns : []f32,
    rows : []f32,
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
// TODO: don't enforce repetition in the scrolling direction
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
make :: proc(geometry : windows.Geometry) -> (vd : VirtualDesktop, e : Maybe(errors.X11Error)) {
    // return
    return VirtualDesktop {
        viewport = geometry,
        gap = CELLS_GAP,
        padding = CELLS_PADDING,

        columns = slice.clone(CELLS_COLUMNS),
        rows = slice.clone(CELLS_ROWS),
        scroll = CELLS_DIRECTION,
        scroll_x = 0,
        scroll_y = 0,

        grid_windows     = builtin.make(map[xcb.Window]Cell),
        floating_windows = builtin.make(map[xcb.Window]struct{}),
    }, nil
}

// Delete desktop
delete :: proc(vd : VirtualDesktop) {
    builtin.delete(vd.grid_windows)
    builtin.delete(vd.floating_windows)

    builtin.delete(vd.columns)
    builtin.delete(vd.rows)
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

// Get distance between screens
view_distance :: proc(vd : VirtualDesktop) -> (u16, u16) {
    xdis := vd.viewport.width  - vd.padding.left - vd.padding.right  + vd.gap
    ydis := vd.viewport.height - vd.padding.top  - vd.padding.bottom + vd.gap
    return xdis, ydis
}

// Get all windows
get_windows :: proc(vd : VirtualDesktop) -> []xcb.Window {
    return slice.concatenate([][]xcb.Window{
        slice.map_keys(vd.floating_windows),
        slice.map_keys(vd.grid_windows),
    })
}
