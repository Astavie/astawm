package windows

import "../vendor/xcb"
import "../wm/errors"
import "../wm"

import "core:c/libc"
import "core:mem"

// Checks if this window manager should be able to manipulate a specific window
can_manipulate :: proc(using s : ^wm.WindowManager, wid : xcb.Window) -> (b : bool, merr : Maybe(errors.X11Error)) {
    cookie := xcb.get_window_attributes(conn, wid)

    err : ^xcb.GenericError = ---
    attr := xcb.get_window_attributes_reply(conn, cookie, &err)

    errors.check(err, "Could not get window attributes for window %d\n", wid) or_return
    defer libc.free(attr)

    return attr.override_redirect == 0 && attr.map_state == xcb.MAP_STATE_VIEWABLE, nil
}

// Gain control of a window
gain_control :: proc(using s : ^wm.WindowManager, wid : xcb.Window) -> Maybe(errors.X11Error) {
    mask := xcb.EVENT_MASK_SUBSTRUCTURE_REDIRECT | xcb.EVENT_MASK_SUBSTRUCTURE_NOTIFY
    cookie := xcb.change_window_attributes_checked(conn, wid, xcb.CW_EVENT_MASK, &mask)

    errors.check_cookie(conn, cookie, "Could not gain control of window %d\n", wid) or_return
    return nil
}

// Get children of window
get_children :: proc(using s : ^wm.WindowManager, wid : xcb.Window, alloc := context.allocator) -> (w : []xcb.Window, e : Maybe(errors.X11Error)) {
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
