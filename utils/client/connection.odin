package client

import "../../vendor/xcb"

connection : ^xcb.Connection

// Connect to the X server
connect :: proc() -> bool {
    connection = xcb.connect(nil, nil)

    if connection == nil || xcb.connection_has_error(connection) != 0 {
        disconnect()
        return false
    }

    return true
}

// Disconnect from the X server
disconnect :: proc() {
    xcb.disconnect(connection)
    connection = nil
}
