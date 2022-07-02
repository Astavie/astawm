package main

import "vendor/xcb"
import "vendor/xcb_errors"
import "windows"
import "desktop"
import "wm"
import "util"

import "core:fmt"
import "core:c/libc"
import "core:slice"
import "core:thread"
import "core:time"

// Main loop
cells :: proc(ctx : ^xcb_errors.Context) -> Maybe(wm.X11Error) {
    // Get screen
    screen := xcb.setup_roots_iterator(xcb.get_setup(wm.connection)).data
    windows.gain_control(screen.root) or_return

    // Get all top-level windows
    children := windows.get_children(screen.root) or_return

    // Create virtual desktop
    vd := desktop.create(screen, util.geometry(
        x = i16(screen.width_in_pixels / 2),
        y = 0,
        width = screen.width_in_pixels / 2,
        height = screen.height_in_pixels,
        border_width = 0,
    )) or_return

    defer desktop.destroy(vd)

    for child in children {
        // Place window within the virtual desktop
        if !windows.can_manipulate(child) or_return do continue

        // TODO: check if window should be tiled or should stay floating
        wm.print_maybe(
            ctx,
            desktop.grid_place_window(vd, child, 1, 1),
        )
    }

    delete(children)

    // flush commands
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
                wm.print_maybe(
                    ctx,
                    desktop.grid_place_window(vd, mre.window, 1, 1),
                )
                xcb.map_window(wm.connection, mre.window)
                xcb.flush(wm.connection)

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
                xcb.configure_window(wm.connection, cre.window, cre.value_mask, &fields)
                xcb.flush(wm.connection)

            case xcb.UNMAP_NOTIFY:
                umn := cast(^xcb.UnmapNotifyEvent) event

                // Ignore if triggered by reparenting
                if umn.event == screen.root do break

                // Remove window from virtual desktop
                desktop.remove_window(vd, umn.window)
                xcb.flush(wm.connection)
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
