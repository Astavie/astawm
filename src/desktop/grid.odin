package desktop

import "../vendor/xcb"
import "../wm/errors"
import "../windows"
import "../wm"

// Place a new window opened by the user in the grid
grid_place_window :: proc(using s : ^wm.WindowManager, vd : ^VirtualDesktop, wid : xcb.Window, width, height : u16) -> Maybe(errors.X11Error) {
    start_x, start_y := cell_at(vd, vd.scroll_x, vd.scroll_y)

    start := Cell {
        x = start_x,
        y = start_y,
        width = width,
        height = height,
    }

    bounds := grid_find_free_cell(vd, wid, start)

    // Test code
    if cell_is_free(vd, Cell {
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
    // Get scroll target
    view_w := i16(vd.width  - vd.padding.left - vd.padding.right)
    view_h := i16(vd.height - vd.padding.top  - vd.padding.bottom)

    geometry := cell_geometry(vd, bounds)

    x := vd.scroll_x
    y := vd.scroll_y

    if geometry.x < x do x = geometry.x
    if geometry.y < y do y = geometry.y

    if geometry.x + i16(geometry.width)  > x + view_w do x = geometry.x + i16(geometry.width)  - view_w
    if geometry.y + i16(geometry.height) > y + view_h do y = geometry.y + i16(geometry.height) - view_h

    if x == vd.scroll_x && y == vd.scroll_y do return

    // Setup scrolling
    change := wm.GeometryChange {
        x = -(x - vd.scroll_x),
        y = -(y - vd.scroll_y),
    }

    for wid in get_windows(vd) {
        wm.animate_change(s, change, 15, 0, wid)
    }

    vd.scroll_x = x
    vd.scroll_y = y
}

// Gets the first free spot for a window based on the current view
grid_find_free_cell :: proc(vd : ^VirtualDesktop, wid : xcb.Window, bounds : Cell) -> Cell {
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
                if y >= i16(len(vd.default_rows)) - i16(bounds.height) {
                    y = 0
                    x += 1
                } else {
                    y += 1
                }
            case .VERTICAL:
                if x >= i16(len(vd.default_columns)) - i16(bounds.width) {
                    x = 0
                    y += 1
                } else {
                    x += 1
                }
            case .NONE:
                if x >= i16(len(vd.default_columns)) - i16(bounds.width) {
                    if y >= i16(len(vd.default_rows)) - i16(bounds.height) do break loop
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
