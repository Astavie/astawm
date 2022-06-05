package desktop

import "../vendor/xcb"
import "../errors"
import "../windows"

// Checks if a rectangle is free of any windows
cell_is_free :: proc(vd : VirtualDesktop, rect : Cell, ignore : u32 = xcb.WINDOW_NONE) -> bool {
    for wid, bounds in vd.grid_windows {
        if wid == ignore do continue
        if rect.x >= bounds.x + bounds.width  || bounds.x >= rect.x + rect.width  do continue
        if rect.y >= bounds.y + bounds.height || bounds.y >= rect.y + rect.height do continue
        return false
    }
    return true
}

// Get cell at position (px, py)
cell_at :: proc(vd : VirtualDesktop, px, py : u16) -> (u16, u16) {
    // Get screen number and pixels within screen
    xdis, ydis := view_distance(vd)
    screen_x := (px - vd.padding.left) / xdis
    screen_y := (py - vd.padding.top)  / ydis

    inner_x := (px - vd.padding.left) % xdis
    inner_y := (py - vd.padding.top)  % ydis

    // Get cell within screen
    total_x : f32 = 0
    total_y : f32 = 0
    for column in vd.columns do total_x += column
    for row    in vd.rows    do total_y += row

    cell_x : u16 = 0
    cell_y : u16 = 0

    for partial_x : f32 = 0; cell_x < u16(len(vd.columns)); cell_x += 1 {
        partial_x += vd.columns[cell_x]
        if partial_x / total_x * f32(xdis) > f32(inner_x) do break
    }

    for partial_y : f32 = 0; cell_y < u16(len(vd.rows)); cell_y += 1 {
        partial_y += vd.rows[cell_y]
        if partial_y / total_y * f32(ydis) > f32(inner_y) do break
    }

    // Return cell in screen
    cell_x += screen_x * u16(len(vd.columns))
    cell_y += screen_y * u16(len(vd.rows))

    return cell_x, cell_y
}

// Get views of cell
cell_view :: proc(vd : VirtualDesktop, bounds : Cell) -> (x1 : u16, y1 : u16, x2 : u16, y2 : u16) {
    columns := u16(len(vd.columns))
    rows    := u16(len(vd.rows))

    x1 = bounds.x / columns
    y1 = bounds.y / rows

    x2 = (bounds.x + bounds.width  - 1) / columns
    y2 = (bounds.y + bounds.height - 1) / rows
    return
}

// Get position and size in pixels of cell rectangle
// TODO: comply with window size requests
cell_geometry :: proc(vd : VirtualDesktop, bounds : Cell, border_width : u16) -> windows.Geometry {
    columns := u16(len(vd.columns))
    rows    := u16(len(vd.rows))

    // Screen number
    xdis, ydis := view_distance(vd)
    screen_x := bounds.x / columns
    screen_y := bounds.y / rows
    inner_x := bounds.x % columns
    inner_y := bounds.y % rows

    // Position of window
    total_x : f32 = 0
    total_y : f32 = 0
    for column in vd.columns do total_x += column
    for row    in vd.rows    do total_y += row

    partial_x : f32 = 0
    partial_y : f32 = 0
    for column in vd.columns[:inner_x] do partial_x += column
    for row    in vd.rows   [:inner_y] do partial_y += row

    x := u16(partial_x / total_x * f32(xdis)) + screen_x * xdis + vd.padding.left
    y := u16(partial_y / total_y * f32(ydis)) + screen_y * ydis + vd.padding.top

    // Size of window
    size_partial_x : f32 = 0
    size_partial_y : f32 = 0

    for i := bounds.x; i < bounds.x + bounds.width;  i += 1 do size_partial_x += vd.columns[i % columns]
    for i := bounds.y; i < bounds.y + bounds.height; i += 1 do size_partial_y += vd.rows   [i % rows]

    width  := u16(size_partial_x / total_x * f32(xdis)) - vd.gap - 2 * border_width
    height := u16(size_partial_y / total_y * f32(ydis)) - vd.gap - 2 * border_width

    // Return
    return windows.Geometry {
        x = i16(x),
        y = i16(y),
        width = width,
        height = height,
        border_width = border_width,
    }
}

// Places a window within the grid of the virtual desktop
cell_place_window :: proc(conn : ^xcb.Connection, vd : ^VirtualDesktop, wid : xcb.Window, bounds : Cell) {
    // Geometry of window
    geometry_maybe := windows.get_geometry_unchecked(conn, wid)
    if geometry_maybe == nil do return

    geometry := cell_geometry(vd^, bounds, geometry_maybe.?.border_width)

    // Place window in virtual desktop
    if wid in vd.grid_windows || wid in vd.floating_windows {
        xcb.configure_window(conn, wid, xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y | xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT, &[4]u32{
            transmute(u32) i32(geometry.x),
            transmute(u32) i32(geometry.y),
            u32(geometry.width),
            u32(geometry.height),
        })
    } else {
        xcb.configure_window(conn, wid, xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT, &[2]u32{
            u32(geometry.width),
            u32(geometry.height),
        })
        xcb.change_save_set(conn, xcb.SET_MODE_INSERT, wid)
        xcb.reparent_window(conn, wid, vd.desktop, geometry.x, geometry.y)
    }

    delete_key(&vd.floating_windows, wid)
    vd.grid_windows[wid] = bounds
}
