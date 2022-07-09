package client

import "../../vendor/xcb"

import "core:strings"
import "core:c/libc"

@(private = "file")
atoms : map[cstring]xcb.Atom

// Get atom from name
lookup :: proc(atom_name : cstring) -> (atom : xcb.Atom, merr : Maybe(XError)) {

    if atom, ok := atoms[atom_name]; ok do return atom, nil

    cookie := xcb.intern_atom(connection, 0, cast(u16) len(atom_name), atom_name)
    err : ^xcb.GenericError = ---
    reply := xcb.intern_atom_reply(connection, cookie, &err)

    check(err, "Could not get atom %s", atom_name) or_return
    defer libc.free(reply)

    atoms[atom_name] = reply.atom

    return reply.atom, nil
}
