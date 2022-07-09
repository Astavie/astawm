package windows

import "../../vendor/xcb"
import "../../client"

import "core:c/libc"
import "core:mem"

// Checks if this window manager should be able to manipulate a specific window
can_manipulate :: proc(wid : xcb.Window) -> (b : bool, merr : Maybe(client.XError)) {
    cookie := xcb.get_window_attributes(client.connection, wid)

    err : ^xcb.GenericError = ---
    attr := xcb.get_window_attributes_reply(client.connection, cookie, &err)

    client.check(err, "Could not get window attributes for window %d", wid) or_return
    defer libc.free(attr)

    return attr.override_redirect == 0 && attr.map_state == xcb.MAP_STATE_VIEWABLE, nil
}

// Gain control of a window
gain_control :: proc(wid : xcb.Window) -> Maybe(client.XError) {
    mask := xcb.EVENT_MASK_SUBSTRUCTURE_REDIRECT | xcb.EVENT_MASK_SUBSTRUCTURE_NOTIFY
    cookie := xcb.change_window_attributes_checked(client.connection, wid, xcb.CW_EVENT_MASK, &mask)

    client.check_cookie(cookie, "Could not gain control of window %d", wid) or_return
    return nil
}

// Get children of window
get_children :: proc(wid : xcb.Window, alloc := context.allocator) -> (w : []xcb.Window, e : Maybe(client.XError)) {
    cookie := xcb.query_tree(client.connection, wid)
    
    err : ^xcb.GenericError = ---
    tree := xcb.query_tree_reply(client.connection, cookie, &err)

    client.check(err, "Could not query the window tree") or_return
    defer libc.free(tree)

    ptr := xcb.query_tree_children(tree)
    len := cast(int) xcb.query_tree_children_length(tree)

    arr := mem.slice_ptr(ptr, len)
    return mem.clone_slice(arr, alloc), nil
}
