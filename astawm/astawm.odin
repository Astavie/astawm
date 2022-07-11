package main

import "../vendor/xcb"
import "../vendor/xcb_errors"
import "../client"
import "windows"
import "layout"

import "core:fmt"
import "core:c/libc"
import "core:slice"
import "core:thread"
import "core:time"
import "core:strings"

refresh_layout :: proc(wids : []xcb.Window, lyt : layout.Layout, data : layout.LayoutData, size : layout.Size, new : Maybe(xcb.Window) = nil) -> Maybe(client.XError) {

    for rect, idx in layout.calc_inner_layout(lyt, data, size) {
        if wids[idx] == new {
            xcb.configure_window(client.connection, wids[idx], 31, &[5]u32{
                u32(transmute(u16) rect.x),
                u32(transmute(u16) rect.y),
                u32(rect.width),
                u32(rect.height),
                0,
            })
        } else {
            windows.animate_to({ rect, 0 }, 15, 1, wids[idx]) or_return
        }
    }

    return nil

}

// Main loop
cells :: proc() -> Maybe(client.XError) {

    // Create layout
    lyt := cast(layout.Layout) layout.MetaLayout {
        &cast(layout.Layout) layout.SeriesLayout { {8, 8, 8, 8}, 8, 0, layout.Series.COLUMN, false },
        &cast(layout.Layout) layout.SeriesLayout { {},           8, 2, layout.Series.ROW,    false },
    }
    data : layout.LayoutData

    // Get screen
    screen := xcb.setup_roots_iterator(xcb.get_setup(client.connection)).data
    windows.gain_control(screen.root) or_return

    // Set some properties on the root window
    windows.set_prop(screen.root, client.lookup("_NET_SUPPORTED") or_return, xcb.ATOM_ATOM, []xcb.Atom {

        // supported client properties
        client.lookup("_NET_WM_USER_TIME") or_return,

    })

    windows.set_prop(screen.root, client.lookup("_NET_NUMBER_OF_DESKTOPS") or_return, xcb.ATOM_CARDINAL, 1)
    windows.set_prop(screen.root, client.lookup("_NET_DESKTOP_GEOMETRY")   or_return, xcb.ATOM_CARDINAL, []u32{ u32(screen.width_in_pixels), u32(screen.height_in_pixels) })
    windows.set_prop(screen.root, client.lookup("_NET_DESKTOP_VIEWPORT")   or_return, xcb.ATOM_CARDINAL, []u32{ 0, 0 })
    windows.set_prop(screen.root, client.lookup("_NET_CURRENT_DESKTOP")    or_return, xcb.ATOM_CARDINAL, 0)
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

    wids_mapped := make([dynamic]xcb.Window, 0, len(children))
    wids_stack  := make([dynamic]xcb.Window, 0, len(children))

    for child in children {
        if !windows.can_manipulate(child) or_return do continue

        // add client to managed windows
        append(&wids_mapped, child)
        append(&wids_stack, child)

        ok := layout.insert_last(lyt, &data)
        if !ok do panic("Could not fit window into layout")
    }

    delete(children)

    // refresh
    client.print_maybe(refresh_layout(wids_stack[:], lyt, data, { screen.width_in_pixels, screen.height_in_pixels }))
    xcb.flush(client.connection)

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

                if cme.type == client.lookup("ASTA_PRINT") or_return {
                    str := strings.string_from_nul_terminated_ptr(&cme.data.data8[0], 20)
                    fmt.println(str)
                }

            case xcb.MAP_REQUEST:
                mre := cast(^xcb.MapRequestEvent) event

                // add client to managed windows
                append(&wids_mapped, mre.window)
                append(&wids_stack, mre.window)

                ok := layout.insert_last(lyt, &data)
                if !ok do panic("Could not fit window into layout")

                // refresh
                client.print_maybe(refresh_layout(wids_stack[:], lyt, data, { screen.width_in_pixels, screen.height_in_pixels }, mre.window))

                // map client
                xcb.map_window(client.connection, mre.window)
                xcb.flush(client.connection)

            case xcb.UNMAP_NOTIFY:
                umn := cast(^xcb.UnmapNotifyEvent) event

                if idx, ok := slice.linear_search(wids_stack[:], umn.window); ok {
                    layout.remove(lyt, &data, u16(idx))
                    ordered_remove(&wids_stack, idx)

                    map_idx, ok := slice.linear_search(wids_mapped[:], umn.window)
                    if !ok do panic("window is in stack-ordered array but not map-ordered array")
                    ordered_remove(&wids_mapped, map_idx)

                    refresh_layout(wids_stack[:], lyt, data, { screen.width_in_pixels, screen.height_in_pixels })
                    xcb.flush(client.connection)
                }
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
