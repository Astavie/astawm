package wm

import "../vendor/xcb"

import "core:fmt"
import "core:sync"

WindowManager :: struct {
    conn : ^xcb.Connection,
    screen : ^xcb.Screen,

    // Animation info, should not be accessed outside this package

    animation_mutex : sync.Recursive_Mutex,
    animations : map[xcb.Window][dynamic]Animation,
    
    // NOTE: if it seems animations desync window geometries over time, it might be best to also keep track of the desired final geometry

    // ATOMS

    _NET_WM_NAME : xcb.Atom,
}

// Connect to the X server
connect :: proc() -> (^WindowManager, bool) {
    using s := new(WindowManager)
    animations = make(map[xcb.Window][dynamic]Animation)

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
disconnect :: proc(using s : ^WindowManager) {
    xcb.disconnect(conn)
    delete(animations)
    free(s)
}