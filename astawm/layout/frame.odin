package layout

import "../../utils/geom"

Frame :: struct {
    frame_geometry : geom.Geometry,
    inner_size     : geom.Size,
}

Constraints :: struct {

}

calc_frame :: proc(target : geom.Rect, constraints : Constraints) -> Frame {

    // TODO: conform to window demands
    // this just returns the target in frame form

    return {
        { target, 0 },
        target.size,
    }
}
