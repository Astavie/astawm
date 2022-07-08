package windows

import "../../vendor/xcb"
import "../wm"
import "../util"

import "core:c/libc"
import "core:strings"

// Get the geometry of a window
get_geometry :: proc(wid : xcb.Window) -> (g : util.Geometry, merr : Maybe(wm.X11Error)) {
    cookie := xcb.get_geometry(wm.connection, wid)
    err : ^xcb.GenericError = ---
    reply := xcb.get_geometry_reply(wm.connection, cookie, &err)

    wm.check(err, "Error getting geometry for window %d\n", wid) or_return
    defer libc.free(reply)

    return util.geometry(
        reply.x,
        reply.y,
        reply.width,
        reply.height,
        reply.border_width,
    ), nil
}

// Get the geometry of a window, sending any potential errors to the event loop
get_geometry_unchecked :: proc(wid : xcb.Window) -> Maybe(util.Geometry) {
    cookie := xcb.get_geometry_unchecked(wm.connection, wid)
    reply := xcb.get_geometry_reply(wm.connection, cookie, nil)

    if reply == nil do return nil

    defer libc.free(reply)

    return util.geometry(
        reply.x,
        reply.y,
        reply.width,
        reply.height,
        reply.border_width,
    )
}

// Get window title
get_title :: proc(wid : xcb.Window, alloc := context.allocator) -> (str : string, e : Maybe(wm.X11Error)) {
    // EWWH name
    reply := wm.get_value(wm._NET_WM_NAME, wid) or_return
    if (xcb.get_property_value_length(reply) == 0) {
        // ICCCM name
        libc.free(reply)
        reply = wm.get_value(xcb.ATOM_WM_NAME, wid) or_return
    }

    defer libc.free(reply)
    return strings.clone(wm.string_from_prop(reply), alloc), nil
}
