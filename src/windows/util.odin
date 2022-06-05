package windows

import "../vendor/xcb"
import "../errors"

import "core:c/libc"
import "core:mem"

// Checks if this window manager should be able to manipulate a specific window
can_manipulate :: proc(conn : ^xcb.Connection, wid : xcb.Window) -> (b : bool, merr : Maybe(errors.X11Error)) {
    cookie := xcb.get_window_attributes(conn, wid)

    err : ^xcb.GenericError = ---
    attr := xcb.get_window_attributes_reply(conn, cookie, &err)

    errors.check(err, "Could not get window attributes for window %d\n", wid) or_return
    defer libc.free(attr)

    return attr.override_redirect == 0 && attr.map_state == xcb.MAP_STATE_VIEWABLE, nil
}

// Gain control of a window
gain_control :: proc(conn : ^xcb.Connection, wid : xcb.Window) -> Maybe(errors.X11Error) {
    mask := xcb.EVENT_MASK_SUBSTRUCTURE_REDIRECT | xcb.EVENT_MASK_SUBSTRUCTURE_NOTIFY
    cookie := xcb.change_window_attributes_checked(conn, wid, xcb.CW_EVENT_MASK, &mask)

    errors.check_cookie(conn, cookie, "Could not gain control of window %d\n", wid) or_return
    return nil
}

// Get children of window
get_children :: proc(conn : ^xcb.Connection, wid : xcb.Window, alloc := context.allocator) -> (w : []xcb.Window, e : Maybe(errors.X11Error)) {
    cookie := xcb.query_tree(conn, wid)
    
    err : ^xcb.GenericError = ---
    tree := xcb.query_tree_reply(conn, cookie, &err)

    errors.check(err, "Could not query the window tree\n") or_return
    defer libc.free(tree)

    ptr := xcb.query_tree_children(tree)
    len := cast(int) xcb.query_tree_children_length(tree)

    arr := mem.slice_ptr(ptr, len)
    return mem.clone_slice(arr, alloc), nil
}

// Move window
move_unchecked :: proc(conn : ^xcb.Connection, wid : xcb.Window, x, y : i16) {
    geometry_maybe := get_geometry_unchecked(conn, wid)
    if geometry_maybe == nil do return

    geometry := geometry_maybe.?

    xcb.configure_window(conn, wid, xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y, &[2]u32{
        transmute(u32) i32(geometry.x + x),
        transmute(u32) i32(geometry.y + y),
    })
}

// Resize window
resize_checked :: proc(conn : ^xcb.Connection, wid : xcb.Window, left, top, right, bottom : i16) -> Maybe(errors.X11Error) {
    geometry := get_geometry(conn, wid) or_return

    errors.check_cookie(
        conn,
        xcb.configure_window_checked(conn, wid, xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y | xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT, &[4]u32{
            transmute(u32) i32(geometry.x - left),
            transmute(u32) i32(geometry.y - top),
            u32(i16(geometry.width) + right + left),
            u32(i16(geometry.height) + bottom + top),
        }),
        "Could not resize window %d\n", wid,
    ) or_return

    return nil
}
