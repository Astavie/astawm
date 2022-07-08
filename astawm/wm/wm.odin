package wm

import "../../vendor/xcb"

import "core:fmt"

connection : ^xcb.Connection

// Connect to the X server
connect :: proc() -> bool {
    connection = xcb.connect(nil, nil)

    if connection == nil || xcb.connection_has_error(connection) != 0 {
        disconnect()
        fmt.print("Could not connect to the X server\n")
        return false
    }

    if _, ok := atoms_init().?; ok {
        disconnect()
        fmt.print("Could not load atoms\n")
        return false
    }

    return true
}

// Disconnect from the X server
disconnect :: proc() {
    xcb.disconnect(connection)
    connection = nil
}
