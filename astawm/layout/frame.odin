package layout

import "../util"

Frame :: struct {
    frame_geometry : util.Geometry,
    inner_size : util.Size,
}

Constraints :: struct {

}

calc_frame :: proc(target : util.Rect, constraints : Constraints) -> Frame {

    // TODO: conform to window demands
    // this just returns the target in frame form

    return {
        { target, 0 },
        target.size,
    }
}
