package windows

import "../../vendor/xcb"
import "../../client"

import "core:c/libc"
import "core:slice"
import "core:mem"
import "core:intrinsics"
import "core:strings"

// Get atom value for window
@private
get_property_reply :: proc(wid : xcb.Window, prop : xcb.Atom) -> (reply : ^xcb.GetPropertyReply, merr : Maybe(client.XError)) {
    cookie := xcb.get_property(client.connection, 0, wid, prop, xcb.GET_PROPERTY_TYPE_ANY, 0, ~u32(0))
    err : ^xcb.GenericError = ---
    reply = xcb.get_property_reply(client.connection, cookie, &err)

    client.check(err, "Could not get value for property atom %d of window %d", prop, wid) or_return

    return reply, nil
}

// Turns an atom value into a string
@private
slice_from_prop :: proc(reply : ^xcb.GetPropertyReply, $E: typeid) -> []E {
    ptr := cast(^E) xcb.get_property_value(reply)
    len := cast(int) xcb.get_property_value_length(reply) / size_of(E)
    return slice.from_ptr(ptr, len)
}

// Get value for window
get_val :: proc(wid : xcb.Window, prop : xcb.Atom, $T : typeid) -> (t : T, e : Maybe(client.XError))
where intrinsics.type_is_numeric(T) || intrinsics.type_is_struct(T) {

    reply := get_property_reply(wid, prop) or_return
    defer libc.free(reply)
    return (cast(^T) xcb.get_property_value(reply))^, nil
}

// Get slice value for window
get_slice :: proc(wid : xcb.Window, prop : xcb.Atom, $T : typeid/[]$E, alloc := context.allocator) -> (t : T, e : Maybe(client.XError))
where intrinsics.type_is_numeric(E) || intrinsics.type_is_struct(E) {

    reply := get_property_reply(wid, prop) or_return
    defer libc.free(reply)
    return slice.clone(slice_from_prop(reply, E), alloc), nil
}

// Get string value for window
get_string :: proc(wid : xcb.Window, prop : xcb.Atom, $T : typeid/string, alloc := context.allocator) -> (s : string, e : Maybe(client.XError)) {
    str, err := get_slice(wid, prop, []u8, alloc)
    return transmute(string) str, err
}

// Get slice of strings (assumes property contains NULL-terminated strings)
get_string_slice :: proc(wid : xcb.Window, prop : xcb.Atom, $T : typeid/[]string, alloc := context.allocator) -> (s : []string, e : Maybe(client.XError)) {
    reply := get_property_reply(wid, prop) or_return
    defer libc.free(reply)

    arr := slice_from_prop(reply, u8)
    strings := make([]string, slice.count(arr, 0), alloc)

    start := 0
    idx := 0
    for c, i in arr {
        if c == 0 {
            strings[idx] = transmute(string) slice.clone(arr[start:i], alloc)
            idx += 1
            start = i + 1
        }
    }

    return strings, nil
}

get_prop :: proc { get_val, get_slice, get_string, get_string_slice }

@private
terminate_string :: proc(s : string, alloc := context.allocator) -> []u8 {
    arr := make([]u8, len(s) + 1, alloc)
    mem.copy_non_overlapping(&arr[0], &(transmute([]u8) s)[0], len(s) * size_of(u8))
    return arr
}

@private
terminate_string_slice :: proc(s : []string, alloc := context.allocator) -> []u8 {
    size := 0
    for str in s {
        size += len(str) + 1
    }

    arr := make([]u8, size, alloc)
    start := 0
    for str in s {
        mem.copy_non_overlapping(&arr[start], &(transmute([]u8) str)[0], len(str) * size_of(u8))
        start += len(str) + 1
    }

    return arr
}

STRUCT_FORMAT :: 32

set_val :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, t : $T, format : u8 = u8(size_of(T) * 8) when intrinsics.type_is_numeric(T) else STRUCT_FORMAT)
where intrinsics.type_is_numeric(T) || intrinsics.type_is_struct(T) {
    size := u32(size_of(T) * 8 / format)
    tmp := t
    xcb.change_property(client.connection, xcb.PROP_MODE_REPLACE, wid, prop, type, format, size, &tmp)
}

set_slice :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, t : []$T, format : u8 = u8(size_of(T) * 8) when intrinsics.type_is_numeric(T) else STRUCT_FORMAT)
where intrinsics.type_is_numeric(T) || intrinsics.type_is_struct(T) {
    size := u32(size_of(T) * 8 / format)
    xcb.change_property(client.connection, xcb.PROP_MODE_REPLACE, wid, prop, type, format, u32(len(t)) * size, &t[0])
}

set_string :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, s : string) {
    // Properties that contain a single string are not NULL-terminated
    set_slice(wid, prop, type, transmute([]u8) s)
}

set_string_slice :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, s : []string) {
    set_slice(wid, prop, type, terminate_string_slice(s, context.temp_allocator))
}

set_prop :: proc { set_val, set_slice, set_string, set_string_slice }

prepend_val :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, t : $T, format : u8 = u8(size_of(T) * 8) when intrinsics.type_is_numeric(T) else STRUCT_FORMAT)
where intrinsics.type_is_numeric(T) || intrinsics.type_is_struct(T) {
    size := u32(size_of(T) * 8 / format)
    tmp := t
    xcb.change_property(client.connection, xcb.PROP_MODE_PREPEND, wid, prop, type, format, size, &tmp)
}

prepend_slice :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, t : []$T, format : u8 = u8(size_of(T) * 8) when intrinsics.type_is_numeric(T) else STRUCT_FORMAT)
where intrinsics.type_is_numeric(T) || intrinsics.type_is_struct(T) {
    size := u32(size_of(T) * 8 / format)
    xcb.change_property(client.connection, xcb.PROP_MODE_PREPEND, wid, prop, type, format, u32(len(t)) * size, &t[0])
}

prepend_string :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, s : string) {
    prepend_slice(wid, prop, type, terminate_string(s, context.temp_allocator))
}

prepend_string_slice :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, s : []string) {
    prepend_slice(wid, prop, type, terminate_string_slice(s, context.temp_allocator))
}

prepend_prop :: proc { prepend_val, prepend_slice, prepend_string, prepend_string_slice }

append_val :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, t : $T, format := u8(size_of(T) * 8) when intrinsics.type_is_numeric(T) else STRUCT_FORMAT)
where intrinsics.type_is_numeric(T) || intrinsics.type_is_struct(T) {
    size := u32(size_of(T) * 8 / format)
    tmp := t
    xcb.change_property(client.connection, xcb.PROP_MODE_APPEND, wid, prop, type, format, size, &tmp)
}

append_slice :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, t : $T/[]$E, format : u8 = u8(size_of(E) * 8) when intrinsics.type_is_numeric(E) else STRUCT_FORMAT)
where intrinsics.type_is_numeric(E) || intrinsics.type_is_struct(E) {
    size := u32(size_of(E) * 8 / format)
    xcb.change_property(client.connection, xcb.PROP_MODE_APPEND, wid, prop, type, format, u32(len(t)) * size, &t[0])
}

append_string :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, s : string) {
    append_slice(wid, prop, type, terminate_string(s, context.temp_allocator))
}

append_string_slice :: proc(wid : xcb.Window, prop : xcb.Atom, type : xcb.Atom, s : []string) {
    append_slice(wid, prop, type, terminate_string_slice(s, context.temp_allocator))
}

append_prop :: proc { append_val, append_slice, append_string, append_string_slice }
