package desktop

import "../vendor/xcb"
import "../wm/errors"
import "../windows"
import "../wm"

// Checks if a rectangle is free of any windows
cell_is_free :: proc(vd : VirtualDesktop, rect : Cell, ignore : xcb.Window = xcb.WINDOW_NONE) -> bool {
    for wid, bounds in vd.grid_windows {
        if wid == ignore do continue
        if rect.x >= bounds.x + i16(bounds.width)  || bounds.x >= rect.x + i16(rect.width)  do continue
        if rect.y >= bounds.y + i16(bounds.height) || bounds.y >= rect.y + i16(rect.height) do continue
        return false
    }
    return true
}

@(private)
divmod :: proc(a : i16, b : u16) -> (div : i16, mod : i16) {
    div = a / i16(b)
    mod = a % i16(b)
    if mod < 0 {
        div -= 1
        mod += i16(b)
    }
    return
}

// Get cell at viewport position (px, py)
cell_at :: proc(vd : VirtualDesktop, px, py : i16) -> (i16, i16) {
    // Get screen number and pixels within screen
    xdis, ydis := view_distance(vd)

    screen_x, inner_x := divmod(px - i16(vd.padding.left) + vd.scroll_x, xdis)
    screen_y, inner_y := divmod(py - i16(vd.padding.top)  + vd.scroll_y, ydis)

    // Get cell within screen
    total_x : f32 = 0
    total_y : f32 = 0
    for column in vd.columns do total_x += column
    for row    in vd.rows    do total_y += row

    cell_x : i16 = 0
    cell_y : i16 = 0

    for partial_x : f32 = 0; cell_x < i16(len(vd.columns)); cell_x += 1 {
        partial_x += vd.columns[cell_x]
        if partial_x / total_x * f32(xdis) > f32(inner_x) do break
    }

    for partial_y : f32 = 0; cell_y < i16(len(vd.rows)); cell_y += 1 {
        partial_y += vd.rows[cell_y]
        if partial_y / total_y * f32(ydis) > f32(inner_y) do break
    }

    // Return cell in screen
    cell_x += screen_x * i16(len(vd.columns))
    cell_y += screen_y * i16(len(vd.rows))

    return cell_x, cell_y
}

// Get position and size in pixels of cell rectangle
// TODO: comply with window size requests
cell_geometry :: proc(vd : VirtualDesktop, bounds : Cell, border_width : u16) -> windows.Geometry {
    columns := u16(len(vd.columns))
    rows    := u16(len(vd.rows))

    total_x : f32 = 0
    total_y : f32 = 0
    for column in vd.columns do total_x += column
    for row    in vd.rows    do total_y += row

    // Screen number
    screen_x, inner_x := divmod(bounds.x, columns)
    screen_y, inner_y := divmod(bounds.y, rows)

    // Position of window
    partial_x : f32 = 0
    partial_y : f32 = 0
    for column in vd.columns[:inner_x] do partial_x += column
    for row    in vd.rows   [:inner_y] do partial_y += row

    xdis, ydis := view_distance(vd)
    x := i16(partial_x / total_x * f32(xdis)) + screen_x * i16(xdis) + i16(vd.padding.left)
    y := i16(partial_y / total_y * f32(ydis)) + screen_y * i16(ydis) + i16(vd.padding.top)

    // Size of window
    size_partial_x : f32 = 0
    size_partial_y : f32 = 0

    for i in bounds.x ..< bounds.x + i16(bounds.width) {
        _, idx := divmod(i, columns)
        size_partial_x += vd.columns[idx]
    }
    for i in bounds.y ..< bounds.y + i16(bounds.height) {
        _, idx := divmod(i, rows)
        size_partial_y += vd.rows[idx]
    }

    width  := u16(size_partial_x / total_x * f32(xdis)) - vd.gap - 2 * border_width
    height := u16(size_partial_y / total_y * f32(ydis)) - vd.gap - 2 * border_width

    // Return
    return windows.Geometry {
        x = x - vd.scroll_x + vd.viewport.x,
        y = y - vd.scroll_y + vd.viewport.y,
        width = width,
        height = height,
        border_width = border_width,
    }
}

// Places a window within the grid of the virtual desktop
cell_place_window :: proc(using s : ^wm.WindowManager, vd : ^VirtualDesktop, wid : xcb.Window, bounds : Cell) -> Maybe(errors.X11Error) {
    // Geometry of window
    border_width := (windows.get_geometry(s, wid) or_return).border_width
    geometry := cell_geometry(vd^, bounds, border_width)

    // Place window in virtual desktop
    if !has_window(vd, wid) {
        // Start from center of geometry
        // TODO resizing while mapped costs a lot of time

        cookie := xcb.configure_window_checked(
            conn, wid,
            xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y | xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT | xcb.CONFIG_WINDOW_BORDER_WIDTH,
            &[5]u32{
                transmute(u32) i32(geometry.x + i16((geometry.width - 1) / 2)  - i16(geometry.border_width)),
                transmute(u32) i32(geometry.y + i16((geometry.height - 1) / 2) - i16(geometry.border_width)),
                u32(1),
                u32(1),
                u32(geometry.border_width),
            },
        )

        errors.check_cookie(conn, cookie, "Error configuring window %d\n", wid) or_return
    }

    wm.animate_to(s, geometry, 15, 1, wid) or_return

    remove_window(vd, wid)
    vd.grid_windows[wid] = bounds
    return nil
}
