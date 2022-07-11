package main

import "../vendor/xcb"

import "../client"
import "core:c/libc"
import "core:mem"
import "core:fmt"
import "core:intrinsics"

to_fixed_array :: proc(str : string, $N : int) -> (result : [N]u8) {
    length := len(str)
    assert(length < N)

    mem.copy_non_overlapping(&result[0], &(transmute([]u8) str)[0], length * size_of(u8))
    return
}

unwrap_value :: proc(a : $T, e : Maybe(client.XError)) -> T {
    if err, ok := e.?; ok {
        client.print(err)
        intrinsics.trap()
    } else {
        return a
    }
}

unwrap_void :: proc(e : Maybe(client.XError)) {
    if err, ok := e.?; ok {
        client.print(err)
        intrinsics.trap()
    }
}

unwrap :: proc { unwrap_value, unwrap_void }

main :: proc() {
    // connect
    if !client.connect() {
        fmt.eprint("Could not connect to the X server\n")
        return
    }
    defer client.disconnect()

    // get root
    root := xcb.setup_roots_iterator(xcb.get_setup(client.connection)).data.root

    // get atom
    ASTA_PRINT := unwrap(client.lookup("ASTA_PRINT"))

    // send message
    msg := xcb.ClientMessageEvent {
        xcb.CLIENT_MESSAGE,
        8,
        0,
        root,
        ASTA_PRINT,
        { data8 = to_fixed_array("Ahoy matie!", 20) },
    }

    cookie := xcb.send_event_checked(client.connection, 0, root, xcb.EVENT_MASK_SUBSTRUCTURE_NOTIFY | xcb.EVENT_MASK_SUBSTRUCTURE_REDIRECT, transmute(cstring) &msg)
    unwrap(client.check_cookie(cookie, "Could not send client message"))
}
