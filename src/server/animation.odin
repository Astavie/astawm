package server

import "../vendor/xcb"

import "core:slice"
import "core:sync"

Geometry :: struct {
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    border_width : u16,
}

Animation :: struct {
    from, to : Geometry,
    frames : int,
    current_frame : int,
    bounce : f32,
}

lock_animations :: proc(using s : ^Server) {
    sync.recursive_mutex_lock(&animation_mutex)
}

unlock_animations :: proc(using s : ^Server) {
    sync.recursive_mutex_unlock(&animation_mutex)
}

@(deferred_in=unlock_animations)
guard_animations :: proc(using s : ^Server) -> bool {
    lock_animations(s)
    return true
}

configure_geometry_discard :: proc(using s : ^Server, wid : xcb.Window, geometry : Geometry) {
    cookie := xcb.configure_window(
        conn, wid,
        xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y | xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT | xcb.CONFIG_WINDOW_BORDER_WIDTH,
        &[5]u32{
            transmute(u32) i32(geometry.x),
            transmute(u32) i32(geometry.y),
            u32(geometry.width),
            u32(geometry.height),
            u32(geometry.border_width),
        },
    )

    xcb.discard_reply(conn, cookie.sequence)
}

lerp_geometry :: proc(from, to : Geometry, f : f32) -> Geometry {

    apply :: proc(from, to : $T, f : f32) -> T {
        return T(f32(from) + (f32(to) - f32(from)) * f)
    }

    return Geometry {
        x = apply(from.x, to.x, f),
        y = apply(from.y, to.y, f),
        width = apply(from.width, to.width, f),
        height = apply(from.height, to.height, f),
        border_width = apply(from.border_width, to.border_width, f),
    }
}

update_animations :: proc(using s : ^Server) {
    // Enter animations lock
    if guard_animations(s) {
        // Update scroll
        // TODO

        // Update animations
        keys := slice.map_keys(animations)
        for wid in keys {
            anim := &animations[wid]

            anim.current_frame += 1
            if anim.current_frame == anim.frames {
                configure_geometry_discard(s, wid, anim.to)
                delete_key(&animations, wid)
            } else {
                f := f32(anim.current_frame) / f32  (anim.frames)

                // easeOutBack
                c1 := anim.bounce
                c3 := c1 + 1

                f -= 1
                f = 1 + c3 * f * f * f + c1 * f * f

                // configure
                geometry := lerp_geometry(anim.from, anim.to, f)
                configure_geometry_discard(s, wid, geometry)
            }
        }
    }
}
