package main

import "../vendor/xcb"
import "../vendor/xcb_errors"
import "../client"
import "windows"
import "layout"
import "grid"

import "core:fmt"
import "core:c/libc"
import "core:slice"
import "core:thread"
import "core:time"
import "core:strings"

// Main loop
cells :: proc() -> Maybe(client.XError) {

    // Create layout
    gr := grid.Grid {}
    gr.rows = 2
    gr.columns = 3

    // Get screen
    screen := xcb.setup_roots_iterator(xcb.get_setup(client.connection)).data
    screen_size := layout.Size { screen.width_in_pixels, screen.height_in_pixels }

    windows.gain_control(screen.root) or_return

    // Set some properties on the root window
    windows.set_prop(screen.root, client.lookup("_NET_SUPPORTED") or_return, xcb.ATOM_ATOM, []xcb.Atom {

        // supported client properties
        client.lookup("_NET_WM_USER_TIME") or_return,

    })

    windows.set_prop(screen.root, client.lookup("_NET_NUMBER_OF_DESKTOPS") or_return, xcb.ATOM_CARDINAL, u32(1))
    windows.set_prop(screen.root, client.lookup("_NET_DESKTOP_GEOMETRY")   or_return, xcb.ATOM_CARDINAL, []u32{ u32(screen.width_in_pixels), u32(screen.height_in_pixels) })
    windows.set_prop(screen.root, client.lookup("_NET_DESKTOP_VIEWPORT")   or_return, xcb.ATOM_CARDINAL, []u32{ 0, 0 })
    windows.set_prop(screen.root, client.lookup("_NET_CURRENT_DESKTOP")    or_return, xcb.ATOM_CARDINAL, u32(0))
        // TODO: _NET_WORKAREA, possibly _NET_VIRTUAL_ROOTS ?

    // Create tiny window for _NET_SUPPORTING_WM_CHECK
    support := xcb.generate_id(client.connection)

    client.check_cookie(
        xcb.create_window_checked(client.connection, xcb.COPY_FROM_PARENT, support, screen.root, 0, 0, 1, 1, 0, xcb.WINDOW_CLASS_INPUT_OUTPUT, xcb.COPY_FROM_PARENT, 0, nil),
        "Could not create window for _NET_SUPPORTING_WM_CHECK",
    ) or_return

    _NET_SUPPORTING_WM_CHECK := client.lookup("_NET_SUPPORTING_WM_CHECK") or_return
    windows.set_prop (screen.root, _NET_SUPPORTING_WM_CHECK, xcb.ATOM_WINDOW, support)
    windows.set_prop (support,     _NET_SUPPORTING_WM_CHECK, xcb.ATOM_WINDOW, support)
    windows.set_title(support, "astawm")

    // Get all top-level windows
    children := windows.get_children(screen.root) or_return

    for child in children {
        if !(windows.can_manipulate(child) or_return) do continue

        // add client to managed windows
        grid.insert(&gr, child, screen_size) or_return
    }

    delete(children)

    // event loop
    for {
        // Check connection
        error_code := xcb.connection_has_error(client.connection)
        if error_code != 0 {
            fmt.eprint("Connection with the X server crashed\n")
            return nil
        }

        // Wait for an event
        event := xcb.wait_for_event(client.connection)
        if event == nil do continue

        defer libc.free(event)

        switch event.response_type & 0x7f {
            case 0:
                client.print(client.convert(cast(^xcb.GenericError) event))

            case xcb.CLIENT_MESSAGE:
                cme := cast(^xcb.ClientMessageEvent) event

                if cme.type == (client.lookup("ASTA_PRINT") or_return) {
                    str := strings.string_from_null_terminated_ptr(&cme.data.data8[0], 20)
                    fmt.println(str)
                }

            case xcb.MAP_REQUEST:
                mre := cast(^xcb.MapRequestEvent) event

                // add client to managed windows
                grid.insert(&gr, mre.window, screen_size) or_return

                // map client
                xcb.map_window(client.connection, mre.window)
                xcb.flush(client.connection)

            case xcb.UNMAP_NOTIFY:
                umn := cast(^xcb.UnmapNotifyEvent) event
                grid.remove(&gr, umn.window)
        }
    }

    return nil
}

// Animations thread
animations :: proc(running : ^bool) {
    for running^ {
        windows.update_animations()
        xcb.flush(client.connection)
        time.accurate_sleep(time.Second / 60)
    }
}

// Main function
main :: proc() {
    // Connect to the X server
    if !client.connect() {
        fmt.eprint("Could not connect to the X server\n")
        return
    }
    defer client.disconnect()

    // Run
    running := true

    t := thread.create_and_start_with_poly_data(&running, animations)

    client.print_maybe(cells())

    running = false
    thread.join(t)
}
