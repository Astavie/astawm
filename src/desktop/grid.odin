package desktop

import "../vendor/xcb"
import "../errors"
import "../windows"
import "../server"

// Place a new window opened by the user in the grid
grid_place_window :: proc(using s : ^server.Server, vd : ^VirtualDesktop, wid : xcb.Window, width, height : u16) -> Maybe(errors.X11Error) {
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

    cell_place_window(s, vd, wid, bounds)

    return nil
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
