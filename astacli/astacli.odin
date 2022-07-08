package main

import "../vendor/xcb"
import "core:c/libc"
import "core:mem"

to_fixed_array :: proc(str : string, $N : int) -> (result : [N]u8) {
    length := len(str)
    slice := transmute([]u8) str

    mem.copy_non_overlapping(&result[0], &slice[0], length * size_of(u8))
    result[length] = 0
    return
}

main :: proc() {
    // connect
    conn := xcb.connect(nil, nil)
    if conn == nil || xcb.connection_has_error(conn) != 0 do return
    defer xcb.disconnect(conn)

    // get root
    root := xcb.setup_roots_iterator(xcb.get_setup(conn)).data.root
    
    // get atom
    cookie := xcb.intern_atom(conn, 0, cast(u16) len("ASTA_PRINT"), "ASTA_PRINT")
    err : ^xcb.GenericError = ---
    reply := xcb.intern_atom_reply(conn, cookie, &err)

    if err != nil do panic("could not get atom")

    ASTA_PRINT := reply.atom
    libc.free(reply)

    // send message
    msg := xcb.ClientMessageEvent {
        xcb.CLIENT_MESSAGE,
        8,
        0,
        root,
        ASTA_PRINT,
        { data8 = to_fixed_array("Ahoy matie!", 20) },
    }

    cookie2 := xcb.send_event_checked(conn, 0, root, xcb.EVENT_MASK_SUBSTRUCTURE_NOTIFY | xcb.EVENT_MASK_SUBSTRUCTURE_REDIRECT, transmute(cstring) &msg)
    if xcb.request_check(conn, cookie2) != nil do panic("could not send message")
}
