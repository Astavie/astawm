package windows

import "../../vendor/xcb"
import "../../client"
import "../layout"

import "core:c/libc"
import "core:strings"

// Get the geometry of a window
get_geometry :: proc(wid : xcb.Window) -> (g : layout.Geometry, merr : Maybe(client.XError)) {
    cookie := xcb.get_geometry(client.connection, wid)
    err : ^xcb.GenericError = ---
    reply := xcb.get_geometry_reply(client.connection, cookie, &err)

    client.check(err, "Error getting geometry for window %d", wid) or_return
    defer libc.free(reply)

    return layout.geometry(
        reply.x,
        reply.y,
        reply.width,
        reply.height,
        reply.border_width,
    ), nil
}

// Get atom value for window
@(private="file")
get_value :: proc(atom : xcb.Atom, wid : xcb.Window) -> (reply : ^xcb.GetPropertyReply, merr : Maybe(client.XError)) {
    cookie := xcb.get_property(client.connection, 0, wid, atom, xcb.GET_PROPERTY_TYPE_ANY, 0, ~u32(0))
    err : ^xcb.GenericError = ---
    reply = xcb.get_property_reply(client.connection, cookie, &err)

    client.check(err, "Could not get atom value for atom %d of window %d", atom, wid) or_return

    return reply, nil
}

// Turns an atom value into a string
@(private="file")
string_from_prop :: proc(reply : ^xcb.GetPropertyReply) -> string {
    ptr := cast(^u8) xcb.get_property_value(reply)
    len := cast(int) xcb.get_property_value_length(reply)
    return strings.string_from_ptr(ptr, len)
}

// Get string value for window
get_string_value :: proc(atom : xcb.Atom, wid : xcb.Window, alloc := context.allocator) -> (str : string, e : Maybe(client.XError)) {
    reply := get_value(atom, wid) or_return
    defer libc.free(reply)
    return strings.clone(string_from_prop(reply), alloc), nil
}

// Get window title
get_title :: proc(wid : xcb.Window, alloc := context.allocator) -> (str : string, e : Maybe(client.XError)) {
    // EWWH name
    reply := get_value(client.lookup("_NET_WM_NAME") or_return, wid) or_return
    if (xcb.get_property_value_length(reply) == 0) {
        // ICCCM name
        libc.free(reply)
        reply = get_value(xcb.ATOM_WM_NAME, wid) or_return
    }

    defer libc.free(reply)
    return strings.clone(string_from_prop(reply), alloc), nil
}
