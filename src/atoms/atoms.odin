package atoms

import "../vendor/xcb"
import "../errors"

import "core:strings"
import "core:c/libc"

_NET_WM_NAME : xcb.Atom = ---

// Looks up and saves atom variables
init :: proc(conn : ^xcb.Connection) -> Maybe(errors.X11Error) {
    _NET_WM_NAME = lookup(conn, "_NET_WM_NAME") or_return
    return nil
}

// Get atom from name
lookup :: proc(conn : ^xcb.Connection, atom_name : cstring) -> (atom : xcb.Atom, merr : Maybe(errors.X11Error)) {
    cookie := xcb.intern_atom(conn, 0, cast(u16) len(atom_name), atom_name)
    err : ^xcb.GenericError = ---
    reply := xcb.intern_atom_reply(conn, cookie, &err)

    errors.check(err, "Could not get atom %s\n", atom_name) or_return
    defer libc.free(reply)

    return reply.atom, nil
}

// Get atom value for window
get_value :: proc(conn : ^xcb.Connection, atom : xcb.Atom, wid : xcb.Window) -> (reply : ^xcb.GetPropertyReply, merr : Maybe(errors.X11Error)) {
    cookie := xcb.get_property(conn, 0, wid, atom, xcb.GET_PROPERTY_TYPE_ANY, 0, ~u32(0))
    err : ^xcb.GenericError = ---
    reply = xcb.get_property_reply(conn, cookie, &err)

    errors.check(err, "Could not get atom value for atom %d of window %d\n", atom, wid) or_return

    return reply, nil
}

// Turns an atom value into a string
string_from_prop :: proc(reply : ^xcb.GetPropertyReply) -> string {
    ptr := cast(^u8) xcb.get_property_value(reply)
    len := cast(int) xcb.get_property_value_length(reply)
    return strings.string_from_ptr(ptr, len)
}

// Get string value for window
get_string_value :: proc(conn : ^xcb.Connection, atom : xcb.Atom, wid : xcb.Window, alloc := context.allocator) -> (s : string, e : Maybe(errors.X11Error)) {
    reply := get_value(conn, atom, wid) or_return
    defer libc.free(reply)
    return strings.clone(string_from_prop(reply), alloc), nil
}
