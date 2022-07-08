package main

import "vendor/xcb"
import "vendor/xcb_errors"
import "windows"
import "layout"
import "wm"
import "util"

import "core:fmt"
import "core:c/libc"
import "core:slice"
import "core:thread"
import "core:time"

refresh_layout :: proc(clients : []xcb.Window, lyt : layout.Layout, data : layout.LayoutData, size : util.Size, new : Maybe(xcb.Window) = nil) -> Maybe(wm.X11Error) {

    for rect, idx in layout.calc_inner_layout(lyt, data, size) {
        if clients[idx] == new {
            xcb.configure_window(wm.connection, clients[idx], 31, &[5]u32{
                u32(transmute(u16) rect.x),
                u32(transmute(u16) rect.y),
                u32(rect.width),
                u32(rect.height),
                0,
            })
        } else {
            windows.animate_to({ rect, 0 }, 15, 1, clients[idx]) or_return
        }
    }

    return nil

}

// Main loop
cells :: proc(ctx : ^xcb_errors.Context) -> Maybe(wm.X11Error) {

    // Create layout
    lyt := cast(layout.Layout) layout.MetaLayout {
        &cast(layout.Layout) layout.SeriesLayout { {8, 8, 8, 8}, 8, 0, layout.Series.COLUMN, false },
        &cast(layout.Layout) layout.SeriesLayout { {},           8, 2, layout.Series.ROW,    false },
    }
    data : layout.LayoutData
    
    // Get screen
    screen := xcb.setup_roots_iterator(xcb.get_setup(wm.connection)).data
    windows.gain_control(screen.root) or_return

    // Get all top-level windows
    children := windows.get_children(screen.root) or_return

    clients_mapped := make([dynamic]xcb.Window, 0, len(children))
    clients_stack  := make([dynamic]xcb.Window, 0, len(children))

    for child in children {
        if !windows.can_manipulate(child) or_return do continue

        // add client to managed windows
        append(&clients_mapped, child)
        append(&clients_stack, child)

        ok := layout.insert_last(lyt, &data)
        if !ok do panic("could not fit window into layout")
    }

    delete(children)

    // refresh
    wm.print_maybe(
        ctx,
        refresh_layout(clients_stack[:], lyt, data, { screen.width_in_pixels, screen.height_in_pixels }),
    )
    xcb.flush(wm.connection)

    // event loop
    for {
        // Check connection
        error_code := xcb.connection_has_error(wm.connection)
        if error_code != 0 {
            fmt.print("Connection with the X server crashed\n")
            return nil
        }

        // Wait for an event
        event := xcb.wait_for_event(wm.connection)
        if event == nil do continue

        defer libc.free(event)

        switch event.response_type {
            case 0:
                wm.print(
                    ctx,
                    wm.convert(cast(^xcb.GenericError) event),
                )

            case xcb.MAP_REQUEST:
                mre := cast(^xcb.MapRequestEvent) event

                // add client to managed windows
                append(&clients_mapped, mre.window)
                append(&clients_stack, mre.window)
        
                ok := layout.insert_last(lyt, &data)
                if !ok do panic("could not fit window into layout")

                // refresh
                wm.print_maybe(
                    ctx,
                    refresh_layout(clients_stack[:], lyt, data, { screen.width_in_pixels, screen.height_in_pixels }, mre.window),
                )

                // map client
                xcb.map_window(wm.connection, mre.window)
                xcb.flush(wm.connection)

            case xcb.UNMAP_NOTIFY:
                umn := cast(^xcb.UnmapNotifyEvent) event

                if idx, ok := slice.linear_search(clients_stack[:], umn.window); ok {
                    layout.remove(lyt, &data, u16(idx))
                    ordered_remove(&clients_stack, idx)

                    map_idx, ok := slice.linear_search(clients_mapped[:], umn.window)
                    if !ok do panic("window is in stack-ordered array but not map-ordered array")
                    ordered_remove(&clients_mapped, map_idx)

                    refresh_layout(clients_stack[:], lyt, data, { screen.width_in_pixels, screen.height_in_pixels })
                    xcb.flush(wm.connection)
                }
        }
    }

    return nil
}

// Animations thread
animations :: proc(running : ^bool) {
    for running^ {
        windows.update_animations()
        xcb.flush(wm.connection)
        time.accurate_sleep(time.Second / 60)
    }
}

// Main function
main :: proc() {
    // Connect to the X server
    if !wm.connect() do return
    defer wm.disconnect()

    // Create xcb error context
    ctx : ^xcb_errors.Context = ---
    _ = xcb_errors.context_new(wm.connection, &ctx)
    defer xcb_errors.context_free(ctx)

    // Run
    running := true

    t := thread.create_and_start_with_poly_data(&running, animations)

    wm.print_maybe(
        ctx,
        cells(ctx),
    )

    running = false
    thread.join(t)
}
