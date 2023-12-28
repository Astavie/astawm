package grid

import "core:slice"

import "../layout"
import "../windows"

import "../../client"
import "../../vendor/xcb"

Grid :: struct {
	windows: [dynamic]GridWindow,

	cursor: layout.Rect,
	cursor_win: xcb.Window,

	pos: layout.Pos,
	rows, columns: u16,
	border: u16,
}

init :: proc(rows, columns, border: u16, screen: ^xcb.Screen) -> (grid: Grid, merr: Maybe(client.XError)) {
	cursor := xcb.generate_id(client.connection)

	grid = Grid {
		cursor = layout.rect(0, 0, 1, 1),
		cursor_win = cursor,

		rows = rows,
		columns = columns,
		border = border,
	}

	coords := cursor_coords(&grid, { screen.width_in_pixels, screen.height_in_pixels })
    client.check_cookie(
        xcb.create_window_checked(client.connection, xcb.COPY_FROM_PARENT, cursor, screen.root, coords.x, coords.y, coords.width, coords.height, 0, xcb.WINDOW_CLASS_INPUT_OUTPUT, screen.root_visual, 0, nil),
        "Could not create window for cursor",
    ) or_return
    client.check_cookie(
		xcb.configure_window_checked(client.connection, cursor, xcb.CONFIG_WINDOW_STACK_MODE, &[1]u32 { xcb.STACK_MODE_BELOW }),
		"Could not send cursor to back",
	)
    client.check_cookie(
        xcb.change_window_attributes_checked(client.connection, cursor, xcb.CW_BACK_PIXEL, &[1]u32 { 0xFF00FFFF }),
        "Could not set cursor color",
    ) or_return
    client.check_cookie(
        xcb.map_window_checked(client.connection, cursor),
        "Could not map cursor",
    ) or_return

    return grid, nil
}

GridWindow :: struct {
	wid: xcb.Window,
	pos: layout.Rect,
}

occupied :: proc(grid: ^Grid, pos: layout.Rect) -> bool {
	for w in grid.windows {
		if layout.intersects(pos, w.pos) {
			return true;
		}
	}
	return false;
}

empty_spot :: proc(grid: ^Grid) -> layout.Rect {
	if !occupied(grid, grid.cursor) {
		return grid.cursor
	} else {
		for xscreen in 0 ..= max(i16) {
			for y in 0 ..< i16(grid.rows) {
				for x in 0 ..< i16(grid.columns) {
					ycell := grid.pos.y + y
					xcell := grid.pos.x + xscreen * i16(grid.columns) + x
					rect := layout.rect(xcell, ycell, 1, 1)
					if !occupied(grid, rect) do return rect
				}
			}
		}
		panic("unreachable")
	}
}

screen_coords :: proc(grid: ^Grid, spot: layout.Rect, screen: layout.Size) -> layout.Rect {
	xo := spot.x - grid.pos.x
	yo := spot.y - grid.pos.y
	cell_width := screen.width / grid.columns;
	cell_height := screen.height / grid.rows;

	return layout.rect(
		xo * i16(cell_width) + i16(grid.border),
		yo * i16(cell_height) + i16(grid.border),
		spot.width * cell_width - grid.border * 2,
		spot.height * cell_height - grid.border * 2,
	)
}

cursor_coords :: proc(grid: ^Grid, screen: layout.Size) -> layout.Rect {
	xo := grid.cursor.x - grid.pos.x
	yo := grid.cursor.y - grid.pos.y
	cell_width := screen.width / grid.columns;
	cell_height := screen.height / grid.rows;

	return layout.rect(
		xo * i16(cell_width),
		yo * i16(cell_height),
		grid.cursor.width * cell_width,
		grid.cursor.height * cell_height,
	)
}

focus_spot :: proc(grid: ^Grid, spot: layout.Rect, screen: layout.Size) -> Maybe(client.XError) {
	pos := grid.pos

	if spot.x < pos.x {
		pos.x = spot.x
	} else if spot.x > pos.x && spot.x + i16(spot.width) > pos.x + i16(grid.columns) {
		pos.x = min(spot.x, spot.x + i16(spot.width) - i16(grid.columns))
	}

	if spot.y < pos.y {
		pos.y = spot.y
	} else if spot.y > pos.y && spot.y + i16(spot.height) > pos.y + i16(grid.rows) {
		pos.y = min(spot.y, spot.y + i16(spot.height) - i16(grid.rows))
	}

	if pos != grid.pos {
		grid.pos = pos
		refresh(grid, screen) or_return
	}

	grid.cursor = spot
	windows.set_geometry(grid.cursor_win, { cursor_coords(grid, screen), 0 })
	return nil
}

focus_window :: proc(grid: ^Grid, wid: xcb.Window, screen: layout.Size) -> Maybe(client.XError) {
	idx, ok := find(grid, wid)
	if ok do focus_spot(grid, grid.windows[idx].pos, screen) or_return
	return nil
}

refresh :: proc(grid: ^Grid, screen: layout.Size) -> Maybe(client.XError) {
	for win in grid.windows {
		coords := screen_coords(grid, win.pos, screen)
		windows.set_position(win.wid, coords.pos) or_return
	}
	return nil
}

insert :: proc(grid: ^Grid, wid: xcb.Window, screen: layout.Size) -> Maybe(client.XError) {
	if wid == grid.cursor_win do return nil

	spot := empty_spot(grid)
	coords := screen_coords(grid, spot, screen)
	windows.set_geometry(wid, { coords, 0 }) or_return

	append(&grid.windows, GridWindow { wid, spot })
	grid.cursor = spot
	return nil
}

find :: proc(grid: ^Grid, wid: xcb.Window) -> (index: int, ok: bool) {
	for x, i in grid.windows {
		if x.wid == wid {
			return i, true
		}
	}
	return -1, false
}

remove :: proc(grid: ^Grid, wid: xcb.Window) {
	idx, ok := find(grid, wid)
	if ok do unordered_remove(&grid.windows, idx)
}
