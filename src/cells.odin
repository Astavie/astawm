package main

import "vendor/xcb"
import "vendor/xcb_errors"
import "wm/errors"
import "atoms"
import "windows"
import "desktop"
import "wm"

import "core:fmt"
import "core:c/libc"
import "core:slice"
import "core:thread"
import "core:time"

// Main loop
cells :: proc(using s : ^wm.WindowManager, ctx : ^xcb_errors.Context) -> Maybe(errors.X11Error) {
    // Get atoms
    atoms.init(s) or_return

    // Get screen
    windows.gain_control(s, screen.root) or_return

    // Create virtual desktop
    vd := desktop.new(windows.Geometry {
        x = 0,
        y = 0,
        width = screen.width_in_pixels,
        height = screen.height_in_pixels,
        border_width = 0,
    }) or_return

    defer desktop.free(vd)

    // Get all top-level windows
    children := windows.get_children(s, screen.root) or_return

    for child in children {
        // Place window within the virtual desktop
        if !windows.can_manipulate(s, child) or_return do continue

        // TODO: check if window should be tiled or should stay floating
        errors.print_maybe(
            ctx,
            desktop.grid_place_window(s, vd, child, 1, 1),
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
                    desktop.grid_place_window(s, vd, mre.window, 1, 1),
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

                // Remove window from virtual desktop
                desktop.remove_window(vd, umn.window)
                xcb.flush(conn)
        }
    }

    return nil
}

// Animations thread
animations :: proc(using s : ^wm.WindowManager, running : ^bool) {
    for running^ {
        wm.update_animations(s)
        xcb.flush(conn)
        time.accurate_sleep(time.Second / 60)
    }
}

// Main function
main :: proc() {
    // Connect to the X server
    s, ok := wm.connect()
    if !ok do return
    defer wm.disconnect(s)

    // Create xcb error context
    ctx : ^xcb_errors.Context = ---
    _ = xcb_errors.context_new(s.conn, &ctx)
    defer xcb_errors.context_free(ctx)

    // Run
    running := true

    t := thread.create_and_start_with_poly_data2(s, &running, animations)

    errors.print_maybe(
        ctx,
        cells(s, ctx),
    )

    running = false
    thread.join(t)
}
