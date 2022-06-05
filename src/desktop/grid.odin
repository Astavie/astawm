package desktop

import "../vendor/xcb"
import "../errors"
import "../windows"
import "../server"

// Place a new window opened by the user in the grid
grid_place_window :: proc(using s : ^server.Server, vd : ^VirtualDesktop, wid : xcb.Window, width, height : u16) -> Maybe(errors.X11Error) {
    vd_geometry := windows.get_geometry(s, vd.desktop) or_return

    start_x, start_y := cell_at(
        vd^,
        u16(-vd_geometry.x) + vd.padding.left,
        u16(-vd_geometry.y) + vd.padding.top,
    )

    bounds := grid_find_free_cell(vd^, wid, Cell {
        x = start_x,
        y = start_y,
        width = width,
        height = height,
    })

    // // Test code
    // if len(vd.grid_windows) == 0 do bounds.height = 2

    prepared := grid_prepare_placement(s, vd, wid, bounds) or_return

    cell_place_window(s, vd, wid, prepared)

    return nil
}

// Resizes the desktop to fit the cell if needed
grid_prepare_placement :: proc(using s : ^server.Server, vd : ^VirtualDesktop, wid : xcb.Window, bounds : Cell) -> (b : Cell, e : Maybe(errors.X11Error)) {
    b = bounds

    if vd.scroll == .NONE do return

    // Get resize amount
    // TODO: possibly shrink if moving window to different position
    x1, y1, x2, y2 := cell_view(vd^, bounds)

    left   : i16 = 0
    top    : i16 = 0
    right  : i16 = 0
    bottom : i16 = 0

    if scrolls_horizontal(vd.scroll) && x1 == 0                 do left   = 1
    if scrolls_vertical  (vd.scroll) && y1 == 0                 do top    = 1
    if scrolls_horizontal(vd.scroll) && x2 + 2 > vd.views_horiz do right  = i16(x2 + 2 - vd.views_horiz)
    if scrolls_vertical  (vd.scroll) && y2 + 2 > vd.views_vert  do bottom = i16(y2 + 2 - vd.views_vert)

    if left == 0 && right == 0 && top == 0 && bottom == 0 do return

    // Resize
    resize(s, vd, left, top, right, bottom) or_return
    b.x = u16(i16(b.x) + left * i16(len(vd.columns)))
    b.y = u16(i16(b.y) + top  * i16(len(vd.rows)))
    return
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
                if y >= u16(len(vd.rows)) - bounds.height {
                    y = 0
                    x += 1
                } else {
                    y += 1
                }
            case .VERTICAL:
                if x >= u16(len(vd.columns)) - bounds.width {
                    x = 0
                    y += 1
                } else {
                    x += 1
                }
            case .NONE:
                fallthrough
            case .BOTH:
                if x >= u16(len(vd.columns)) - bounds.width {
                    if y >= u16(len(vd.rows)) - bounds.height do break loop
                    x = 0
                    y += 1
                } else {
                    x += 1
                }
        }
    }

    return Cell {
        x = x,
        y = y,
        width = bounds.width,
        height = bounds.height,
    }
}
