package desktop

import "../vendor/xcb"
import "../wm/errors"
import "../windows"
import "../wm"

// Place a new window opened by the user in the grid
grid_place_window :: proc(using s : ^wm.WindowManager, vd : ^VirtualDesktop, wid : xcb.Window, width, height : u16) -> Maybe(errors.X11Error) {
    start_x, start_y := cell_at(
        vd^,
        i16(vd.padding.left),
        i16(vd.padding.top),
    )

    start := Cell {
        x = start_x,
        y = start_y,
        width = width,
        height = height,
    }

    bounds := grid_find_free_cell(vd^, wid, start)

    // Test code
    if cell_is_free(vd^, Cell {
        x = start_x,
        y = start_y,
        width = 1,
        height = 2,
    }) { bounds.height = 2 }

    cell_place_window(s, vd, wid, bounds) or_return
    grid_scroll_to(s, vd, bounds)

    return nil
}

// Scrolls the grid to a cell
grid_scroll_to :: proc(using s : ^wm.WindowManager, vd : ^VirtualDesktop, bounds : Cell) {
    // Get target cell
    current_x, current_y := cell_at(
        vd^,
        i16(vd.padding.left),
        i16(vd.padding.top),
    )

    columns := i16(len(vd.columns))
    rows    := i16(len(vd.rows))

    cell_x, cell_y : i16

    if bounds.x + i16(bounds.width)  > current_x + columns do cell_x = bounds.x + i16(bounds.width)  - columns
    if bounds.x                      < current_x           do cell_x = bounds.x
    if bounds.y + i16(bounds.height) > current_y + rows    do cell_y = bounds.y + i16(bounds.height) - rows
    if bounds.y                      < current_y           do cell_y = bounds.y

    // Get position of cell
    total_x : f32 = 0
    total_y : f32 = 0
    for column in vd.columns do total_x += column
    for row    in vd.rows    do total_y += row

    screen_x, inner_x := divmod(cell_x, u16(columns))
    screen_y, inner_y := divmod(cell_y, u16(rows))

    partial_x : f32 = 0
    partial_y : f32 = 0
    for column in vd.columns[:inner_x] do partial_x += column
    for row    in vd.rows   [:inner_y] do partial_y += row

    xdis, ydis := view_distance(vd^)
    x := i16(partial_x / total_x * f32(xdis)) + screen_x * i16(xdis)
    y := i16(partial_y / total_y * f32(ydis)) + screen_y * i16(ydis)

    // Setup scrolling
    change := wm.GeometryChange {
        x = -(x - vd.scroll_x),
        y = -(y - vd.scroll_y),
    }

    for wid in get_windows(vd^) {
        wm.animate_change(s, change, 15, 0, wid)
    }

    vd.scroll_x = x
    vd.scroll_y = y
}

// Gets the first free spot for a window based on the current view
grid_find_free_cell :: proc(vd : VirtualDesktop, wid : xcb.Window, bounds : Cell) -> Cell {
    x := bounds.x
    y := bounds.y

    loop: for {
        // Check if spot is free
        if cell_is_free(vd, Cell {
            x = x,
            y = y,
            width = bounds.width,
            height = bounds.height,
        }, wid) {
            break
        }

        // Increment if not
        switch (vd.scroll) {
            case .HORIZONTAL:
                if y >= i16(len(vd.rows)) - i16(bounds.height) {
                    y = 0
                    x += 1
                } else {
                    y += 1
                }
            case .VERTICAL:
                if x >= i16(len(vd.columns)) - i16(bounds.width) {
                    x = 0
                    y += 1
                } else {
                    x += 1
                }
            case .NONE:
                if x >= i16(len(vd.columns)) - i16(bounds.width) {
                    if y >= i16(len(vd.rows)) - i16(bounds.height) do break loop
                    x = 0
                    y += 1
                } else {
                    x += 1
                }
            case .BOTH:
                // TODO
        }
    }

    return Cell {
        x = x,
        y = y,
        width = bounds.width,
        height = bounds.height,
    }
}
