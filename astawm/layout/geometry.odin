package layout

Pos :: distinct [2]i16

Size :: struct {
    width : u16,
    height : u16,
}

Rect :: struct {
    using pos : Pos,
    using size : Size,
}

Geometry :: struct {
    using rect : Rect,
    border_width : u16,
}

rect :: #force_inline proc(x, y : i16, width, height : u16) -> Rect {
    return {
        { x, y },
        { width, height },
    }
}

geometry :: #force_inline proc(x, y : i16, width, height, border_width : u16) -> Geometry {
    return {
        rect(x, y, width, height),
        border_width,
    }
}
