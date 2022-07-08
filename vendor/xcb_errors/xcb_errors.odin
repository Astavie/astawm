package xcb_errors

foreign import xcb_errors "system:xcb-errors"

import _c "core:c"
import xbc "../xcb"

__XCB_ERRORS_H__ :: 1

Context :: struct {}

@(default_calling_convention="c")
foreign xcb_errors {

    @(link_name="xcb_errors_context_new")
    context_new :: proc(conn : ^xbc.Connection, ctx : ^^Context) -> _c.int ---

    @(link_name="xcb_errors_context_free")
    context_free :: proc(ctx : ^Context) ---

    @(link_name="xcb_errors_get_name_for_major_code")
    get_name_for_major_code :: proc(ctx : ^Context, major_code : u8) -> cstring ---

    @(link_name="xcb_errors_get_name_for_minor_code")
    get_name_for_minor_code :: proc(ctx : ^Context, major_code : u8, minor_code : u16) -> cstring ---

    @(link_name="xcb_errors_get_name_for_core_event")
    get_name_for_core_event :: proc(ctx : ^Context, event_code : u8, extension : ^cstring) -> cstring ---

    @(link_name="xcb_errors_get_name_for_xge_event")
    get_name_for_xge_event :: proc(ctx : ^Context, major_code : u8, event_type : u16) -> cstring ---

    @(link_name="xcb_errors_get_name_for_xcb_event")
    get_name_for_xcb_event :: proc(ctx : ^Context, event : ^xbc.GenericEvent, extension : ^cstring) -> cstring ---

    @(link_name="xcb_errors_get_name_for_error")
    get_name_for_error :: proc(ctx : ^Context, error_code : u8, extension : ^cstring) -> cstring ---

}
