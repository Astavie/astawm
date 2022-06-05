package errors

import "../server"
import "../vendor/xcb"
import "../vendor/xcb_errors"

import "core:fmt"
import "core:c/libc"
import "core:mem"

X11Error :: struct {
    error_code : u8,
    major_code : u8,
    minor_code : u16,
}

// Print an error to the console
print :: proc(ctx : ^xcb_errors.Context, err : X11Error) {
    fmt.printf("X11 Error: %s\n", xcb_errors.get_name_for_error(ctx, err.error_code, nil))
    fmt.printf("\t%s\n", xcb_errors.get_name_for_major_code(ctx, err.major_code))
    fmt.printf("\t%s\n", xcb_errors.get_name_for_minor_code(ctx, err.major_code, err.minor_code))
}

print_maybe :: proc(ctx : ^xcb_errors.Context, err : Maybe(X11Error)) {
    if err, ok := err.?; ok do print(ctx, err)
}

// Checks if an xcb GenericError is not nil, returns said error
check :: proc(err : ^xcb.GenericError, msg : string, args: ..any) -> Maybe(X11Error) {
    if err != nil {
        defer libc.free(err)
        fmt.printf(msg, ..args)
        return convert(err)
    }
    return nil
}

// Checks an xcb cookie and if it caused an error, returns said error
check_cookie :: proc(using s : ^server.Server, cookie : xcb.VoidCookie, msg : string, args: ..any) -> Maybe(X11Error) {
    return check(xcb.request_check(conn, cookie), msg, ..args)
}

// Turn xcb error into cells error
convert :: proc(error : ^xcb.GenericError) -> X11Error {
    return X11Error {
        error_code = error.error_code,
        major_code = error.major_code,
        minor_code = error.minor_code,
    }
}
