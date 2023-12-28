package windows

import "../../vendor/xcb"
import "../../client"
import "../layout"

import "core:c/libc"
import "core:slice"
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

watch_focus :: proc(wid : xcb.Window) {
    mask := xcb.EVENT_MASK_FOCUS_CHANGE
    cookie := xcb.change_window_attributes(client.connection, wid, xcb.CW_EVENT_MASK, &mask)
}

do_map :: proc(wid : xcb.Window) {
    xcb.map_window(client.connection, wid)
}

focus :: proc(wid : xcb.Window) {
    xcb.set_input_focus(client.connection, xcb.INPUT_FOCUS_NONE, wid, xcb.CURRENT_TIME)
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
    return slice.clone(arr, alloc), nil
}

// Get the geometry of a window
get_geometry :: proc(wid : xcb.Window) -> (g : layout.Geometry, merr : Maybe(client.XError)) {
    cookie := xcb.get_geometry(client.connection, wid)
    err : ^xcb.GenericError = ---
    reply := xcb.get_geometry_reply(client.connection, cookie, &err)

    client.check(err, "Error getting geometry for window %d", wid) or_return
    defer libc.free(reply)

    return layout.geometry(
        reply.x,
        reply.y,
        reply.width,
        reply.height,
        reply.border_width,
    ), nil
}

set_geometry :: proc(wid: xcb.Window, using geometry: layout.Geometry) -> Maybe(client.XError) {
    cookie := xcb.configure_window(
        client.connection, wid,
        xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y | xcb.CONFIG_WINDOW_WIDTH | xcb.CONFIG_WINDOW_HEIGHT | xcb.CONFIG_WINDOW_BORDER_WIDTH,
        &[5]u32{
            u32(transmute(u16) x),
            u32(transmute(u16) y),
            u32(width),
            u32(height),
            u32(border_width),
        },
    )
    client.check_cookie(cookie, "Could not configure window") or_return
    return nil
}

set_position :: proc(wid: xcb.Window, pos: layout.Pos) -> Maybe(client.XError) {
    cookie := xcb.configure_window(
        client.connection, wid,
        xcb.CONFIG_WINDOW_X | xcb.CONFIG_WINDOW_Y,
        &[2]u32{
            u32(transmute(u16) pos.x),
            u32(transmute(u16) pos.y),
        },
    )
    client.check_cookie(cookie, "Could not configure window") or_return
    return nil
}

// Get window title
get_title :: proc(wid : xcb.Window, alloc := context.allocator) -> (str : string, e : Maybe(client.XError)) {
    // EWWH name
    reply := get_property_reply(wid, client.lookup("_NET_WM_NAME") or_return) or_return
    if (xcb.get_property_value_length(reply) == 0) {
        // ICCCM name
        libc.free(reply)
        reply = get_property_reply(wid, xcb.ATOM_WM_NAME) or_return
    }

    defer libc.free(reply)
    return transmute(string) slice.clone(slice_from_prop(reply, u8), alloc), nil
}

// Set window title
set_title :: proc(wid : xcb.Window, title : string) -> Maybe(client.XError) {
    set_prop(wid, client.lookup("_NET_WM_NAME") or_return, client.lookup("UTF8_STRING") or_return, title)
    return nil
}
