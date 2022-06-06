package desktop

import "../vendor/xcb"
import "../wm/errors"
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
    viewport : windows.Geometry,
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
new :: proc(geometry : windows.Geometry) -> (vd : ^VirtualDesktop, e : Maybe(errors.X11Error)) {

    vd = builtin.new(VirtualDesktop)

    vd.viewport = geometry
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
free :: proc(vd : ^VirtualDesktop) {
    delete(vd.grid_windows)
    delete(vd.floating_windows)

    delete(vd.default_columns)
    delete(vd.default_rows)
    delete(vd.custom_columns)
    delete(vd.custom_rows)

    builtin.free(vd)
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
