package client

import "../../vendor/xcb"
import "../../vendor/xcb_errors"

import "core:fmt"
import "core:c/libc"
import "core:mem"

XError :: struct {
    error_code : u8,
    major_code : u8,
    minor_code : u16,

    message    : string,
    args       : []any,
}

// Print an error to the console
print :: proc(ctx : ^xcb_errors.Context, err : XError) {
    fmt.eprint("XError: ")
    fmt.eprintf(err.message, ..err.args)
    fmt.eprintln()

    fmt.eprintf("  %s\n", xcb_errors.get_name_for_error(ctx, err.error_code, nil))
    fmt.eprintf("  %s\n", xcb_errors.get_name_for_major_code(ctx, err.major_code))
    fmt.eprintf("  %s\n", xcb_errors.get_name_for_minor_code(ctx, err.major_code, err.minor_code))
}

print_maybe :: proc(ctx : ^xcb_errors.Context, err : Maybe(XError)) {
    if err, ok := err.?; ok do print(ctx, err)
}

// Checks if an xcb GenericError is not nil, returns said error
check :: proc(err : ^xcb.GenericError, msg : string, args: ..any) -> Maybe(XError) {
    if err != nil {
        defer libc.free(err)
        xerr := convert(err)
        xerr.message = msg
        xerr.args = args
        return xerr
    }
    return nil
}

// Checks an xcb cookie and if it caused an error, returns said error
check_cookie :: proc(cookie : xcb.VoidCookie, msg : string, args: ..any) -> Maybe(XError) {
    return check(xcb.request_check(connection, cookie), msg, ..args)
}

// Turn xcb error into cells error
convert :: #force_inline proc(error : ^xcb.GenericError) -> XError {
    return XError {
        error_code = error.error_code,
        major_code = error.major_code,
        minor_code = error.minor_code,
    }
}
