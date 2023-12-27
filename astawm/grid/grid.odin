package grid

import "core:slice"

import "../layout"
import "../windows"

import "../../client"
import "../../vendor/xcb"

Grid :: struct {
	windows: [dynamic]GridWindow,
	cursor: Maybe(layout.Rect),
	pos: layout.Pos,
	rows, columns: u16,
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
	if cursor, ok := grid.cursor.?; ok && !occupied(grid, cursor) {
		return cursor
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
		xo * i16(cell_width),
		yo * i16(cell_height),
		spot.width * cell_width,
		spot.height * cell_height,
	)
}

insert :: proc(grid: ^Grid, wid: xcb.Window, screen: layout.Size) -> Maybe(client.XError) {
	// check if fits under cursor
	spot := empty_spot(grid)
	append(&grid.windows, GridWindow { wid, spot })

	coords := screen_coords(grid, spot, screen)
	windows.set_geometry(wid, { coords, 0 }) or_return

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
