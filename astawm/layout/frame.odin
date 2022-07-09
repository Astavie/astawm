package layout

Frame :: struct {
    frame_geometry : Geometry,
    inner_size     : Size,
}

Constraints :: struct {

}

calc_frame :: proc(target : Rect, constraints : Constraints) -> Frame {

    // TODO: conform to window demands
    // this just returns the target in frame form

    return {
        { target, 0 },
        target.size,
    }
}
