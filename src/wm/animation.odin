package wm

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

Movement :: struct {
    dx, dy: i16,
    frames : int,
    current_frame : int,
    bounce : f32,
}

lock_animations :: proc(using s : ^WindowManager) {
    sync.recursive_mutex_lock(&animation_mutex)
}

unlock_animations :: proc(using s : ^WindowManager) {
    sync.recursive_mutex_unlock(&animation_mutex)
}

@(deferred_in=unlock_animations)
guard_animations :: proc(using s : ^WindowManager) -> bool {
    lock_animations(s)
    return true
}

configure_window_discard :: proc(using s : ^WindowManager, wid : xcb.Window, geometry : Geometry) {
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

move_window_discard :: proc(using s : ^WindowManager, wid : xcb.Window, dx, dy : i16) {
    reply := xcb.get_geometry_reply(conn, xcb.get_geometry(conn, wid), nil)
    if reply == nil do return

    cookie := xcb.configure_window(
        conn, wid,
        xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y,
        &[2]u32{
            transmute(u32) i32(reply.x + dx),
            transmute(u32) i32(reply.y + dy),
        },
    )

    xcb.discard_reply(conn, cookie.sequence)
}

@(private="file")
apply :: proc(from, to : $T, f : f32, c1 : f32) -> T {
    c3 := c1 + 1

    f1 := f - 1
    f1 = 1 + c3 * f1 * f1 * f1 + c1 * f1 * f1

    return T(f32(from) + (f32(to) - f32(from)) * f1)
}

apply_geometry :: proc(from, to : Geometry, f : f32, c1 : f32) -> Geometry {

    return Geometry {
        x = apply(from.x, to.x, f, c1),
        y = apply(from.y, to.y, f, c1),
        width = apply(from.width, to.width, f, c1),
        height = apply(from.height, to.height, f, c1),
        border_width = apply(from.border_width, to.border_width, f, c1),
    }
}

update_animations :: proc(using s : ^WindowManager) {
    // Enter animations lock
    if guard_animations(s) {
        // Update scroll
        keys := slice.map_keys(movements)
        for wid in keys {
            move := &movements[wid]

            f_prev := f32(move.current_frame) / f32(move.frames)
            x_prev := apply(i16(0), move.dx, f_prev, move.bounce)
            y_prev := apply(i16(0), move.dy, f_prev, move.bounce)

            move.current_frame += 1

            dx, dy : i16

            if move.current_frame == move.frames {
                dx = move.dx - x_prev
                dy = move.dy - y_prev
                delete_key(&movements, wid)
            } else {
                f := f32(move.current_frame) / f32(move.frames)
                dx = apply(i16(0), move.dx, f, move.bounce) - x_prev
                dy = apply(i16(0), move.dy, f, move.bounce) - y_prev
            }

            if anim, ok := &animations[wid]; ok {
                anim.from.x += dx
                anim.from.y += dy
                anim.to.x += dx
                anim.to.y += dy
            } else {
                move_window_discard(s, wid, dx, dy)
            }
        }

        // Update animations
        keys = slice.map_keys(animations)
        for wid in keys {
            anim := &animations[wid]

            anim.current_frame += 1
            if anim.current_frame == anim.frames {
                configure_window_discard(s, wid, anim.to)
                delete_key(&animations, wid)
            } else {
                f := f32(anim.current_frame) / f32(anim.frames)
                geometry := apply_geometry(anim.from, anim.to, f, anim.bounce)
                configure_window_discard(s, wid, geometry)
            }
        }
    }
}
