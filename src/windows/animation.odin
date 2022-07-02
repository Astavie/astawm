package windows

import "../vendor/xcb"
import "../util"
import "../wm"

import "core:slice"
import "core:sync"
import "core:c/libc"

@(private="file")
animation_mutex : sync.Recursive_Mutex

// NOTE: this map currently gets allocated implicitly and is never destroyed
@(private="file")
animations : map[xcb.Window][dynamic]Animation

GeometryChange :: struct {
    x : i16,
    y : i16,
    width : i16,
    height : i16,
    border_width : i16,
}

Animation :: struct {
    change : GeometryChange,
    frames : int,
    current_frame : int,
    bounce : f32,
}

// Transforms a window's geometry over time
//
// The window's geometry is guaranteed to land on the specified geometry when *all* animations are complete
animate_to :: proc(geometry : util.Geometry, frames : int, bounce : f32, wid : xcb.Window) -> Maybe(wm.X11Error) {
    // Enter animations lock
    if guard_animations() {

        current := get_geometry(wid) or_return

        change := GeometryChange {
            x = geometry.x - current.x,
            y = geometry.y - current.y,
            width = i16(geometry.width) - i16(current.width),
            height = i16(geometry.height) - i16(current.height),
            border_width = i16(geometry.border_width) - i16(current.border_width),
        }
        
        if arr, ok := animations[wid]; ok {
            for anim in arr {
                change.x -= anim.change.x
                change.y -= anim.change.y
                change.width -= anim.change.width
                change.height -= anim.change.height
                change.border_width -= anim.change.border_width
            }
        }

        animate_change(change, frames, bounce, wid)

    }
    return nil
}

// Transforms a window's geometry over time
//
// If the window is already being transformed, this change will be added to all existing changes
animate_change :: proc(change : GeometryChange, frames : int, bounce : f32, wid : xcb.Window) {
    if guard_animations() {

        anim := Animation {
            change = change,
            frames = frames,
            current_frame = 0,
            bounce = bounce,
        }

        if arr, ok := &animations[wid]; ok {
            append(arr, anim)
        } else {
            animations[wid] = [dynamic]Animation{anim}
        }

    }
}

lock_animations :: proc() {
    sync.recursive_mutex_lock(&animation_mutex)
}

unlock_animations :: proc() {
    sync.recursive_mutex_unlock(&animation_mutex)
}

@(deferred_in=unlock_animations)
guard_animations :: proc() -> bool {
    lock_animations()
    return true
}

@(private="file")
configure_window_discard :: proc(change : GeometryChange, wid : xcb.Window) {
    reply := xcb.get_geometry_reply(wm.connection, xcb.get_geometry(wm.connection, wid), nil)
    if reply == nil do return

    cookie := xcb.configure_window(
        wm.connection, wid,
        xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y | xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT | xcb.CONFIG_WINDOW_BORDER_WIDTH,
        &[5]u32{
            transmute(u32) i32(reply.x + change.x),
            transmute(u32) i32(reply.y + change.y),
            u32(i16(reply.width) + change.width),
            u32(i16(reply.height) + change.height),
            u32(i16(reply.border_width) + change.border_width),
        },
    )

    libc.free(reply)
    xcb.discard_reply(wm.connection, cookie.sequence)
}

@(private="file")
apply_change :: proc(change : GeometryChange, f : f32, c1 : f32) -> GeometryChange {

    apply :: proc(i : $T, f : f32) -> T {
        return T(f32(i) * f)
    }

    c3 := c1 + 1

    f1 := f - 1
    f1 = 1 + c3 * f1 * f1 * f1 + c1 * f1 * f1

    return GeometryChange {
        x            = apply(change.x, f1),
        y            = apply(change.y, f1),
        width        = apply(change.width, f1),
        height       = apply(change.height, f1),
        border_width = apply(change.border_width, f1),
    }
}

update_animations :: proc() {
    // Enter animations lock
    if guard_animations() {

        // Update animations
        keys := slice.map_keys(animations)
        for wid in keys {
            arr := &animations[wid]

            // Add all changes for this frame
            total : GeometryChange

            for i := 0; i < len(arr); i += 1 {
                anim := &arr[i]

                // Get progress at previous frame
                change_prev : GeometryChange = {}

                if anim.current_frame > 0 {
                    f_prev := f32(anim.current_frame) / f32(anim.frames)
                    change_prev = apply_change(anim.change, f_prev, anim.bounce)
                }

                // Increment frame
                anim.current_frame += 1

                // Get progress at current frame
                change : GeometryChange

                if anim.current_frame == anim.frames {
                    change = anim.change

                    // Remove animation on complete
                    unordered_remove(arr, i)
                    i -= 1
                } else {
                    f := f32(anim.current_frame) / f32(anim.frames)
                    change = apply_change(anim.change, f, anim.bounce)
                }

                // Add progress from last frame to current frame to the total transformation
                total.x += change.x - change_prev.x
                total.y += change.y - change_prev.y
                total.width += change.width - change_prev.width
                total.height += change.height - change_prev.height
                total.border_width += change.border_width - change_prev.border_width
            }

            // Move window
            if total != {} do configure_window_discard(total, wid)

            // Untrack window if all animations are done
            if len(arr) == 0 {
                delete_key(&animations, wid)
            }
        }
        
    }
}
