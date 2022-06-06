package desktop

import "../vendor/xcb"
import "../wm/errors"
import "../windows"
import "../wm"

// Checks if a rectangle is free of any windows
cell_is_free :: proc(vd : ^VirtualDesktop, rect : Cell, ignore : xcb.Window = xcb.WINDOW_NONE) -> bool {
    for wid, bounds in vd.grid_windows {
        if wid == ignore do continue
        if rect.x >= bounds.x + i16(bounds.width)  || bounds.x >= rect.x + i16(rect.width)  do continue
        if rect.y >= bounds.y + i16(bounds.height) || bounds.y >= rect.y + i16(rect.height) do continue
        return false
    }
    return true
}

column_size :: proc(vd : ^VirtualDesktop, column : i16) -> u16 {
    factor : f32 = 1

    if custom, ok := vd.custom_columns[column]; ok {
        factor = custom
    } else if (len(vd.default_columns) > 0) {
        mod := column % i16(len(vd.default_columns))
        if mod < 0 do mod += i16(len(vd.default_columns))
        factor = vd.default_columns[mod]
    }

    vp := f32(vd.viewport.width - vd.padding.left - vd.padding.right)
    gap := (1 - factor) * f32(vd.gap)
    size := vp * factor - gap

    return u16(size)
}

row_size :: proc(vd : ^VirtualDesktop, row : i16) -> u16 {
    factor : f32 = 1

    if custom, ok := vd.custom_rows[row]; ok {
        factor = custom
    } else if (len(vd.default_rows) > 0) {
        mod := row % i16(len(vd.default_rows))
        if mod < 0 do mod += i16(len(vd.default_rows))
        factor = vd.default_rows[mod]
    }

    vp := f32(vd.viewport.height - vd.padding.top - vd.padding.bottom)
    gap := (1 - factor) * f32(vd.gap)
    size := vp * factor - gap

    return u16(size)
}

// Get cell at internal position
cell_at :: proc(vd : ^VirtualDesktop, px, py : i16) -> (i16, i16) {
    prev_px : i16 = 0
    prev_py : i16 = 0

    cell_x : i16 = 0
    cell_y : i16 = 0

    if px >= 0 do for {
        next := i16(vd.gap + column_size(vd, cell_x))
        if prev_px + next > px do break

        prev_px += next
        cell_x += 1
    } else do for {
        next := i16(vd.gap + column_size(vd, cell_x - 1))
        if prev_px - next < px do break

        prev_px -= next
        cell_x -= 1
    }

    if py >= 0 do for {
        next := i16(vd.gap + row_size(vd, cell_y))
        if prev_py + next > py do break

        prev_py += next
        cell_y += 1
    } else do for {
        next := i16(vd.gap + row_size(vd, cell_y - 1))
        if prev_py - next < py do break

        prev_py -= next
        cell_y -= 1
    }

    return cell_x, cell_y
}

// Get position and size in pixels of cell rectangle with internal coordinates
cell_geometry :: proc(vd : ^VirtualDesktop, bounds : Cell) -> windows.Geometry {
    // Position of window
    x, y : i16

    if bounds.x >= 0 do for i in 0 ..<  bounds.x do x += i16(column_size(vd,  i) + vd.gap)
    else             do for i in 1 ..= -bounds.x do x -= i16(column_size(vd, -i) + vd.gap)
    if bounds.y >= 0 do for i in 0 ..<  bounds.y do y += i16(   row_size(vd,  i) + vd.gap)
    else             do for i in 1 ..= -bounds.y do y -= i16(   row_size(vd, -i) + vd.gap)

    // Size of window
    width, height : u16

    for i in 0 ..< bounds.width  do width  += column_size(vd, bounds.x + i16(i)) + vd.gap
    for i in 0 ..< bounds.height do height +=    row_size(vd, bounds.y + i16(i)) + vd.gap

    // Return
    return windows.Geometry {
        x = x,
        y = y,
        width  = width  - vd.gap,
        height = height - vd.gap,
    }
}

// Places a window within the grid of the virtual desktop
cell_place_window :: proc(using s : ^wm.WindowManager, vd : ^VirtualDesktop, wid : xcb.Window, bounds : Cell) -> Maybe(errors.X11Error) {
    // Geometry of window
    // TODO respect window size requests
    border_width := (windows.get_geometry(s, wid) or_return).border_width
    geometry     := cell_geometry(vd, bounds)
    geometry.x   += -vd.scroll_x + vd.viewport.x + i16(vd.padding.left)
    geometry.y   += -vd.scroll_y + vd.viewport.y + i16(vd.padding.top)

    // Place window in virtual desktop
    if !has_window(vd, wid) {
        // Start from center of geometry
        // TODO resizing while mapped costs a lot of time

        cookie := xcb.configure_window_checked(
            conn, wid,
            xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y | xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT | xcb.CONFIG_WINDOW_BORDER_WIDTH,
            &[5]u32{
                transmute(u32) i32(geometry.x + i16(geometry.width  / 2) - i16(geometry.border_width)),
                transmute(u32) i32(geometry.y + i16(geometry.height / 2) - i16(geometry.border_width)),
                u32(1),
                u32(1),
                u32(geometry.border_width),
            },
        )

        errors.check_cookie(conn, cookie, "Error configuring window %d\n", wid) or_return
    }

    geometry.width   -= 2 * border_width
    geometry.height  -= 2 * border_width
    geometry.border_width = border_width

    wm.animate_to(s, geometry, 15, 1, wid) or_return

    remove_window(vd, wid)
    vd.grid_windows[wid] = bounds
    return nil
}
