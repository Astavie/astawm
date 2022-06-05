package server

import "../vendor/xcb"

import "core:fmt"

Server :: struct {
    conn : ^xcb.Connection,
    screen : ^xcb.Screen,

    _NET_WM_NAME : xcb.Atom,
}

// Connect to the X server
connect :: proc() -> (^Server, bool) {
    using s := new(Server)

    screen_index : i32 = ---
    conn = xcb.connect(nil, &screen_index)

    if conn == nil || xcb.connection_has_error(conn) != 0 {
        xcb.disconnect(conn)
        fmt.print("Could not connect to the X server\n")
        return nil, false
    }

    screen = xcb.setup_roots_iterator(xcb.get_setup(conn)).data

    return s, true
}

// Disconnect from the X server
disconnect :: proc(using s : ^Server) {
    xcb.disconnect(conn)
    free(s)
}
