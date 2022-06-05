package main

import "vendor/xcb"
import "vendor/xcb_errors"
import "errors"
import "atoms"
import "windows"
import "desktop"

import "core:fmt"
import "core:c/libc"
import "core:slice"

// Main loop
cells :: proc(conn : ^xcb.Connection, ctx : ^xcb_errors.Context) -> Maybe(errors.X11Error) {
    // Get atoms
    atoms.init(conn) or_return

    // Get screen
    screen := xcb.setup_roots_iterator(xcb.get_setup(conn)).data
    windows.gain_control(conn, screen.root) or_return

    // Create virtual desktop
    vd := desktop.make(conn, screen, windows.Geometry {
        x = 0,
        y = 0,
        width = screen.width_in_pixels,
        height = screen.height_in_pixels,
        border_width = 0,
    }) or_return

    defer desktop.delete(conn, vd)

    // Get all top-level windows
    children := windows.get_children(conn, screen.root) or_return

    for child in children {
        // Place window within the virtual desktop
        if child == vd.viewport || !windows.can_manipulate(conn, child) or_return do continue

        // TODO: check if window should be tiled or should stay floating
        errors.print_maybe(
            ctx,
            desktop.grid_place_window(conn, &vd, child, 1, 1),
        )
    }

    delete(children)

    // flush commands
    xcb.flush(conn)

    // event loop
    for {
        // Check connection
        error_code := xcb.connection_has_error(conn)
        if error_code != 0 {
            fmt.print("Connection with the X server crashed\n")
            return nil
        }

        // Wait for an event
        event := xcb.wait_for_event(conn)
        if event == nil do continue

        defer libc.free(event)

        switch event.response_type {
            case 0:
                errors.print(
                    ctx,
                    errors.convert(cast(^xcb.GenericError) event),
                )

            case xcb.MAP_REQUEST:
                mre := cast(^xcb.MapRequestEvent) event
                errors.print_maybe(
                    ctx,
                    desktop.grid_place_window(conn, &vd, mre.window, 1, 1),
                )
                xcb.map_window(conn, mre.window)
                xcb.flush(conn)

            case xcb.CONFIGURE_REQUEST:
                cre := cast(^xcb.ConfigureRequestEvent) event

                // Copy fields
                fields : [7]u32 = ---
                i : uint = 0
        
                if cre.value_mask & xcb.CONFIG_WINDOW_X != 0 {
                    fields[i] = transmute(u32) i32(cre.x)
                    i += 1
                }
                if cre.value_mask & xcb.CONFIG_WINDOW_Y != 0 {
                    fields[i] = transmute(u32) i32(cre.y)
                    i += 1
                }
                if cre.value_mask & xcb.CONFIG_WINDOW_WIDTH != 0 {
                    fields[i] = u32(cre.width)
                    i += 1
                }
                if cre.value_mask & xcb.CONFIG_WINDOW_HEIGHT != 0 {
                    fields[i] = u32(cre.height)
                    i += 1
                }
                if cre.value_mask & xcb.CONFIG_WINDOW_BORDER_WIDTH != 0 {
                    fields[i] = u32(cre.border_width)
                    i += 1
                }
                if cre.value_mask & xcb.CONFIG_WINDOW_SIBLING != 0 {
                    fields[i] = u32(cre.sibling)
                    i += 1
                }
                if cre.value_mask & xcb.CONFIG_WINDOW_STACK_MODE != 0 {
                    fields[i] = u32(cre.stack_mode)
                    i += 1
                }
        
                // Forward the request
                xcb.configure_window(conn, cre.window, cre.value_mask, &fields)
                xcb.flush(conn)

            case xcb.UNMAP_NOTIFY:
                umn := cast(^xcb.UnmapNotifyEvent) event

                // Ignore if triggered by reparenting
                if umn.event == screen.root do break

                // Remove window from virtual desktop
                desktop.remove_window(conn, screen, &vd, umn.window)
                xcb.flush(conn)
        }
    }

    return nil
}

// Connect to the X server
connect :: proc() -> (^xcb.Connection, bool) {
    screen_index : i32 = ---
    conn := xcb.connect(nil, &screen_index)

    if conn == nil || xcb.connection_has_error(conn) != 0 {
        xcb.disconnect(conn)
        fmt.print("Could not connect to the X server\n")
        return ---, false
    }

    return conn, true
}

// Main function
main :: proc() {
    // Connect to the X server
    conn, ok := connect()
    if !ok do return
    defer xcb.disconnect(conn)

    // Create xcb error context
    ctx : ^xcb_errors.Context = ---
    _ = xcb_errors.context_new(conn, &ctx)
    defer xcb_errors.context_free(ctx)

    // Run
    errors.print_maybe(
        ctx,
        cells(conn, ctx),
    )
}
