package windows

import "../vendor/xcb"
import "../errors"
import "../atoms"

import "core:c/libc"
import "core:strings"

Geometry :: struct {
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    border_width : u16,
}

// Get the geometry of a window
get_geometry :: proc(conn : ^xcb.Connection, wid : xcb.Window) -> (g : Geometry, merr : Maybe(errors.X11Error)) {
    cookie := xcb.get_geometry(conn, wid)
    err : ^xcb.GenericError = ---
    reply := xcb.get_geometry_reply(conn, cookie, &err)

    errors.check(err, "Error getting geometry for window %d\n", wid) or_return
    defer libc.free(reply)

    return Geometry{
        reply.x,
        reply.y,
        reply.width,
        reply.height,
        reply.border_width,
    }, nil
}

// Get the geometry of a window, sending any potential errors to the event loop
get_geometry_unchecked :: proc(conn : ^xcb.Connection, wid : xcb.Window) -> Maybe(Geometry) {
    cookie := xcb.get_geometry_unchecked(conn, wid)
    reply := xcb.get_geometry_reply(conn, cookie, nil)

    if reply == nil do return nil

    defer libc.free(reply)

    return Geometry{
        reply.x,
        reply.y,
        reply.width,
        reply.height,
        reply.border_width,
    }
}

// Get window title
get_title :: proc(conn : ^xcb.Connection, wid : xcb.Window, alloc := context.allocator) -> (s : string, e : Maybe(errors.X11Error)) {
    // EWWH name
    reply := atoms.get_value(conn, atoms._NET_WM_NAME, wid) or_return
    if (xcb.get_property_value_length(reply) == 0) {
        // ICCCM name
        libc.free(reply)
        reply = atoms.get_value(conn, xcb.ATOM_WM_NAME, wid) or_return
    }

    defer libc.free(reply)
    return strings.clone(atoms.string_from_prop(reply), alloc), nil
}
