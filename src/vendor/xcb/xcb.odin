package xcb

foreign import "system:xcb"

import _c "core:c"

__XCB_H__ :: 1
X_PROTOCOL :: 11
X_PROTOCOL_REVISION :: 0
X_TCP_PORT :: 6000
NONE :: 0
COPY_FROM_PARENT :: 0
CURRENT_TIME :: 0
NO_SYMBOL :: 0
__XPROTO_H :: 1
KEY_PRESS :: 2
KEY_RELEASE :: 3
BUTTON_PRESS :: 4
BUTTON_RELEASE :: 5
MOTION_NOTIFY :: 6
ENTER_NOTIFY :: 7
LEAVE_NOTIFY :: 8
FOCUS_IN :: 9
FOCUS_OUT :: 10
KEYMAP_NOTIFY :: 11
EXPOSE :: 12
GRAPHICS_EXPOSURE :: 13
NO_EXPOSURE :: 14
VISIBILITY_NOTIFY :: 15
CREATE_NOTIFY :: 16
DESTROY_NOTIFY :: 17
UNMAP_NOTIFY :: 18
MAP_NOTIFY :: 19
MAP_REQUEST :: 20
REPARENT_NOTIFY :: 21
CONFIGURE_NOTIFY :: 22
CONFIGURE_REQUEST :: 23
GRAVITY_NOTIFY :: 24
RESIZE_REQUEST :: 25
CIRCULATE_NOTIFY :: 26
CIRCULATE_REQUEST :: 27
PROPERTY_NOTIFY :: 28
SELECTION_CLEAR :: 29
SELECTION_REQUEST :: 30
SELECTION_NOTIFY :: 31
COLORMAP_NOTIFY :: 32
CLIENT_MESSAGE :: 33
MAPPING_NOTIFY :: 34
GE_GENERIC :: 35
REQUEST :: 1
VALUE :: 2
WINDOW :: 3
PIXMAP :: 4
ATOM :: 5
CURSOR :: 6
FONT :: 7
MATCH :: 8
DRAWABLE :: 9
ACCESS :: 10
ALLOC :: 11
COLORMAP :: 12
G_CONTEXT :: 13
ID_CHOICE :: 14
NAME :: 15
LENGTH :: 16
IMPLEMENTATION :: 17
CREATE_WINDOW :: 1
CHANGE_WINDOW_ATTRIBUTES :: 2
GET_WINDOW_ATTRIBUTES :: 3
DESTROY_WINDOW :: 4
DESTROY_SUBWINDOWS :: 5
CHANGE_SAVE_SET :: 6
REPARENT_WINDOW :: 7
MAP_WINDOW :: 8
MAP_SUBWINDOWS :: 9
UNMAP_WINDOW :: 10
UNMAP_SUBWINDOWS :: 11
CONFIGURE_WINDOW :: 12
CIRCULATE_WINDOW :: 13
GET_GEOMETRY :: 14
QUERY_TREE :: 15
INTERN_ATOM :: 16
GET_ATOM_NAME :: 17
CHANGE_PROPERTY :: 18
DELETE_PROPERTY :: 19
GET_PROPERTY :: 20
LIST_PROPERTIES :: 21
SET_SELECTION_OWNER :: 22
GET_SELECTION_OWNER :: 23
CONVERT_SELECTION :: 24
SEND_EVENT :: 25
GRAB_POINTER :: 26
UNGRAB_POINTER :: 27
GRAB_BUTTON :: 28
UNGRAB_BUTTON :: 29
CHANGE_ACTIVE_POINTER_GRAB :: 30
GRAB_KEYBOARD :: 31
UNGRAB_KEYBOARD :: 32
GRAB_KEY :: 33
UNGRAB_KEY :: 34
ALLOW_EVENTS :: 35
GRAB_SERVER :: 36
UNGRAB_SERVER :: 37
QUERY_POINTER :: 38
GET_MOTION_EVENTS :: 39
TRANSLATE_COORDINATES :: 40
WARP_POINTER :: 41
SET_INPUT_FOCUS :: 42
GET_INPUT_FOCUS :: 43
QUERY_KEYMAP :: 44
OPEN_FONT :: 45
CLOSE_FONT :: 46
QUERY_FONT :: 47
QUERY_TEXT_EXTENTS :: 48
LIST_FONTS :: 49
LIST_FONTS_WITH_INFO :: 50
SET_FONT_PATH :: 51
GET_FONT_PATH :: 52
CREATE_PIXMAP :: 53
FREE_PIXMAP :: 54
CREATE_GC :: 55
CHANGE_GC :: 56
COPY_GC :: 57
SET_DASHES :: 58
SET_CLIP_RECTANGLES :: 59
FREE_GC :: 60
CLEAR_AREA :: 61
COPY_AREA :: 62
COPY_PLANE :: 63
POLY_POINT :: 64
POLY_LINE :: 65
POLY_SEGMENT :: 66
POLY_RECTANGLE :: 67
POLY_ARC :: 68
FILL_POLY :: 69
POLY_FILL_RECTANGLE :: 70
POLY_FILL_ARC :: 71
PUT_IMAGE :: 72
GET_IMAGE :: 73
POLY_TEXT_8 :: 74
POLY_TEXT_16 :: 75
IMAGE_TEXT_8 :: 76
IMAGE_TEXT_16 :: 77
CREATE_COLORMAP :: 78
FREE_COLORMAP :: 79
COPY_COLORMAP_AND_FREE :: 80
INSTALL_COLORMAP :: 81
UNINSTALL_COLORMAP :: 82
LIST_INSTALLED_COLORMAPS :: 83
ALLOC_COLOR :: 84
ALLOC_NAMED_COLOR :: 85
ALLOC_COLOR_CELLS :: 86
ALLOC_COLOR_PLANES :: 87
FREE_COLORS :: 88
STORE_COLORS :: 89
STORE_NAMED_COLOR :: 90
QUERY_COLORS :: 91
LOOKUP_COLOR :: 92
CREATE_CURSOR :: 93
CREATE_GLYPH_CURSOR :: 94
FREE_CURSOR :: 95
RECOLOR_CURSOR :: 96
QUERY_BEST_SIZE :: 97
QUERY_EXTENSION :: 98
LIST_EXTENSIONS :: 99
CHANGE_KEYBOARD_MAPPING :: 100
GET_KEYBOARD_MAPPING :: 101
CHANGE_KEYBOARD_CONTROL :: 102
GET_KEYBOARD_CONTROL :: 103
BELL :: 104
CHANGE_POINTER_CONTROL :: 105
GET_POINTER_CONTROL :: 106
SET_SCREEN_SAVER :: 107
GET_SCREEN_SAVER :: 108
CHANGE_HOSTS :: 109
LIST_HOSTS :: 110
SET_ACCESS_CONTROL :: 111
SET_CLOSE_DOWN_MODE :: 112
KILL_CLIENT :: 113
ROTATE_PROPERTIES :: 114
FORCE_SCREEN_SAVER :: 115
SET_POINTER_MAPPING :: 116
GET_POINTER_MAPPING :: 117
SET_MODIFIER_MAPPING :: 118
GET_MODIFIER_MAPPING :: 119
NO_OPERATION :: 127

Window :: u32
Pixmap :: u32
Cursor :: u32
Font :: u32
Gcontext :: u32
Colormap :: u32
Atom :: u32
Drawable :: u32
Fontable :: u32
Bool32 :: u32
Visualid :: u32
Timestamp :: u32
Keysym :: u32
Keycode :: u8
Keycode32 :: u32
Button :: u8
KeyReleaseEvent :: KeyPressEvent
ButtonReleaseEvent :: ButtonPressEvent
LeaveNotifyEvent :: EnterNotifyEvent
FocusOutEvent :: FocusInEvent
CirculateRequestEvent :: CirculateNotifyEvent
WindowError :: ValueError
PixmapError :: ValueError
AtomError :: ValueError
CursorError :: ValueError
FontError :: ValueError
MatchError :: RequestError
DrawableError :: ValueError
AccessError :: RequestError
AllocError :: RequestError
ColormapError :: ValueError
G_contextError :: ValueError
IdChoiceError :: ValueError
NameError :: RequestError
LengthError :: RequestError
ImplementationError :: RequestError

VISUAL_CLASS_STATIC_GRAY :: 0
VISUAL_CLASS_GRAY_SCALE :: 1
VISUAL_CLASS_STATIC_COLOR :: 2
VISUAL_CLASS_PSEUDO_COLOR :: 3
VISUAL_CLASS_TRUE_COLOR :: 4
VISUAL_CLASS_DIRECT_COLOR :: 5

EVENT_MASK_NO_EVENT :: 0
EVENT_MASK_KEY_PRESS :: 1
EVENT_MASK_KEY_RELEASE :: 2
EVENT_MASK_BUTTON_PRESS :: 4
EVENT_MASK_BUTTON_RELEASE :: 8
EVENT_MASK_ENTER_WINDOW :: 16
EVENT_MASK_LEAVE_WINDOW :: 32
EVENT_MASK_POINTER_MOTION :: 64
EVENT_MASK_POINTER_MOTION_HINT :: 128
EVENT_MASK_BUTTON_1_MOTION :: 256
EVENT_MASK_BUTTON_2_MOTION :: 512
EVENT_MASK_BUTTON_3_MOTION :: 1024
EVENT_MASK_BUTTON_4_MOTION :: 2048
EVENT_MASK_BUTTON_5_MOTION :: 4096
EVENT_MASK_BUTTON_MOTION :: 8192
EVENT_MASK_KEYMAP_STATE :: 16384
EVENT_MASK_EXPOSURE :: 32768
EVENT_MASK_VISIBILITY_CHANGE :: 65536
EVENT_MASK_STRUCTURE_NOTIFY :: 131072
EVENT_MASK_RESIZE_REDIRECT :: 262144
EVENT_MASK_SUBSTRUCTURE_NOTIFY :: 524288
EVENT_MASK_SUBSTRUCTURE_REDIRECT :: 1048576
EVENT_MASK_FOCUS_CHANGE :: 2097152
EVENT_MASK_PROPERTY_CHANGE :: 4194304
EVENT_MASK_COLOR_MAP_CHANGE :: 8388608
EVENT_MASK_OWNER_GRAB_BUTTON :: 16777216

BACKING_STORE_NOT_USEFUL :: 0
BACKING_STORE_WHEN_MAPPED :: 1
BACKING_STORE_ALWAYS :: 2

IMAGE_ORDER_LSB_FIRST :: 0
IMAGE_ORDER_MSB_FIRST :: 1

MOD_MASK_SHIFT :: 1
MOD_MASK_LOCK :: 2
MOD_MASK_CONTROL :: 4
MOD_MASK_1 :: 8
MOD_MASK_2 :: 16
MOD_MASK_3 :: 32
MOD_MASK_4 :: 64
MOD_MASK_5 :: 128
MOD_MASK_ANY :: 32768

KEY_BUT_MASK_SHIFT :: 1
KEY_BUT_MASK_LOCK :: 2
KEY_BUT_MASK_CONTROL :: 4
KEY_BUT_MASK_MOD_1 :: 8
KEY_BUT_MASK_MOD_2 :: 16
KEY_BUT_MASK_MOD_3 :: 32
KEY_BUT_MASK_MOD_4 :: 64
KEY_BUT_MASK_MOD_5 :: 128
KEY_BUT_MASK_BUTTON_1 :: 256
KEY_BUT_MASK_BUTTON_2 :: 512
KEY_BUT_MASK_BUTTON_3 :: 1024
KEY_BUT_MASK_BUTTON_4 :: 2048
KEY_BUT_MASK_BUTTON_5 :: 4096

WINDOW_NONE :: 0

BUTTON_MASK_1 :: 256
BUTTON_MASK_2 :: 512
BUTTON_MASK_3 :: 1024
BUTTON_MASK_4 :: 2048
BUTTON_MASK_5 :: 4096
BUTTON_MASK_ANY :: 32768

MOTION_NORMAL :: 0
MOTION_HINT :: 1

NOTIFY_DETAIL_ANCESTOR :: 0
NOTIFY_DETAIL_VIRTUAL :: 1
NOTIFY_DETAIL_INFERIOR :: 2
NOTIFY_DETAIL_NONLINEAR :: 3
NOTIFY_DETAIL_NONLINEAR_VIRTUAL :: 4
NOTIFY_DETAIL_POINTER :: 5
NOTIFY_DETAIL_POINTER_ROOT :: 6
NOTIFY_DETAIL_NONE :: 7

NOTIFY_MODE_NORMAL :: 0
NOTIFY_MODE_GRAB :: 1
NOTIFY_MODE_UNGRAB :: 2
NOTIFY_MODE_WHILE_GRABBED :: 3

VISIBILITY_UNOBSCURED :: 0
VISIBILITY_PARTIALLY_OBSCURED :: 1
VISIBILITY_FULLY_OBSCURED :: 2

PLACE_ON_TOP :: 0
PLACE_ON_BOTTOM :: 1

PROPERTY_NEW_VALUE :: 0
PROPERTY_DELETE :: 1

TIME_CURRENT_TIME :: 0

ATOM_NONE :: 0
ATOM_ANY :: 0
ATOM_PRIMARY :: 1
ATOM_SECONDARY :: 2
ATOM_ARC :: 3
ATOM_ATOM :: 4
ATOM_BITMAP :: 5
ATOM_CARDINAL :: 6
ATOM_COLORMAP :: 7
ATOM_CURSOR :: 8
ATOM_CUT_BUFFER0 :: 9
ATOM_CUT_BUFFER1 :: 10
ATOM_CUT_BUFFER2 :: 11
ATOM_CUT_BUFFER3 :: 12
ATOM_CUT_BUFFER4 :: 13
ATOM_CUT_BUFFER5 :: 14
ATOM_CUT_BUFFER6 :: 15
ATOM_CUT_BUFFER7 :: 16
ATOM_DRAWABLE :: 17
ATOM_FONT :: 18
ATOM_INTEGER :: 19
ATOM_PIXMAP :: 20
ATOM_POINT :: 21
ATOM_RECTANGLE :: 22
ATOM_RESOURCE_MANAGER :: 23
ATOM_RGB_COLOR_MAP :: 24
ATOM_RGB_BEST_MAP :: 25
ATOM_RGB_BLUE_MAP :: 26
ATOM_RGB_DEFAULT_MAP :: 27
ATOM_RGB_GRAY_MAP :: 28
ATOM_RGB_GREEN_MAP :: 29
ATOM_RGB_RED_MAP :: 30
ATOM_STRING :: 31
ATOM_VISUALID :: 32
ATOM_WINDOW :: 33
ATOM_WM_COMMAND :: 34
ATOM_WM_HINTS :: 35
ATOM_WM_CLIENT_MACHINE :: 36
ATOM_WM_ICON_NAME :: 37
ATOM_WM_ICON_SIZE :: 38
ATOM_WM_NAME :: 39
ATOM_WM_NORMAL_HINTS :: 40
ATOM_WM_SIZE_HINTS :: 41
ATOM_WM_ZOOM_HINTS :: 42
ATOM_MIN_SPACE :: 43
ATOM_NORM_SPACE :: 44
ATOM_MAX_SPACE :: 45
ATOM_END_SPACE :: 46
ATOM_SUPERSCRIPT_X :: 47
ATOM_SUPERSCRIPT_Y :: 48
ATOM_SUBSCRIPT_X :: 49
ATOM_SUBSCRIPT_Y :: 50
ATOM_UNDERLINE_POSITION :: 51
ATOM_UNDERLINE_THICKNESS :: 52
ATOM_STRIKEOUT_ASCENT :: 53
ATOM_STRIKEOUT_DESCENT :: 54
ATOM_ITALIC_ANGLE :: 55
ATOM_X_HEIGHT :: 56
ATOM_QUAD_WIDTH :: 57
ATOM_WEIGHT :: 58
ATOM_POINT_SIZE :: 59
ATOM_RESOLUTION :: 60
ATOM_COPYRIGHT :: 61
ATOM_NOTICE :: 62
ATOM_FONT_NAME :: 63
ATOM_FAMILY_NAME :: 64
ATOM_FULL_NAME :: 65
ATOM_CAP_HEIGHT :: 66
ATOM_WM_CLASS :: 67
ATOM_WM_TRANSIENT_FOR :: 68

COLORMAP_STATE_UNINSTALLED :: 0
COLORMAP_STATE_INSTALLED :: 1

COLORMAP_NONE :: 0

MAPPING_MODIFIER :: 0
MAPPING_KEYBOARD :: 1
MAPPING_POINTER :: 2

WINDOW_CLASS_COPY_FROM_PARENT :: 0
WINDOW_CLASS_INPUT_OUTPUT :: 1
WINDOW_CLASS_INPUT_ONLY :: 2

CW_BACK_PIXMAP :: 1
CW_BACK_PIXEL :: 2
CW_BORDER_PIXMAP :: 4
CW_BORDER_PIXEL :: 8
CW_BIT_GRAVITY :: 16
CW_WIN_GRAVITY :: 32
CW_BACKING_STORE :: 64
CW_BACKING_PLANES :: 128
CW_BACKING_PIXEL :: 256
CW_OVERRIDE_REDIRECT :: 512
CW_SAVE_UNDER :: 1024
CW_EVENT_MASK :: 2048
CW_DONT_PROPAGATE :: 4096
CW_COLORMAP :: 8192
CW_CURSOR :: 16384

BACK_PIXMAP_NONE :: 0
BACK_PIXMAP_PARENT_RELATIVE :: 1

GRAVITY_BIT_FORGET :: 0
GRAVITY_WIN_UNMAP :: 0
GRAVITY_NORTH_WEST :: 1
GRAVITY_NORTH :: 2
GRAVITY_NORTH_EAST :: 3
GRAVITY_WEST :: 4
GRAVITY_CENTER :: 5
GRAVITY_EAST :: 6
GRAVITY_SOUTH_WEST :: 7
GRAVITY_SOUTH :: 8
GRAVITY_SOUTH_EAST :: 9
GRAVITY_STATIC :: 10

MAP_STATE_UNMAPPED :: 0
MAP_STATE_UNVIEWABLE :: 1
MAP_STATE_VIEWABLE :: 2

SET_MODE_INSERT :: 0
SET_MODE_DELETE :: 1

CONFIG_WINDOW_X :: 1
CONFIG_WINDOW_Y :: 2
CONFIG_WINDOW_WIDTH :: 4
CONFIG_WINDOW_HEIGHT :: 8
CONFIG_WINDOW_BORDER_WIDTH :: 16
CONFIG_WINDOW_SIBLING :: 32
CONFIG_WINDOW_STACK_MODE :: 64

STACK_MODE_ABOVE :: 0
STACK_MODE_BELOW :: 1
STACK_MODE_TOP_IF :: 2
STACK_MODE_BOTTOM_IF :: 3
STACK_MODE_OPPOSITE :: 4

CIRCULATE_RAISE_LOWEST :: 0
CIRCULATE_LOWER_HIGHEST :: 1

PROP_MODE_REPLACE :: 0
PROP_MODE_PREPEND :: 1
PROP_MODE_APPEND :: 2

GET_PROPERTY_TYPE_ANY :: 0

SEND_EVENT_DEST_POINTER_WINDOW :: 0
SEND_EVENT_DEST_ITEM_FOCUS :: 1

GRAB_MODE_SYNC :: 0
GRAB_MODE_ASYNC :: 1

GRAB_STATUS_SUCCESS :: 0
GRAB_STATUS_ALREADY_GRABBED :: 1
GRAB_STATUS_INVALID_TIME :: 2
GRAB_STATUS_NOT_VIEWABLE :: 3
GRAB_STATUS_FROZEN :: 4

CURSOR_NONE :: 0

BUTTON_INDEX_ANY :: 0
BUTTON_INDEX_1 :: 1
BUTTON_INDEX_2 :: 2
BUTTON_INDEX_3 :: 3
BUTTON_INDEX_4 :: 4
BUTTON_INDEX_5 :: 5

GRAB_ANY :: 0

ALLOW_ASYNC_POINTER :: 0
ALLOW_SYNC_POINTER :: 1
ALLOW_REPLAY_POINTER :: 2
ALLOW_ASYNC_KEYBOARD :: 3
ALLOW_SYNC_KEYBOARD :: 4
ALLOW_REPLAY_KEYBOARD :: 5
ALLOW_ASYNC_BOTH :: 6
ALLOW_SYNC_BOTH :: 7

INPUT_FOCUS_NONE :: 0
INPUT_FOCUS_POINTER_ROOT :: 1
INPUT_FOCUS_PARENT :: 2
INPUT_FOCUS_FOLLOW_KEYBOARD :: 3

FONT_DRAW_LEFT_TO_RIGHT :: 0
FONT_DRAW_RIGHT_TO_LEFT :: 1

GC_FUNCTION :: 1
GC_PLANE_MASK :: 2
GC_FOREGROUND :: 4
GC_BACKGROUND :: 8
GC_LINE_WIDTH :: 16
GC_LINE_STYLE :: 32
GC_CAP_STYLE :: 64
GC_JOIN_STYLE :: 128
GC_FILL_STYLE :: 256
GC_FILL_RULE :: 512
GC_TILE :: 1024
GC_STIPPLE :: 2048
GC_TILE_STIPPLE_ORIGIN_X :: 4096
GC_TILE_STIPPLE_ORIGIN_Y :: 8192
GC_FONT :: 16384
GC_SUBWINDOW_MODE :: 32768
GC_GRAPHICS_EXPOSURES :: 65536
GC_CLIP_ORIGIN_X :: 131072
GC_CLIP_ORIGIN_Y :: 262144
GC_CLIP_MASK :: 524288
GC_DASH_OFFSET :: 1048576
GC_DASH_LIST :: 2097152
GC_ARC_MODE :: 4194304

GX_CLEAR :: 0
GX_AND :: 1
GX_AND_REVERSE :: 2
GX_COPY :: 3
GX_AND_INVERTED :: 4
GX_NOOP :: 5
GX_XOR :: 6
GX_OR :: 7
GX_NOR :: 8
GX_EQUIV :: 9
GX_INVERT :: 10
GX_OR_REVERSE :: 11
GX_COPY_INVERTED :: 12
GX_OR_INVERTED :: 13
GX_NAND :: 14
GX_SET :: 15

LINE_STYLE_SOLID :: 0
LINE_STYLE_ON_OFF_DASH :: 1
LINE_STYLE_DOUBLE_DASH :: 2

CAP_STYLE_NOT_LAST :: 0
CAP_STYLE_BUTT :: 1
CAP_STYLE_ROUND :: 2
CAP_STYLE_PROJECTING :: 3

JOIN_STYLE_MITER :: 0
JOIN_STYLE_ROUND :: 1
JOIN_STYLE_BEVEL :: 2

FILL_STYLE_SOLID :: 0
FILL_STYLE_TILED :: 1
FILL_STYLE_STIPPLED :: 2
FILL_STYLE_OPAQUE_STIPPLED :: 3

FILL_RULE_EVEN_ODD :: 0
FILL_RULE_WINDING :: 1

SUBWINDOW_MODE_CLIP_BY_CHILDREN :: 0
SUBWINDOW_MODE_INCLUDE_INFERIORS :: 1

ARC_MODE_CHORD :: 0
ARC_MODE_PIE_SLICE :: 1

CLIP_ORDERING_UNSORTED :: 0
CLIP_ORDERING_Y_SORTED :: 1
CLIP_ORDERING_YX_SORTED :: 2
CLIP_ORDERING_YX_BANDED :: 3

COORD_MODE_ORIGIN :: 0
COORD_MODE_PREVIOUS :: 1

POLY_SHAPE_COMPLEX :: 0
POLY_SHAPE_NONCONVEX :: 1
POLY_SHAPE_CONVEX :: 2

IMAGE_FORMAT_XY_BITMAP :: 0
IMAGE_FORMAT_XY_PIXMAP :: 1
IMAGE_FORMAT_Z_PIXMAP :: 2

COLORMAP_ALLOC_NONE :: 0
COLORMAP_ALLOC_ALL :: 1

COLOR_FLAG_RED :: 1
COLOR_FLAG_GREEN :: 2
COLOR_FLAG_BLUE :: 4

PIXMAP_NONE :: 0

FONT_NONE :: 0

QUERY_SHAPE_OF_LARGEST_CURSOR :: 0
QUERY_SHAPE_OF_FASTEST_TILE :: 1
QUERY_SHAPE_OF_FASTEST_STIPPLE :: 2

KB_KEY_CLICK_PERCENT :: 1
KB_BELL_PERCENT :: 2
KB_BELL_PITCH :: 4
KB_BELL_DURATION :: 8
KB_LED :: 16
KB_LED_MODE :: 32
KB_KEY :: 64
KB_AUTO_REPEAT_MODE :: 128

LED_MODE_OFF :: 0
LED_MODE_ON :: 1

AUTO_REPEAT_MODE_OFF :: 0
AUTO_REPEAT_MODE_ON :: 1
AUTO_REPEAT_MODE_DEFAULT :: 2

BLANKING_NOT_PREFERRED :: 0
BLANKING_PREFERRED :: 1
BLANKING_DEFAULT :: 2

EXPOSURES_NOT_ALLOWED :: 0
EXPOSURES_ALLOWED :: 1
EXPOSURES_DEFAULT :: 2

HOST_MODE_INSERT :: 0
HOST_MODE_DELETE :: 1

FAMILY_INTERNET :: 0
FAMILY_DECNET :: 1
FAMILY_CHAOS :: 2
FAMILY_SERVER_INTERPRETED :: 5
FAMILY_INTERNET_6 :: 6

ACCESS_CONTROL_DISABLE :: 0
ACCESS_CONTROL_ENABLE :: 1

CLOSE_DOWN_DESTROY_ALL :: 0
CLOSE_DOWN_RETAIN_PERMANENT :: 1
CLOSE_DOWN_RETAIN_TEMPORARY :: 2

KILL_ALL_TEMPORARY :: 0

SCREEN_SAVER_RESET :: 0
SCREEN_SAVER_ACTIVE :: 1

MAPPING_STATUS_SUCCESS :: 0
MAPPING_STATUS_BUSY :: 1
MAPPING_STATUS_FAILURE :: 2

MAP_INDEX_SHIFT :: 0
MAP_INDEX_LOCK :: 1
MAP_INDEX_CONTROL :: 2
MAP_INDEX_1 :: 3
MAP_INDEX_2 :: 4
MAP_INDEX_3 :: 5
MAP_INDEX_4 :: 6
MAP_INDEX_5 :: 7

Connection :: struct {}

GenericIterator :: struct {
    data : rawptr,
    rem : _c.int,
    index : _c.int,
}

GenericReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
}

GenericEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    pad : [7]u32,
    full_sequence : u32,
}

GeEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    event_type : u16,
    pad1 : u16,
    pad : [5]u32,
    full_sequence : u32,
}

GenericError :: struct {
    response_type : u8,
    error_code : u8,
    sequence : u16,
    resource_id : u32,
    minor_code : u16,
    major_code : u8,
    pad0 : u8,
    pad : [5]u32,
    full_sequence : u32,
}

VoidCookie :: struct {
    sequence : _c.uint,
}

AuthInfo :: struct {
    namelen : _c.int,
    name : cstring,
    datalen : _c.int,
    data : cstring,
}

Extension :: struct {}

Char2B :: struct {
    byte1 : u8,
    byte2 : u8,
}

Char2BIterator :: struct {
    data : ^Char2B,
    rem : _c.int,
    index : _c.int,
}

WindowIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

PixmapIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

CursorIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

FontIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

GcontextIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

ColormapIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

AtomIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

DrawableIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

FontableIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

Bool32Iterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

VisualidIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

TimestampIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

KeysymIterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

KeycodeIterator :: struct {
    data : ^u8,
    rem : _c.int,
    index : _c.int,
}

Keycode32Iterator :: struct {
    data : ^u32,
    rem : _c.int,
    index : _c.int,
}

ButtonIterator :: struct {
    data : ^u8,
    rem : _c.int,
    index : _c.int,
}

Point :: struct {
    x : i16,
    y : i16,
}

PointIterator :: struct {
    data : ^Point,
    rem : _c.int,
    index : _c.int,
}

Rectangle :: struct {
    x : i16,
    y : i16,
    width : u16,
    height : u16,
}

RectangleIterator :: struct {
    data : ^Rectangle,
    rem : _c.int,
    index : _c.int,
}

Arc :: struct {
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    angle1 : i16,
    angle2 : i16,
}

ArcIterator :: struct {
    data : ^Arc,
    rem : _c.int,
    index : _c.int,
}

Format :: struct {
    depth : u8,
    bits_per_pixel : u8,
    scanline_pad : u8,
    pad0 : [5]u8,
}

FormatIterator :: struct {
    data : ^Format,
    rem : _c.int,
    index : _c.int,
}

Visualtype :: struct {
    visual_id : u32,
    class : u8,
    bits_per_rgb_value : u8,
    colormap_entries : u16,
    red_mask : u32,
    green_mask : u32,
    blue_mask : u32,
    pad0 : [4]u8,
}

VisualtypeIterator :: struct {
    data : ^Visualtype,
    rem : _c.int,
    index : _c.int,
}

Depth :: struct {
    depth : u8,
    pad0 : u8,
    visuals_len : u16,
    pad1 : [4]u8,
}

DepthIterator :: struct {
    data : ^Depth,
    rem : _c.int,
    index : _c.int,
}

Screen :: struct {
    root : u32,
    default_colormap : u32,
    white_pixel : u32,
    black_pixel : u32,
    current_input_masks : u32,
    width_in_pixels : u16,
    height_in_pixels : u16,
    width_in_millimeters : u16,
    height_in_millimeters : u16,
    min_installed_maps : u16,
    max_installed_maps : u16,
    root_visual : u32,
    backing_stores : u8,
    save_unders : u8,
    root_depth : u8,
    allowed_depths_len : u8,
}

ScreenIterator :: struct {
    data : ^Screen,
    rem : _c.int,
    index : _c.int,
}

SetupRequest :: struct {
    byte_order : u8,
    pad0 : u8,
    protocol_major_version : u16,
    protocol_minor_version : u16,
    authorization_protocol_name_len : u16,
    authorization_protocol_data_len : u16,
    pad1 : [2]u8,
}

SetupRequestIterator :: struct {
    data : ^SetupRequest,
    rem : _c.int,
    index : _c.int,
}

SetupFailed :: struct {
    status : u8,
    reason_len : u8,
    protocol_major_version : u16,
    protocol_minor_version : u16,
    length : u16,
}

SetupFailedIterator :: struct {
    data : ^SetupFailed,
    rem : _c.int,
    index : _c.int,
}

SetupAuthenticate :: struct {
    status : u8,
    pad0 : [5]u8,
    length : u16,
}

SetupAuthenticateIterator :: struct {
    data : ^SetupAuthenticate,
    rem : _c.int,
    index : _c.int,
}

Setup :: struct {
    status : u8,
    pad0 : u8,
    protocol_major_version : u16,
    protocol_minor_version : u16,
    length : u16,
    release_number : u32,
    resource_id_base : u32,
    resource_id_mask : u32,
    motion_buffer_size : u32,
    vendor_len : u16,
    maximum_request_length : u16,
    roots_len : u8,
    pixmap_formats_len : u8,
    image_byte_order : u8,
    bitmap_format_bit_order : u8,
    bitmap_format_scanline_unit : u8,
    bitmap_format_scanline_pad : u8,
    min_keycode : u8,
    max_keycode : u8,
    pad1 : [4]u8,
}

SetupIterator :: struct {
    data : ^Setup,
    rem : _c.int,
    index : _c.int,
}

KeyPressEvent :: struct {
    response_type : u8,
    detail : u8,
    sequence : u16,
    time : u32,
    root : u32,
    event : u32,
    child : u32,
    root_x : i16,
    root_y : i16,
    event_x : i16,
    event_y : i16,
    state : u16,
    same_screen : u8,
    pad0 : u8,
}

ButtonPressEvent :: struct {
    response_type : u8,
    detail : u8,
    sequence : u16,
    time : u32,
    root : u32,
    event : u32,
    child : u32,
    root_x : i16,
    root_y : i16,
    event_x : i16,
    event_y : i16,
    state : u16,
    same_screen : u8,
    pad0 : u8,
}

MotionNotifyEvent :: struct {
    response_type : u8,
    detail : u8,
    sequence : u16,
    time : u32,
    root : u32,
    event : u32,
    child : u32,
    root_x : i16,
    root_y : i16,
    event_x : i16,
    event_y : i16,
    state : u16,
    same_screen : u8,
    pad0 : u8,
}

EnterNotifyEvent :: struct {
    response_type : u8,
    detail : u8,
    sequence : u16,
    time : u32,
    root : u32,
    event : u32,
    child : u32,
    root_x : i16,
    root_y : i16,
    event_x : i16,
    event_y : i16,
    state : u16,
    mode : u8,
    same_screen_focus : u8,
}

FocusInEvent :: struct {
    response_type : u8,
    detail : u8,
    sequence : u16,
    event : u32,
    mode : u8,
    pad0 : [3]u8,
}

KeymapNotifyEvent :: struct {
    response_type : u8,
    keys : [31]u8,
}

ExposeEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    window : u32,
    x : u16,
    y : u16,
    width : u16,
    height : u16,
    count : u16,
    pad1 : [2]u8,
}

GraphicsExposureEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    drawable : u32,
    x : u16,
    y : u16,
    width : u16,
    height : u16,
    minor_opcode : u16,
    count : u16,
    major_opcode : u8,
    pad1 : [3]u8,
}

NoExposureEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    drawable : u32,
    minor_opcode : u16,
    major_opcode : u8,
    pad1 : u8,
}

VisibilityNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    window : u32,
    state : u8,
    pad1 : [3]u8,
}

CreateNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    parent : u32,
    window : u32,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    border_width : u16,
    override_redirect : u8,
    pad1 : u8,
}

DestroyNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    event : u32,
    window : u32,
}

UnmapNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    event : u32,
    window : u32,
    from_configure : u8,
    pad1 : [3]u8,
}

MapNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    event : u32,
    window : u32,
    override_redirect : u8,
    pad1 : [3]u8,
}

MapRequestEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    parent : u32,
    window : u32,
}

ReparentNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    event : u32,
    window : u32,
    parent : u32,
    x : i16,
    y : i16,
    override_redirect : u8,
    pad1 : [3]u8,
}

ConfigureNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    event : u32,
    window : u32,
    above_sibling : u32,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    border_width : u16,
    override_redirect : u8,
    pad1 : u8,
}

ConfigureRequestEvent :: struct {
    response_type : u8,
    stack_mode : u8,
    sequence : u16,
    parent : u32,
    window : u32,
    sibling : u32,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    border_width : u16,
    value_mask : u16,
}

GravityNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    event : u32,
    window : u32,
    x : i16,
    y : i16,
}

ResizeRequestEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    window : u32,
    width : u16,
    height : u16,
}

CirculateNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    event : u32,
    window : u32,
    pad1 : [4]u8,
    place : u8,
    pad2 : [3]u8,
}

PropertyNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    window : u32,
    atom : u32,
    time : u32,
    state : u8,
    pad1 : [3]u8,
}

SelectionClearEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    time : u32,
    owner : u32,
    selection : u32,
}

SelectionRequestEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    time : u32,
    owner : u32,
    requestor : u32,
    selection : u32,
    target : u32,
    property : u32,
}

SelectionNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    time : u32,
    requestor : u32,
    selection : u32,
    target : u32,
    property : u32,
}

ColormapNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    window : u32,
    colormap : u32,
    new : u8,
    state : u8,
    pad1 : [2]u8,
}

ClientMessageDataIterator :: struct {
    data : ^ClientMessageData,
    rem : _c.int,
    index : _c.int,
}

ClientMessageEvent :: struct {
    response_type : u8,
    format : u8,
    sequence : u16,
    window : u32,
    type : u32,
    data : ClientMessageData,
}

MappingNotifyEvent :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    request : u8,
    first_keycode : u8,
    count : u8,
    pad1 : u8,
}

GeGenericEvent :: struct {
    response_type : u8,
    extension : u8,
    sequence : u16,
    length : u32,
    event_type : u16,
    pad0 : [22]u8,
    full_sequence : u32,
}

RequestError :: struct {
    response_type : u8,
    error_code : u8,
    sequence : u16,
    bad_value : u32,
    minor_opcode : u16,
    major_opcode : u8,
    pad0 : u8,
}

ValueError :: struct {
    response_type : u8,
    error_code : u8,
    sequence : u16,
    bad_value : u32,
    minor_opcode : u16,
    major_opcode : u8,
    pad0 : u8,
}

CreateWindowValueList :: struct {
    background_pixmap : u32,
    background_pixel : u32,
    border_pixmap : u32,
    border_pixel : u32,
    bit_gravity : u32,
    win_gravity : u32,
    backing_store : u32,
    backing_planes : u32,
    backing_pixel : u32,
    override_redirect : u32,
    save_under : u32,
    event_mask : u32,
    do_not_propogate_mask : u32,
    colormap : u32,
    cursor : u32,
}

CreateWindowRequest :: struct {
    major_opcode : u8,
    depth : u8,
    length : u16,
    wid : u32,
    parent : u32,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    border_width : u16,
    class : u16,
    visual : u32,
    value_mask : u32,
}

ChangeWindowAttributesValueList :: struct {
    background_pixmap : u32,
    background_pixel : u32,
    border_pixmap : u32,
    border_pixel : u32,
    bit_gravity : u32,
    win_gravity : u32,
    backing_store : u32,
    backing_planes : u32,
    backing_pixel : u32,
    override_redirect : u32,
    save_under : u32,
    event_mask : u32,
    do_not_propogate_mask : u32,
    colormap : u32,
    cursor : u32,
}

ChangeWindowAttributesRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
    value_mask : u32,
}

GetWindowAttributesCookie :: struct {
    sequence : _c.uint,
}

GetWindowAttributesRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

GetWindowAttributesReply :: struct {
    response_type : u8,
    backing_store : u8,
    sequence : u16,
    length : u32,
    visual : u32,
    class : u16,
    bit_gravity : u8,
    win_gravity : u8,
    backing_planes : u32,
    backing_pixel : u32,
    save_under : u8,
    map_is_installed : u8,
    map_state : u8,
    override_redirect : u8,
    colormap : u32,
    all_event_masks : u32,
    your_event_mask : u32,
    do_not_propagate_mask : u16,
    pad0 : [2]u8,
}

DestroyWindowRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

DestroySubwindowsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

ChangeSaveSetRequest :: struct {
    major_opcode : u8,
    mode : u8,
    length : u16,
    window : u32,
}

ReparentWindowRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
    parent : u32,
    x : i16,
    y : i16,
}

MapWindowRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

MapSubwindowsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

UnmapWindowRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

UnmapSubwindowsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

ConfigureWindowValueList :: struct {
    x : i32,
    y : i32,
    width : u32,
    height : u32,
    border_width : u32,
    sibling : u32,
    stack_mode : u32,
}

ConfigureWindowRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
    value_mask : u16,
    pad1 : [2]u8,
}

CirculateWindowRequest :: struct {
    major_opcode : u8,
    direction : u8,
    length : u16,
    window : u32,
}

GetGeometryCookie :: struct {
    sequence : _c.uint,
}

GetGeometryRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
}

GetGeometryReply :: struct {
    response_type : u8,
    depth : u8,
    sequence : u16,
    length : u32,
    root : u32,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    border_width : u16,
    pad0 : [2]u8,
}

QueryTreeCookie :: struct {
    sequence : _c.uint,
}

QueryTreeRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

QueryTreeReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    root : u32,
    parent : u32,
    children_len : u16,
    pad1 : [14]u8,
}

InternAtomCookie :: struct {
    sequence : _c.uint,
}

InternAtomRequest :: struct {
    major_opcode : u8,
    only_if_exists : u8,
    length : u16,
    name_len : u16,
    pad0 : [2]u8,
}

InternAtomReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    atom : u32,
}

GetAtomNameCookie :: struct {
    sequence : _c.uint,
}

GetAtomNameRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    atom : u32,
}

GetAtomNameReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    name_len : u16,
    pad1 : [22]u8,
}

ChangePropertyRequest :: struct {
    major_opcode : u8,
    mode : u8,
    length : u16,
    window : u32,
    property : u32,
    type : u32,
    format : u8,
    pad0 : [3]u8,
    data_len : u32,
}

DeletePropertyRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
    property : u32,
}

GetPropertyCookie :: struct {
    sequence : _c.uint,
}

GetPropertyRequest :: struct {
    major_opcode : u8,
    delete : u8,
    length : u16,
    window : u32,
    property : u32,
    type : u32,
    long_offset : u32,
    long_length : u32,
}

GetPropertyReply :: struct {
    response_type : u8,
    format : u8,
    sequence : u16,
    length : u32,
    type : u32,
    bytes_after : u32,
    value_len : u32,
    pad0 : [12]u8,
}

ListPropertiesCookie :: struct {
    sequence : _c.uint,
}

ListPropertiesRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

ListPropertiesReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    atoms_len : u16,
    pad1 : [22]u8,
}

SetSelectionOwnerRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    owner : u32,
    selection : u32,
    time : u32,
}

GetSelectionOwnerCookie :: struct {
    sequence : _c.uint,
}

GetSelectionOwnerRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    selection : u32,
}

GetSelectionOwnerReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    owner : u32,
}

ConvertSelectionRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    requestor : u32,
    selection : u32,
    target : u32,
    property : u32,
    time : u32,
}

SendEventRequest :: struct {
    major_opcode : u8,
    propagate : u8,
    length : u16,
    destination : u32,
    event_mask : u32,
    event : [32]_c.char,
}

GrabPointerCookie :: struct {
    sequence : _c.uint,
}

GrabPointerRequest :: struct {
    major_opcode : u8,
    owner_events : u8,
    length : u16,
    grab_window : u32,
    event_mask : u16,
    pointer_mode : u8,
    keyboard_mode : u8,
    confine_to : u32,
    cursor : u32,
    time : u32,
}

GrabPointerReply :: struct {
    response_type : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

UngrabPointerRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    time : u32,
}

GrabButtonRequest :: struct {
    major_opcode : u8,
    owner_events : u8,
    length : u16,
    grab_window : u32,
    event_mask : u16,
    pointer_mode : u8,
    keyboard_mode : u8,
    confine_to : u32,
    cursor : u32,
    button : u8,
    pad0 : u8,
    modifiers : u16,
}

UngrabButtonRequest :: struct {
    major_opcode : u8,
    button : u8,
    length : u16,
    grab_window : u32,
    modifiers : u16,
    pad0 : [2]u8,
}

ChangeActivePointerGrabRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cursor : u32,
    time : u32,
    event_mask : u16,
    pad1 : [2]u8,
}

GrabKeyboardCookie :: struct {
    sequence : _c.uint,
}

GrabKeyboardRequest :: struct {
    major_opcode : u8,
    owner_events : u8,
    length : u16,
    grab_window : u32,
    time : u32,
    pointer_mode : u8,
    keyboard_mode : u8,
    pad0 : [2]u8,
}

GrabKeyboardReply :: struct {
    response_type : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

UngrabKeyboardRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    time : u32,
}

GrabKeyRequest :: struct {
    major_opcode : u8,
    owner_events : u8,
    length : u16,
    grab_window : u32,
    modifiers : u16,
    key : u8,
    pointer_mode : u8,
    keyboard_mode : u8,
    pad0 : [3]u8,
}

UngrabKeyRequest :: struct {
    major_opcode : u8,
    key : u8,
    length : u16,
    grab_window : u32,
    modifiers : u16,
    pad0 : [2]u8,
}

AllowEventsRequest :: struct {
    major_opcode : u8,
    mode : u8,
    length : u16,
    time : u32,
}

GrabServerRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

UngrabServerRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

QueryPointerCookie :: struct {
    sequence : _c.uint,
}

QueryPointerRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

QueryPointerReply :: struct {
    response_type : u8,
    same_screen : u8,
    sequence : u16,
    length : u32,
    root : u32,
    child : u32,
    root_x : i16,
    root_y : i16,
    win_x : i16,
    win_y : i16,
    mask : u16,
    pad0 : [2]u8,
}

Timecoord :: struct {
    time : u32,
    x : i16,
    y : i16,
}

TimecoordIterator :: struct {
    data : ^Timecoord,
    rem : _c.int,
    index : _c.int,
}

GetMotionEventsCookie :: struct {
    sequence : _c.uint,
}

GetMotionEventsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
    start : u32,
    stop : u32,
}

GetMotionEventsReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    events_len : u32,
    pad1 : [20]u8,
}

TranslateCoordinatesCookie :: struct {
    sequence : _c.uint,
}

TranslateCoordinatesRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    src_window : u32,
    dst_window : u32,
    src_x : i16,
    src_y : i16,
}

TranslateCoordinatesReply :: struct {
    response_type : u8,
    same_screen : u8,
    sequence : u16,
    length : u32,
    child : u32,
    dst_x : i16,
    dst_y : i16,
}

WarpPointerRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    src_window : u32,
    dst_window : u32,
    src_x : i16,
    src_y : i16,
    src_width : u16,
    src_height : u16,
    dst_x : i16,
    dst_y : i16,
}

SetInputFocusRequest :: struct {
    major_opcode : u8,
    revert_to : u8,
    length : u16,
    focus : u32,
    time : u32,
}

GetInputFocusCookie :: struct {
    sequence : _c.uint,
}

GetInputFocusRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

GetInputFocusReply :: struct {
    response_type : u8,
    revert_to : u8,
    sequence : u16,
    length : u32,
    focus : u32,
}

QueryKeymapCookie :: struct {
    sequence : _c.uint,
}

QueryKeymapRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

QueryKeymapReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    keys : [32]u8,
}

OpenFontRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    fid : u32,
    name_len : u16,
    pad1 : [2]u8,
}

CloseFontRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    font : u32,
}

Fontprop :: struct {
    name : u32,
    value : u32,
}

FontpropIterator :: struct {
    data : ^Fontprop,
    rem : _c.int,
    index : _c.int,
}

Charinfo :: struct {
    left_side_bearing : i16,
    right_side_bearing : i16,
    character_width : i16,
    ascent : i16,
    descent : i16,
    attributes : u16,
}

CharinfoIterator :: struct {
    data : ^Charinfo,
    rem : _c.int,
    index : _c.int,
}

QueryFontCookie :: struct {
    sequence : _c.uint,
}

QueryFontRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    font : u32,
}

QueryFontReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    min_bounds : Charinfo,
    pad1 : [4]u8,
    max_bounds : Charinfo,
    pad2 : [4]u8,
    min_char_or_byte2 : u16,
    max_char_or_byte2 : u16,
    default_char : u16,
    properties_len : u16,
    draw_direction : u8,
    min_byte1 : u8,
    max_byte1 : u8,
    all_chars_exist : u8,
    font_ascent : i16,
    font_descent : i16,
    char_infos_len : u32,
}

QueryTextExtentsCookie :: struct {
    sequence : _c.uint,
}

QueryTextExtentsRequest :: struct {
    major_opcode : u8,
    odd_length : u8,
    length : u16,
    font : u32,
}

QueryTextExtentsReply :: struct {
    response_type : u8,
    draw_direction : u8,
    sequence : u16,
    length : u32,
    font_ascent : i16,
    font_descent : i16,
    overall_ascent : i16,
    overall_descent : i16,
    overall_width : i32,
    overall_left : i32,
    overall_right : i32,
}

Str :: struct {
    name_len : u8,
}

StrIterator :: struct {
    data : ^Str,
    rem : _c.int,
    index : _c.int,
}

ListFontsCookie :: struct {
    sequence : _c.uint,
}

ListFontsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    max_names : u16,
    pattern_len : u16,
}

ListFontsReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    names_len : u16,
    pad1 : [22]u8,
}

ListFontsWithInfoCookie :: struct {
    sequence : _c.uint,
}

ListFontsWithInfoRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    max_names : u16,
    pattern_len : u16,
}

ListFontsWithInfoReply :: struct {
    response_type : u8,
    name_len : u8,
    sequence : u16,
    length : u32,
    min_bounds : Charinfo,
    pad0 : [4]u8,
    max_bounds : Charinfo,
    pad1 : [4]u8,
    min_char_or_byte2 : u16,
    max_char_or_byte2 : u16,
    default_char : u16,
    properties_len : u16,
    draw_direction : u8,
    min_byte1 : u8,
    max_byte1 : u8,
    all_chars_exist : u8,
    font_ascent : i16,
    font_descent : i16,
    replies_hint : u32,
}

SetFontPathRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    font_qty : u16,
    pad1 : [2]u8,
}

GetFontPathCookie :: struct {
    sequence : _c.uint,
}

GetFontPathRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

GetFontPathReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    path_len : u16,
    pad1 : [22]u8,
}

CreatePixmapRequest :: struct {
    major_opcode : u8,
    depth : u8,
    length : u16,
    pid : u32,
    drawable : u32,
    width : u16,
    height : u16,
}

FreePixmapRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    pixmap : u32,
}

CreateGcValueList :: struct {
    function : u32,
    plane_mask : u32,
    foreground : u32,
    background : u32,
    line_width : u32,
    line_style : u32,
    cap_style : u32,
    join_style : u32,
    fill_style : u32,
    fill_rule : u32,
    tile : u32,
    stipple : u32,
    tile_stipple_x_origin : i32,
    tile_stipple_y_origin : i32,
    font : u32,
    subwindow_mode : u32,
    graphics_exposures : u32,
    clip_x_origin : i32,
    clip_y_origin : i32,
    clip_mask : u32,
    dash_offset : u32,
    dashes : u32,
    arc_mode : u32,
}

CreateGcRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cid : u32,
    drawable : u32,
    value_mask : u32,
}

ChangeGcValueList :: struct {
    function : u32,
    plane_mask : u32,
    foreground : u32,
    background : u32,
    line_width : u32,
    line_style : u32,
    cap_style : u32,
    join_style : u32,
    fill_style : u32,
    fill_rule : u32,
    tile : u32,
    stipple : u32,
    tile_stipple_x_origin : i32,
    tile_stipple_y_origin : i32,
    font : u32,
    subwindow_mode : u32,
    graphics_exposures : u32,
    clip_x_origin : i32,
    clip_y_origin : i32,
    clip_mask : u32,
    dash_offset : u32,
    dashes : u32,
    arc_mode : u32,
}

ChangeGcRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    gc : u32,
    value_mask : u32,
}

CopyGcRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    src_gc : u32,
    dst_gc : u32,
    value_mask : u32,
}

SetDashesRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    gc : u32,
    dash_offset : u16,
    dashes_len : u16,
}

SetClipRectanglesRequest :: struct {
    major_opcode : u8,
    ordering : u8,
    length : u16,
    gc : u32,
    clip_x_origin : i16,
    clip_y_origin : i16,
}

FreeGcRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    gc : u32,
}

ClearAreaRequest :: struct {
    major_opcode : u8,
    exposures : u8,
    length : u16,
    window : u32,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
}

CopyAreaRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    src_drawable : u32,
    dst_drawable : u32,
    gc : u32,
    src_x : i16,
    src_y : i16,
    dst_x : i16,
    dst_y : i16,
    width : u16,
    height : u16,
}

CopyPlaneRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    src_drawable : u32,
    dst_drawable : u32,
    gc : u32,
    src_x : i16,
    src_y : i16,
    dst_x : i16,
    dst_y : i16,
    width : u16,
    height : u16,
    bit_plane : u32,
}

PolyPointRequest :: struct {
    major_opcode : u8,
    coordinate_mode : u8,
    length : u16,
    drawable : u32,
    gc : u32,
}

PolyLineRequest :: struct {
    major_opcode : u8,
    coordinate_mode : u8,
    length : u16,
    drawable : u32,
    gc : u32,
}

Segment :: struct {
    x1 : i16,
    y1 : i16,
    x2 : i16,
    y2 : i16,
}

SegmentIterator :: struct {
    data : ^Segment,
    rem : _c.int,
    index : _c.int,
}

PolySegmentRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
}

PolyRectangleRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
}

PolyArcRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
}

FillPolyRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
    shape : u8,
    coordinate_mode : u8,
    pad1 : [2]u8,
}

PolyFillRectangleRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
}

PolyFillArcRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
}

PutImageRequest :: struct {
    major_opcode : u8,
    format : u8,
    length : u16,
    drawable : u32,
    gc : u32,
    width : u16,
    height : u16,
    dst_x : i16,
    dst_y : i16,
    left_pad : u8,
    depth : u8,
    pad0 : [2]u8,
}

GetImageCookie :: struct {
    sequence : _c.uint,
}

GetImageRequest :: struct {
    major_opcode : u8,
    format : u8,
    length : u16,
    drawable : u32,
    x : i16,
    y : i16,
    width : u16,
    height : u16,
    plane_mask : u32,
}

GetImageReply :: struct {
    response_type : u8,
    depth : u8,
    sequence : u16,
    length : u32,
    visual : u32,
    pad0 : [20]u8,
}

PolyText8_request :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
    x : i16,
    y : i16,
}

PolyText16Request :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    drawable : u32,
    gc : u32,
    x : i16,
    y : i16,
}

ImageText8_request :: struct {
    major_opcode : u8,
    string_len : u8,
    length : u16,
    drawable : u32,
    gc : u32,
    x : i16,
    y : i16,
}

ImageText16Request :: struct {
    major_opcode : u8,
    string_len : u8,
    length : u16,
    drawable : u32,
    gc : u32,
    x : i16,
    y : i16,
}

CreateColormapRequest :: struct {
    major_opcode : u8,
    alloc : u8,
    length : u16,
    mid : u32,
    window : u32,
    visual : u32,
}

FreeColormapRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
}

CopyColormapAndFreeRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    mid : u32,
    src_cmap : u32,
}

InstallColormapRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
}

UninstallColormapRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
}

ListInstalledColormapsCookie :: struct {
    sequence : _c.uint,
}

ListInstalledColormapsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
}

ListInstalledColormapsReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    cmaps_len : u16,
    pad1 : [22]u8,
}

AllocColorCookie :: struct {
    sequence : _c.uint,
}

AllocColorRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
    red : u16,
    green : u16,
    blue : u16,
    pad1 : [2]u8,
}

AllocColorReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    red : u16,
    green : u16,
    blue : u16,
    pad1 : [2]u8,
    pixel : u32,
}

AllocNamedColorCookie :: struct {
    sequence : _c.uint,
}

AllocNamedColorRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
    name_len : u16,
    pad1 : [2]u8,
}

AllocNamedColorReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    pixel : u32,
    exact_red : u16,
    exact_green : u16,
    exact_blue : u16,
    visual_red : u16,
    visual_green : u16,
    visual_blue : u16,
}

AllocColorCellsCookie :: struct {
    sequence : _c.uint,
}

AllocColorCellsRequest :: struct {
    major_opcode : u8,
    contiguous : u8,
    length : u16,
    cmap : u32,
    colors : u16,
    planes : u16,
}

AllocColorCellsReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    pixels_len : u16,
    masks_len : u16,
    pad1 : [20]u8,
}

AllocColorPlanesCookie :: struct {
    sequence : _c.uint,
}

AllocColorPlanesRequest :: struct {
    major_opcode : u8,
    contiguous : u8,
    length : u16,
    cmap : u32,
    colors : u16,
    reds : u16,
    greens : u16,
    blues : u16,
}

AllocColorPlanesReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    pixels_len : u16,
    pad1 : [2]u8,
    red_mask : u32,
    green_mask : u32,
    blue_mask : u32,
    pad2 : [8]u8,
}

FreeColorsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
    plane_mask : u32,
}

Coloritem :: struct {
    pixel : u32,
    red : u16,
    green : u16,
    blue : u16,
    flags : u8,
    pad0 : u8,
}

ColoritemIterator :: struct {
    data : ^Coloritem,
    rem : _c.int,
    index : _c.int,
}

StoreColorsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
}

StoreNamedColorRequest :: struct {
    major_opcode : u8,
    flags : u8,
    length : u16,
    cmap : u32,
    pixel : u32,
    name_len : u16,
    pad0 : [2]u8,
}

Rgb :: struct {
    red : u16,
    green : u16,
    blue : u16,
    pad0 : [2]u8,
}

RgbIterator :: struct {
    data : ^Rgb,
    rem : _c.int,
    index : _c.int,
}

QueryColorsCookie :: struct {
    sequence : _c.uint,
}

QueryColorsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
}

QueryColorsReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    colors_len : u16,
    pad1 : [22]u8,
}

LookupColorCookie :: struct {
    sequence : _c.uint,
}

LookupColorRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cmap : u32,
    name_len : u16,
    pad1 : [2]u8,
}

LookupColorReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    exact_red : u16,
    exact_green : u16,
    exact_blue : u16,
    visual_red : u16,
    visual_green : u16,
    visual_blue : u16,
}

CreateCursorRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cid : u32,
    source : u32,
    mask : u32,
    fore_red : u16,
    fore_green : u16,
    fore_blue : u16,
    back_red : u16,
    back_green : u16,
    back_blue : u16,
    x : u16,
    y : u16,
}

CreateGlyphCursorRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cid : u32,
    source_font : u32,
    mask_font : u32,
    source_char : u16,
    mask_char : u16,
    fore_red : u16,
    fore_green : u16,
    fore_blue : u16,
    back_red : u16,
    back_green : u16,
    back_blue : u16,
}

FreeCursorRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cursor : u32,
}

RecolorCursorRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    cursor : u32,
    fore_red : u16,
    fore_green : u16,
    fore_blue : u16,
    back_red : u16,
    back_green : u16,
    back_blue : u16,
}

QueryBestSizeCookie :: struct {
    sequence : _c.uint,
}

QueryBestSizeRequest :: struct {
    major_opcode : u8,
    class : u8,
    length : u16,
    drawable : u32,
    width : u16,
    height : u16,
}

QueryBestSizeReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    width : u16,
    height : u16,
}

QueryExtensionCookie :: struct {
    sequence : _c.uint,
}

QueryExtensionRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    name_len : u16,
    pad1 : [2]u8,
}

QueryExtensionReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    present : u8,
    major_opcode : u8,
    first_event : u8,
    first_error : u8,
}

ListExtensionsCookie :: struct {
    sequence : _c.uint,
}

ListExtensionsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

ListExtensionsReply :: struct {
    response_type : u8,
    names_len : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

ChangeKeyboardMappingRequest :: struct {
    major_opcode : u8,
    keycode_count : u8,
    length : u16,
    first_keycode : u8,
    keysyms_per_keycode : u8,
    pad0 : [2]u8,
}

GetKeyboardMappingCookie :: struct {
    sequence : _c.uint,
}

GetKeyboardMappingRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    first_keycode : u8,
    count : u8,
}

GetKeyboardMappingReply :: struct {
    response_type : u8,
    keysyms_per_keycode : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

ChangeKeyboardControlValueList :: struct {
    key_click_percent : i32,
    bell_percent : i32,
    bell_pitch : i32,
    bell_duration : i32,
    led : u32,
    led_mode : u32,
    key : u32,
    auto_repeat_mode : u32,
}

ChangeKeyboardControlRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    value_mask : u32,
}

GetKeyboardControlCookie :: struct {
    sequence : _c.uint,
}

GetKeyboardControlRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

GetKeyboardControlReply :: struct {
    response_type : u8,
    global_auto_repeat : u8,
    sequence : u16,
    length : u32,
    led_mask : u32,
    key_click_percent : u8,
    bell_percent : u8,
    bell_pitch : u16,
    bell_duration : u16,
    pad0 : [2]u8,
    auto_repeats : [32]u8,
}

BellRequest :: struct {
    major_opcode : u8,
    percent : i8,
    length : u16,
}

ChangePointerControlRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    acceleration_numerator : i16,
    acceleration_denominator : i16,
    threshold : i16,
    do_acceleration : u8,
    do_threshold : u8,
}

GetPointerControlCookie :: struct {
    sequence : _c.uint,
}

GetPointerControlRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

GetPointerControlReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    acceleration_numerator : u16,
    acceleration_denominator : u16,
    threshold : u16,
    pad1 : [18]u8,
}

SetScreenSaverRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    timeout : i16,
    interval : i16,
    prefer_blanking : u8,
    allow_exposures : u8,
}

GetScreenSaverCookie :: struct {
    sequence : _c.uint,
}

GetScreenSaverRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

GetScreenSaverReply :: struct {
    response_type : u8,
    pad0 : u8,
    sequence : u16,
    length : u32,
    timeout : u16,
    interval : u16,
    prefer_blanking : u8,
    allow_exposures : u8,
    pad1 : [18]u8,
}

ChangeHostsRequest :: struct {
    major_opcode : u8,
    mode : u8,
    length : u16,
    family : u8,
    pad0 : u8,
    address_len : u16,
}

Host :: struct {
    family : u8,
    pad0 : u8,
    address_len : u16,
}

HostIterator :: struct {
    data : ^Host,
    rem : _c.int,
    index : _c.int,
}

ListHostsCookie :: struct {
    sequence : _c.uint,
}

ListHostsRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

ListHostsReply :: struct {
    response_type : u8,
    mode : u8,
    sequence : u16,
    length : u32,
    hosts_len : u16,
    pad0 : [22]u8,
}

SetAccessControlRequest :: struct {
    major_opcode : u8,
    mode : u8,
    length : u16,
}

SetCloseDownModeRequest :: struct {
    major_opcode : u8,
    mode : u8,
    length : u16,
}

KillClientRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    resource : u32,
}

RotatePropertiesRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
    window : u32,
    atoms_len : u16,
    delta : i16,
}

ForceScreenSaverRequest :: struct {
    major_opcode : u8,
    mode : u8,
    length : u16,
}

SetPointerMappingCookie :: struct {
    sequence : _c.uint,
}

SetPointerMappingRequest :: struct {
    major_opcode : u8,
    map_len : u8,
    length : u16,
}

SetPointerMappingReply :: struct {
    response_type : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

GetPointerMappingCookie :: struct {
    sequence : _c.uint,
}

GetPointerMappingRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

GetPointerMappingReply :: struct {
    response_type : u8,
    map_len : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

SetModifierMappingCookie :: struct {
    sequence : _c.uint,
}

SetModifierMappingRequest :: struct {
    major_opcode : u8,
    keycodes_per_modifier : u8,
    length : u16,
}

SetModifierMappingReply :: struct {
    response_type : u8,
    status : u8,
    sequence : u16,
    length : u32,
}

GetModifierMappingCookie :: struct {
    sequence : _c.uint,
}

GetModifierMappingRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

GetModifierMappingReply :: struct {
    response_type : u8,
    keycodes_per_modifier : u8,
    sequence : u16,
    length : u32,
    pad0 : [24]u8,
}

NoOperationRequest :: struct {
    major_opcode : u8,
    pad0 : u8,
    length : u16,
}

ClientMessageData :: struct #raw_union {
    data8 : [20]u8,
    data16 : [10]u16,
    data32 : [5]u32,
}

@(default_calling_convention="c")
foreign xcb {

    @(link_name="xcb_flush")
    flush :: proc(c : ^Connection) -> _c.int ---

    @(link_name="xcb_get_maximum_request_length")
    get_maximum_request_length :: proc(c : ^Connection) -> u32 ---

    @(link_name="xcb_prefetch_maximum_request_length")
    prefetch_maximum_request_length :: proc(c : ^Connection) ---

    @(link_name="xcb_wait_for_event")
    wait_for_event :: proc(c : ^Connection) -> ^GenericEvent ---

    @(link_name="xcb_poll_for_event")
    poll_for_event :: proc(c : ^Connection) -> ^GenericEvent ---

    @(link_name="xcb_poll_for_queued_event")
    poll_for_queued_event :: proc(c : ^Connection) -> ^GenericEvent ---

    @(link_name="xcb_request_check")
    request_check :: proc(c : ^Connection, cookie : VoidCookie) -> ^GenericError ---

    @(link_name="xcb_discard_reply")
    discard_reply :: proc(c : ^Connection, sequence : _c.uint) ---

    @(link_name="xcb_get_extension_data")
    get_extension_data :: proc(c : ^Connection, ext : ^Extension) -> ^QueryExtensionReply ---

    @(link_name="xcb_prefetch_extension_data")
    prefetch_extension_data :: proc(c : ^Connection, ext : ^Extension) ---

    @(link_name="xcb_get_setup")
    get_setup :: proc(c : ^Connection) -> ^Setup ---

    @(link_name="xcb_get_file_descriptor")
    get_file_descriptor :: proc(c : ^Connection) -> _c.int ---

    @(link_name="xcb_connection_has_error")
    connection_has_error :: proc(c : ^Connection) -> _c.int ---

    @(link_name="xcb_connect_to_fd")
    connect_to_fd :: proc(fd : _c.int, auth_info : ^AuthInfo) -> ^Connection ---

    @(link_name="xcb_disconnect")
    disconnect :: proc(c : ^Connection) ---

    @(link_name="xcb_parse_display")
    parse_display :: proc(name : cstring, host : ^cstring, display : ^_c.int, screen : ^_c.int) -> _c.int ---

    @(link_name="xcb_connect")
    connect :: proc(displayname : cstring, screenp : ^_c.int) -> ^Connection ---

    @(link_name="xcb_connect_to_display_with_auth_info")
    connect_to_display_with_auth_info :: proc(display : cstring, auth : ^AuthInfo, screen : ^_c.int) -> ^Connection ---

    @(link_name="xcb_generate_id")
    generate_id :: proc(c : ^Connection) -> u32 ---

    @(link_name="xcb_char2b_next")
    char2b_next :: proc(i : ^Char2BIterator) ---

    @(link_name="xcb_char2b_end")
    char2b_end :: proc(i : Char2BIterator) -> GenericIterator ---

    @(link_name="xcb_window_next")
    window_next :: proc(i : ^WindowIterator) ---

    @(link_name="xcb_window_end")
    window_end :: proc(i : WindowIterator) -> GenericIterator ---

    @(link_name="xcb_pixmap_next")
    pixmap_next :: proc(i : ^PixmapIterator) ---

    @(link_name="xcb_pixmap_end")
    pixmap_end :: proc(i : PixmapIterator) -> GenericIterator ---

    @(link_name="xcb_cursor_next")
    cursor_next :: proc(i : ^CursorIterator) ---

    @(link_name="xcb_cursor_end")
    cursor_end :: proc(i : CursorIterator) -> GenericIterator ---

    @(link_name="xcb_font_next")
    font_next :: proc(i : ^FontIterator) ---

    @(link_name="xcb_font_end")
    font_end :: proc(i : FontIterator) -> GenericIterator ---

    @(link_name="xcb_gcontext_next")
    gcontext_next :: proc(i : ^GcontextIterator) ---

    @(link_name="xcb_gcontext_end")
    gcontext_end :: proc(i : GcontextIterator) -> GenericIterator ---

    @(link_name="xcb_colormap_next")
    colormap_next :: proc(i : ^ColormapIterator) ---

    @(link_name="xcb_colormap_end")
    colormap_end :: proc(i : ColormapIterator) -> GenericIterator ---

    @(link_name="xcb_atom_next")
    atom_next :: proc(i : ^AtomIterator) ---

    @(link_name="xcb_atom_end")
    atom_end :: proc(i : AtomIterator) -> GenericIterator ---

    @(link_name="xcb_drawable_next")
    drawable_next :: proc(i : ^DrawableIterator) ---

    @(link_name="xcb_drawable_end")
    drawable_end :: proc(i : DrawableIterator) -> GenericIterator ---

    @(link_name="xcb_fontable_next")
    fontable_next :: proc(i : ^FontableIterator) ---

    @(link_name="xcb_fontable_end")
    fontable_end :: proc(i : FontableIterator) -> GenericIterator ---

    @(link_name="xcb_bool32_next")
    bool32_next :: proc(i : ^Bool32Iterator) ---

    @(link_name="xcb_bool32_end")
    bool32_end :: proc(i : Bool32Iterator) -> GenericIterator ---

    @(link_name="xcb_visualid_next")
    visualid_next :: proc(i : ^VisualidIterator) ---

    @(link_name="xcb_visualid_end")
    visualid_end :: proc(i : VisualidIterator) -> GenericIterator ---

    @(link_name="xcb_timestamp_next")
    timestamp_next :: proc(i : ^TimestampIterator) ---

    @(link_name="xcb_timestamp_end")
    timestamp_end :: proc(i : TimestampIterator) -> GenericIterator ---

    @(link_name="xcb_keysym_next")
    keysym_next :: proc(i : ^KeysymIterator) ---

    @(link_name="xcb_keysym_end")
    keysym_end :: proc(i : KeysymIterator) -> GenericIterator ---

    @(link_name="xcb_keycode_next")
    keycode_next :: proc(i : ^KeycodeIterator) ---

    @(link_name="xcb_keycode_end")
    keycode_end :: proc(i : KeycodeIterator) -> GenericIterator ---

    @(link_name="xcb_keycode32_next")
    keycode32_next :: proc(i : ^Keycode32Iterator) ---

    @(link_name="xcb_keycode32_end")
    keycode32_end :: proc(i : Keycode32Iterator) -> GenericIterator ---

    @(link_name="xcb_button_next")
    button_next :: proc(i : ^ButtonIterator) ---

    @(link_name="xcb_button_end")
    button_end :: proc(i : ButtonIterator) -> GenericIterator ---

    @(link_name="xcb_point_next")
    point_next :: proc(i : ^PointIterator) ---

    @(link_name="xcb_point_end")
    point_end :: proc(i : PointIterator) -> GenericIterator ---

    @(link_name="xcb_rectangle_next")
    rectangle_next :: proc(i : ^RectangleIterator) ---

    @(link_name="xcb_rectangle_end")
    rectangle_end :: proc(i : RectangleIterator) -> GenericIterator ---

    @(link_name="xcb_arc_next")
    arc_next :: proc(i : ^ArcIterator) ---

    @(link_name="xcb_arc_end")
    arc_end :: proc(i : ArcIterator) -> GenericIterator ---

    @(link_name="xcb_format_next")
    format_next :: proc(i : ^FormatIterator) ---

    @(link_name="xcb_format_end")
    format_end :: proc(i : FormatIterator) -> GenericIterator ---

    @(link_name="xcb_visualtype_next")
    visualtype_next :: proc(i : ^VisualtypeIterator) ---

    @(link_name="xcb_visualtype_end")
    visualtype_end :: proc(i : VisualtypeIterator) -> GenericIterator ---

    @(link_name="xcb_depth_sizeof")
    depth_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_depth_visuals")
    depth_visuals :: proc(r : ^Depth) -> ^Visualtype ---

    @(link_name="xcb_depth_visuals_length")
    depth_visuals_length :: proc(r : ^Depth) -> _c.int ---

    @(link_name="xcb_depth_visuals_iterator")
    depth_visuals_iterator :: proc(r : ^Depth) -> VisualtypeIterator ---

    @(link_name="xcb_depth_next")
    depth_next :: proc(i : ^DepthIterator) ---

    @(link_name="xcb_depth_end")
    depth_end :: proc(i : DepthIterator) -> GenericIterator ---

    @(link_name="xcb_screen_sizeof")
    screen_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_screen_allowed_depths_length")
    screen_allowed_depths_length :: proc(r : ^Screen) -> _c.int ---

    @(link_name="xcb_screen_allowed_depths_iterator")
    screen_allowed_depths_iterator :: proc(r : ^Screen) -> DepthIterator ---

    @(link_name="xcb_screen_next")
    screen_next :: proc(i : ^ScreenIterator) ---

    @(link_name="xcb_screen_end")
    screen_end :: proc(i : ScreenIterator) -> GenericIterator ---

    @(link_name="xcb_setup_request_sizeof")
    setup_request_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_request_authorization_protocol_name")
    setup_request_authorization_protocol_name :: proc(r : ^SetupRequest) -> cstring ---

    @(link_name="xcb_setup_request_authorization_protocol_name_length")
    setup_request_authorization_protocol_name_length :: proc(r : ^SetupRequest) -> _c.int ---

    @(link_name="xcb_setup_request_authorization_protocol_name_end")
    setup_request_authorization_protocol_name_end :: proc(r : ^SetupRequest) -> GenericIterator ---

    @(link_name="xcb_setup_request_authorization_protocol_data")
    setup_request_authorization_protocol_data :: proc(r : ^SetupRequest) -> cstring ---

    @(link_name="xcb_setup_request_authorization_protocol_data_length")
    setup_request_authorization_protocol_data_length :: proc(r : ^SetupRequest) -> _c.int ---

    @(link_name="xcb_setup_request_authorization_protocol_data_end")
    setup_request_authorization_protocol_data_end :: proc(r : ^SetupRequest) -> GenericIterator ---

    @(link_name="xcb_setup_request_next")
    setup_request_next :: proc(i : ^SetupRequestIterator) ---

    @(link_name="xcb_setup_request_end")
    setup_request_end :: proc(i : SetupRequestIterator) -> GenericIterator ---

    @(link_name="xcb_setup_failed_sizeof")
    setup_failed_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_failed_reason")
    setup_failed_reason :: proc(r : ^SetupFailed) -> cstring ---

    @(link_name="xcb_setup_failed_reason_length")
    setup_failed_reason_length :: proc(r : ^SetupFailed) -> _c.int ---

    @(link_name="xcb_setup_failed_reason_end")
    setup_failed_reason_end :: proc(r : ^SetupFailed) -> GenericIterator ---

    @(link_name="xcb_setup_failed_next")
    setup_failed_next :: proc(i : ^SetupFailedIterator) ---

    @(link_name="xcb_setup_failed_end")
    setup_failed_end :: proc(i : SetupFailedIterator) -> GenericIterator ---

    @(link_name="xcb_setup_authenticate_sizeof")
    setup_authenticate_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_authenticate_reason")
    setup_authenticate_reason :: proc(r : ^SetupAuthenticate) -> cstring ---

    @(link_name="xcb_setup_authenticate_reason_length")
    setup_authenticate_reason_length :: proc(r : ^SetupAuthenticate) -> _c.int ---

    @(link_name="xcb_setup_authenticate_reason_end")
    setup_authenticate_reason_end :: proc(r : ^SetupAuthenticate) -> GenericIterator ---

    @(link_name="xcb_setup_authenticate_next")
    setup_authenticate_next :: proc(i : ^SetupAuthenticateIterator) ---

    @(link_name="xcb_setup_authenticate_end")
    setup_authenticate_end :: proc(i : SetupAuthenticateIterator) -> GenericIterator ---

    @(link_name="xcb_setup_sizeof")
    setup_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_setup_vendor")
    setup_vendor :: proc(r : ^Setup) -> cstring ---

    @(link_name="xcb_setup_vendor_length")
    setup_vendor_length :: proc(r : ^Setup) -> _c.int ---

    @(link_name="xcb_setup_vendor_end")
    setup_vendor_end :: proc(r : ^Setup) -> GenericIterator ---

    @(link_name="xcb_setup_pixmap_formats")
    setup_pixmap_formats :: proc(r : ^Setup) -> ^Format ---

    @(link_name="xcb_setup_pixmap_formats_length")
    setup_pixmap_formats_length :: proc(r : ^Setup) -> _c.int ---

    @(link_name="xcb_setup_pixmap_formats_iterator")
    setup_pixmap_formats_iterator :: proc(r : ^Setup) -> FormatIterator ---

    @(link_name="xcb_setup_roots_length")
    setup_roots_length :: proc(r : ^Setup) -> _c.int ---

    @(link_name="xcb_setup_roots_iterator")
    setup_roots_iterator :: proc(r : ^Setup) -> ScreenIterator ---

    @(link_name="xcb_setup_next")
    setup_next :: proc(i : ^SetupIterator) ---

    @(link_name="xcb_setup_end")
    setup_end :: proc(i : SetupIterator) -> GenericIterator ---

    @(link_name="xcb_client_message_data_next")
    client_message_data_next :: proc(i : ^ClientMessageDataIterator) ---

    @(link_name="xcb_client_message_data_end")
    client_message_data_end :: proc(i : ClientMessageDataIterator) -> GenericIterator ---

    @(link_name="xcb_create_window_value_list_serialize")
    create_window_value_list_serialize :: proc(buffer : ^rawptr, value_mask : u32, aux : ^CreateWindowValueList) -> _c.int ---

    @(link_name="xcb_create_window_value_list_unpack")
    create_window_value_list_unpack :: proc(buffer : rawptr, value_mask : u32, aux : ^CreateWindowValueList) -> _c.int ---

    @(link_name="xcb_create_window_value_list_sizeof")
    create_window_value_list_sizeof :: proc(buffer : rawptr, value_mask : u32) -> _c.int ---

    @(link_name="xcb_create_window_sizeof")
    create_window_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_create_window_checked")
    create_window_checked :: proc(c : ^Connection, depth : u8, wid : u32, parent : u32, x : i16, y : i16, width : u16, height : u16, border_width : u16, class : u16, visual : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_create_window")
    create_window :: proc(c : ^Connection, depth : u8, wid : u32, parent : u32, x : i16, y : i16, width : u16, height : u16, border_width : u16, class : u16, visual : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_create_window_aux_checked")
    create_window_aux_checked :: proc(c : ^Connection, depth : u8, wid : u32, parent : u32, x : i16, y : i16, width : u16, height : u16, border_width : u16, class : u16, visual : u32, value_mask : u32, value_list : ^CreateWindowValueList) -> VoidCookie ---

    @(link_name="xcb_create_window_aux")
    create_window_aux :: proc(c : ^Connection, depth : u8, wid : u32, parent : u32, x : i16, y : i16, width : u16, height : u16, border_width : u16, class : u16, visual : u32, value_mask : u32, value_list : ^CreateWindowValueList) -> VoidCookie ---

    @(link_name="xcb_create_window_value_list")
    create_window_value_list :: proc(r : ^CreateWindowRequest) -> rawptr ---

    @(link_name="xcb_change_window_attributes_value_list_serialize")
    change_window_attributes_value_list_serialize :: proc(buffer : ^rawptr, value_mask : u32, aux : ^ChangeWindowAttributesValueList) -> _c.int ---

    @(link_name="xcb_change_window_attributes_value_list_unpack")
    change_window_attributes_value_list_unpack :: proc(buffer : rawptr, value_mask : u32, aux : ^ChangeWindowAttributesValueList) -> _c.int ---

    @(link_name="xcb_change_window_attributes_value_list_sizeof")
    change_window_attributes_value_list_sizeof :: proc(buffer : rawptr, value_mask : u32) -> _c.int ---

    @(link_name="xcb_change_window_attributes_sizeof")
    change_window_attributes_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_window_attributes_checked")
    change_window_attributes_checked :: proc(c : ^Connection, window : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes")
    change_window_attributes :: proc(c : ^Connection, window : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes_aux_checked")
    change_window_attributes_aux_checked :: proc(c : ^Connection, window : u32, value_mask : u32, value_list : ^ChangeWindowAttributesValueList) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes_aux")
    change_window_attributes_aux :: proc(c : ^Connection, window : u32, value_mask : u32, value_list : ^ChangeWindowAttributesValueList) -> VoidCookie ---

    @(link_name="xcb_change_window_attributes_value_list")
    change_window_attributes_value_list :: proc(r : ^ChangeWindowAttributesRequest) -> rawptr ---

    @(link_name="xcb_get_window_attributes")
    get_window_attributes :: proc(c : ^Connection, window : u32) -> GetWindowAttributesCookie ---

    @(link_name="xcb_get_window_attributes_unchecked")
    get_window_attributes_unchecked :: proc(c : ^Connection, window : u32) -> GetWindowAttributesCookie ---

    @(link_name="xcb_get_window_attributes_reply")
    get_window_attributes_reply :: proc(c : ^Connection, cookie : GetWindowAttributesCookie, e : ^^GenericError) -> ^GetWindowAttributesReply ---

    @(link_name="xcb_destroy_window_checked")
    destroy_window_checked :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_destroy_window")
    destroy_window :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_destroy_subwindows_checked")
    destroy_subwindows_checked :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_destroy_subwindows")
    destroy_subwindows :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_change_save_set_checked")
    change_save_set_checked :: proc(c : ^Connection, mode : u8, window : u32) -> VoidCookie ---

    @(link_name="xcb_change_save_set")
    change_save_set :: proc(c : ^Connection, mode : u8, window : u32) -> VoidCookie ---

    @(link_name="xcb_reparent_window_checked")
    reparent_window_checked :: proc(c : ^Connection, window : u32, parent : u32, x : i16, y : i16) -> VoidCookie ---

    @(link_name="xcb_reparent_window")
    reparent_window :: proc(c : ^Connection, window : u32, parent : u32, x : i16, y : i16) -> VoidCookie ---

    @(link_name="xcb_map_window_checked")
    map_window_checked :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_map_window")
    map_window :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_map_subwindows_checked")
    map_subwindows_checked :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_map_subwindows")
    map_subwindows :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_unmap_window_checked")
    unmap_window_checked :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_unmap_window")
    unmap_window :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_unmap_subwindows_checked")
    unmap_subwindows_checked :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_unmap_subwindows")
    unmap_subwindows :: proc(c : ^Connection, window : u32) -> VoidCookie ---

    @(link_name="xcb_configure_window_value_list_serialize")
    configure_window_value_list_serialize :: proc(buffer : ^rawptr, value_mask : u16, aux : ^ConfigureWindowValueList) -> _c.int ---

    @(link_name="xcb_configure_window_value_list_unpack")
    configure_window_value_list_unpack :: proc(buffer : rawptr, value_mask : u16, aux : ^ConfigureWindowValueList) -> _c.int ---

    @(link_name="xcb_configure_window_value_list_sizeof")
    configure_window_value_list_sizeof :: proc(buffer : rawptr, value_mask : u16) -> _c.int ---

    @(link_name="xcb_configure_window_sizeof")
    configure_window_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_configure_window_checked")
    configure_window_checked :: proc(c : ^Connection, window : u32, value_mask : u16, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_configure_window")
    configure_window :: proc(c : ^Connection, window : u32, value_mask : u16, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_configure_window_aux_checked")
    configure_window_aux_checked :: proc(c : ^Connection, window : u32, value_mask : u16, value_list : ^ConfigureWindowValueList) -> VoidCookie ---

    @(link_name="xcb_configure_window_aux")
    configure_window_aux :: proc(c : ^Connection, window : u32, value_mask : u16, value_list : ^ConfigureWindowValueList) -> VoidCookie ---

    @(link_name="xcb_configure_window_value_list")
    configure_window_value_list :: proc(r : ^ConfigureWindowRequest) -> rawptr ---

    @(link_name="xcb_circulate_window_checked")
    circulate_window_checked :: proc(c : ^Connection, direction : u8, window : u32) -> VoidCookie ---

    @(link_name="xcb_circulate_window")
    circulate_window :: proc(c : ^Connection, direction : u8, window : u32) -> VoidCookie ---

    @(link_name="xcb_get_geometry")
    get_geometry :: proc(c : ^Connection, drawable : u32) -> GetGeometryCookie ---

    @(link_name="xcb_get_geometry_unchecked")
    get_geometry_unchecked :: proc(c : ^Connection, drawable : u32) -> GetGeometryCookie ---

    @(link_name="xcb_get_geometry_reply")
    get_geometry_reply :: proc(c : ^Connection, cookie : GetGeometryCookie, e : ^^GenericError) -> ^GetGeometryReply ---

    @(link_name="xcb_query_tree_sizeof")
    query_tree_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_query_tree")
    query_tree :: proc(c : ^Connection, window : u32) -> QueryTreeCookie ---

    @(link_name="xcb_query_tree_unchecked")
    query_tree_unchecked :: proc(c : ^Connection, window : u32) -> QueryTreeCookie ---

    @(link_name="xcb_query_tree_children")
    query_tree_children :: proc(r : ^QueryTreeReply) -> ^u32 ---

    @(link_name="xcb_query_tree_children_length")
    query_tree_children_length :: proc(r : ^QueryTreeReply) -> _c.int ---

    @(link_name="xcb_query_tree_children_end")
    query_tree_children_end :: proc(r : ^QueryTreeReply) -> GenericIterator ---

    @(link_name="xcb_query_tree_reply")
    query_tree_reply :: proc(c : ^Connection, cookie : QueryTreeCookie, e : ^^GenericError) -> ^QueryTreeReply ---

    @(link_name="xcb_intern_atom_sizeof")
    intern_atom_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_intern_atom")
    intern_atom :: proc(c : ^Connection, only_if_exists : u8, name_len : u16, name : cstring) -> InternAtomCookie ---

    @(link_name="xcb_intern_atom_unchecked")
    intern_atom_unchecked :: proc(c : ^Connection, only_if_exists : u8, name_len : u16, name : cstring) -> InternAtomCookie ---

    @(link_name="xcb_intern_atom_reply")
    intern_atom_reply :: proc(c : ^Connection, cookie : InternAtomCookie, e : ^^GenericError) -> ^InternAtomReply ---

    @(link_name="xcb_get_atom_name_sizeof")
    get_atom_name_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_atom_name")
    get_atom_name :: proc(c : ^Connection, atom : u32) -> GetAtomNameCookie ---

    @(link_name="xcb_get_atom_name_unchecked")
    get_atom_name_unchecked :: proc(c : ^Connection, atom : u32) -> GetAtomNameCookie ---

    @(link_name="xcb_get_atom_name_name")
    get_atom_name_name :: proc(r : ^GetAtomNameReply) -> cstring ---

    @(link_name="xcb_get_atom_name_name_length")
    get_atom_name_name_length :: proc(r : ^GetAtomNameReply) -> _c.int ---

    @(link_name="xcb_get_atom_name_name_end")
    get_atom_name_name_end :: proc(r : ^GetAtomNameReply) -> GenericIterator ---

    @(link_name="xcb_get_atom_name_reply")
    get_atom_name_reply :: proc(c : ^Connection, cookie : GetAtomNameCookie, e : ^^GenericError) -> ^GetAtomNameReply ---

    @(link_name="xcb_change_property_sizeof")
    change_property_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_property_checked")
    change_property_checked :: proc(c : ^Connection, mode : u8, window : u32, property : u32, type : u32, format : u8, data_len : u32, data : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_property")
    change_property :: proc(c : ^Connection, mode : u8, window : u32, property : u32, type : u32, format : u8, data_len : u32, data : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_property_data")
    change_property_data :: proc(r : ^ChangePropertyRequest) -> rawptr ---

    @(link_name="xcb_change_property_data_length")
    change_property_data_length :: proc(r : ^ChangePropertyRequest) -> _c.int ---

    @(link_name="xcb_change_property_data_end")
    change_property_data_end :: proc(r : ^ChangePropertyRequest) -> GenericIterator ---

    @(link_name="xcb_delete_property_checked")
    delete_property_checked :: proc(c : ^Connection, window : u32, property : u32) -> VoidCookie ---

    @(link_name="xcb_delete_property")
    delete_property :: proc(c : ^Connection, window : u32, property : u32) -> VoidCookie ---

    @(link_name="xcb_get_property_sizeof")
    get_property_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_property")
    get_property :: proc(c : ^Connection, delete : u8, window : u32, property : u32, type : u32, long_offset : u32, long_length : u32) -> GetPropertyCookie ---

    @(link_name="xcb_get_property_unchecked")
    get_property_unchecked :: proc(c : ^Connection, delete : u8, window : u32, property : u32, type : u32, long_offset : u32, long_length : u32) -> GetPropertyCookie ---

    @(link_name="xcb_get_property_value")
    get_property_value :: proc(r : ^GetPropertyReply) -> rawptr ---

    @(link_name="xcb_get_property_value_length")
    get_property_value_length :: proc(r : ^GetPropertyReply) -> _c.int ---

    @(link_name="xcb_get_property_value_end")
    get_property_value_end :: proc(r : ^GetPropertyReply) -> GenericIterator ---

    @(link_name="xcb_get_property_reply")
    get_property_reply :: proc(c : ^Connection, cookie : GetPropertyCookie, e : ^^GenericError) -> ^GetPropertyReply ---

    @(link_name="xcb_list_properties_sizeof")
    list_properties_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_properties")
    list_properties :: proc(c : ^Connection, window : u32) -> ListPropertiesCookie ---

    @(link_name="xcb_list_properties_unchecked")
    list_properties_unchecked :: proc(c : ^Connection, window : u32) -> ListPropertiesCookie ---

    @(link_name="xcb_list_properties_atoms")
    list_properties_atoms :: proc(r : ^ListPropertiesReply) -> ^u32 ---

    @(link_name="xcb_list_properties_atoms_length")
    list_properties_atoms_length :: proc(r : ^ListPropertiesReply) -> _c.int ---

    @(link_name="xcb_list_properties_atoms_end")
    list_properties_atoms_end :: proc(r : ^ListPropertiesReply) -> GenericIterator ---

    @(link_name="xcb_list_properties_reply")
    list_properties_reply :: proc(c : ^Connection, cookie : ListPropertiesCookie, e : ^^GenericError) -> ^ListPropertiesReply ---

    @(link_name="xcb_set_selection_owner_checked")
    set_selection_owner_checked :: proc(c : ^Connection, owner : u32, selection : u32, time : u32) -> VoidCookie ---

    @(link_name="xcb_set_selection_owner")
    set_selection_owner :: proc(c : ^Connection, owner : u32, selection : u32, time : u32) -> VoidCookie ---

    @(link_name="xcb_get_selection_owner")
    get_selection_owner :: proc(c : ^Connection, selection : u32) -> GetSelectionOwnerCookie ---

    @(link_name="xcb_get_selection_owner_unchecked")
    get_selection_owner_unchecked :: proc(c : ^Connection, selection : u32) -> GetSelectionOwnerCookie ---

    @(link_name="xcb_get_selection_owner_reply")
    get_selection_owner_reply :: proc(c : ^Connection, cookie : GetSelectionOwnerCookie, e : ^^GenericError) -> ^GetSelectionOwnerReply ---

    @(link_name="xcb_convert_selection_checked")
    convert_selection_checked :: proc(c : ^Connection, requestor : u32, selection : u32, target : u32, property : u32, time : u32) -> VoidCookie ---

    @(link_name="xcb_convert_selection")
    convert_selection :: proc(c : ^Connection, requestor : u32, selection : u32, target : u32, property : u32, time : u32) -> VoidCookie ---

    @(link_name="xcb_send_event_checked")
    send_event_checked :: proc(c : ^Connection, propagate : u8, destination : u32, event_mask : u32, event : cstring) -> VoidCookie ---

    @(link_name="xcb_send_event")
    send_event :: proc(c : ^Connection, propagate : u8, destination : u32, event_mask : u32, event : cstring) -> VoidCookie ---

    @(link_name="xcb_grab_pointer")
    grab_pointer :: proc(c : ^Connection, owner_events : u8, grab_window : u32, event_mask : u16, pointer_mode : u8, keyboard_mode : u8, confine_to : u32, cursor : u32, time : u32) -> GrabPointerCookie ---

    @(link_name="xcb_grab_pointer_unchecked")
    grab_pointer_unchecked :: proc(c : ^Connection, owner_events : u8, grab_window : u32, event_mask : u16, pointer_mode : u8, keyboard_mode : u8, confine_to : u32, cursor : u32, time : u32) -> GrabPointerCookie ---

    @(link_name="xcb_grab_pointer_reply")
    grab_pointer_reply :: proc(c : ^Connection, cookie : GrabPointerCookie, e : ^^GenericError) -> ^GrabPointerReply ---

    @(link_name="xcb_ungrab_pointer_checked")
    ungrab_pointer_checked :: proc(c : ^Connection, time : u32) -> VoidCookie ---

    @(link_name="xcb_ungrab_pointer")
    ungrab_pointer :: proc(c : ^Connection, time : u32) -> VoidCookie ---

    @(link_name="xcb_grab_button_checked")
    grab_button_checked :: proc(c : ^Connection, owner_events : u8, grab_window : u32, event_mask : u16, pointer_mode : u8, keyboard_mode : u8, confine_to : u32, cursor : u32, button : u8, modifiers : u16) -> VoidCookie ---

    @(link_name="xcb_grab_button")
    grab_button :: proc(c : ^Connection, owner_events : u8, grab_window : u32, event_mask : u16, pointer_mode : u8, keyboard_mode : u8, confine_to : u32, cursor : u32, button : u8, modifiers : u16) -> VoidCookie ---

    @(link_name="xcb_ungrab_button_checked")
    ungrab_button_checked :: proc(c : ^Connection, button : u8, grab_window : u32, modifiers : u16) -> VoidCookie ---

    @(link_name="xcb_ungrab_button")
    ungrab_button :: proc(c : ^Connection, button : u8, grab_window : u32, modifiers : u16) -> VoidCookie ---

    @(link_name="xcb_change_active_pointer_grab_checked")
    change_active_pointer_grab_checked :: proc(c : ^Connection, cursor : u32, time : u32, event_mask : u16) -> VoidCookie ---

    @(link_name="xcb_change_active_pointer_grab")
    change_active_pointer_grab :: proc(c : ^Connection, cursor : u32, time : u32, event_mask : u16) -> VoidCookie ---

    @(link_name="xcb_grab_keyboard")
    grab_keyboard :: proc(c : ^Connection, owner_events : u8, grab_window : u32, time : u32, pointer_mode : u8, keyboard_mode : u8) -> GrabKeyboardCookie ---

    @(link_name="xcb_grab_keyboard_unchecked")
    grab_keyboard_unchecked :: proc(c : ^Connection, owner_events : u8, grab_window : u32, time : u32, pointer_mode : u8, keyboard_mode : u8) -> GrabKeyboardCookie ---

    @(link_name="xcb_grab_keyboard_reply")
    grab_keyboard_reply :: proc(c : ^Connection, cookie : GrabKeyboardCookie, e : ^^GenericError) -> ^GrabKeyboardReply ---

    @(link_name="xcb_ungrab_keyboard_checked")
    ungrab_keyboard_checked :: proc(c : ^Connection, time : u32) -> VoidCookie ---

    @(link_name="xcb_ungrab_keyboard")
    ungrab_keyboard :: proc(c : ^Connection, time : u32) -> VoidCookie ---

    @(link_name="xcb_grab_key_checked")
    grab_key_checked :: proc(c : ^Connection, owner_events : u8, grab_window : u32, modifiers : u16, key : u8, pointer_mode : u8, keyboard_mode : u8) -> VoidCookie ---

    @(link_name="xcb_grab_key")
    grab_key :: proc(c : ^Connection, owner_events : u8, grab_window : u32, modifiers : u16, key : u8, pointer_mode : u8, keyboard_mode : u8) -> VoidCookie ---

    @(link_name="xcb_ungrab_key_checked")
    ungrab_key_checked :: proc(c : ^Connection, key : u8, grab_window : u32, modifiers : u16) -> VoidCookie ---

    @(link_name="xcb_ungrab_key")
    ungrab_key :: proc(c : ^Connection, key : u8, grab_window : u32, modifiers : u16) -> VoidCookie ---

    @(link_name="xcb_allow_events_checked")
    allow_events_checked :: proc(c : ^Connection, mode : u8, time : u32) -> VoidCookie ---

    @(link_name="xcb_allow_events")
    allow_events :: proc(c : ^Connection, mode : u8, time : u32) -> VoidCookie ---

    @(link_name="xcb_grab_server_checked")
    grab_server_checked :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_grab_server")
    grab_server :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_ungrab_server_checked")
    ungrab_server_checked :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_ungrab_server")
    ungrab_server :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_query_pointer")
    query_pointer :: proc(c : ^Connection, window : u32) -> QueryPointerCookie ---

    @(link_name="xcb_query_pointer_unchecked")
    query_pointer_unchecked :: proc(c : ^Connection, window : u32) -> QueryPointerCookie ---

    @(link_name="xcb_query_pointer_reply")
    query_pointer_reply :: proc(c : ^Connection, cookie : QueryPointerCookie, e : ^^GenericError) -> ^QueryPointerReply ---

    @(link_name="xcb_timecoord_next")
    timecoord_next :: proc(i : ^TimecoordIterator) ---

    @(link_name="xcb_timecoord_end")
    timecoord_end :: proc(i : TimecoordIterator) -> GenericIterator ---

    @(link_name="xcb_get_motion_events_sizeof")
    get_motion_events_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_motion_events")
    get_motion_events :: proc(c : ^Connection, window : u32, start : u32, stop : u32) -> GetMotionEventsCookie ---

    @(link_name="xcb_get_motion_events_unchecked")
    get_motion_events_unchecked :: proc(c : ^Connection, window : u32, start : u32, stop : u32) -> GetMotionEventsCookie ---

    @(link_name="xcb_get_motion_events_events")
    get_motion_events_events :: proc(r : ^GetMotionEventsReply) -> ^Timecoord ---

    @(link_name="xcb_get_motion_events_events_length")
    get_motion_events_events_length :: proc(r : ^GetMotionEventsReply) -> _c.int ---

    @(link_name="xcb_get_motion_events_events_iterator")
    get_motion_events_events_iterator :: proc(r : ^GetMotionEventsReply) -> TimecoordIterator ---

    @(link_name="xcb_get_motion_events_reply")
    get_motion_events_reply :: proc(c : ^Connection, cookie : GetMotionEventsCookie, e : ^^GenericError) -> ^GetMotionEventsReply ---

    @(link_name="xcb_translate_coordinates")
    translate_coordinates :: proc(c : ^Connection, src_window : u32, dst_window : u32, src_x : i16, src_y : i16) -> TranslateCoordinatesCookie ---

    @(link_name="xcb_translate_coordinates_unchecked")
    translate_coordinates_unchecked :: proc(c : ^Connection, src_window : u32, dst_window : u32, src_x : i16, src_y : i16) -> TranslateCoordinatesCookie ---

    @(link_name="xcb_translate_coordinates_reply")
    translate_coordinates_reply :: proc(c : ^Connection, cookie : TranslateCoordinatesCookie, e : ^^GenericError) -> ^TranslateCoordinatesReply ---

    @(link_name="xcb_warp_pointer_checked")
    warp_pointer_checked :: proc(c : ^Connection, src_window : u32, dst_window : u32, src_x : i16, src_y : i16, src_width : u16, src_height : u16, dst_x : i16, dst_y : i16) -> VoidCookie ---

    @(link_name="xcb_warp_pointer")
    warp_pointer :: proc(c : ^Connection, src_window : u32, dst_window : u32, src_x : i16, src_y : i16, src_width : u16, src_height : u16, dst_x : i16, dst_y : i16) -> VoidCookie ---

    @(link_name="xcb_set_input_focus_checked")
    set_input_focus_checked :: proc(c : ^Connection, revert_to : u8, focus : u32, time : u32) -> VoidCookie ---

    @(link_name="xcb_set_input_focus")
    set_input_focus :: proc(c : ^Connection, revert_to : u8, focus : u32, time : u32) -> VoidCookie ---

    @(link_name="xcb_get_input_focus")
    get_input_focus :: proc(c : ^Connection) -> GetInputFocusCookie ---

    @(link_name="xcb_get_input_focus_unchecked")
    get_input_focus_unchecked :: proc(c : ^Connection) -> GetInputFocusCookie ---

    @(link_name="xcb_get_input_focus_reply")
    get_input_focus_reply :: proc(c : ^Connection, cookie : GetInputFocusCookie, e : ^^GenericError) -> ^GetInputFocusReply ---

    @(link_name="xcb_query_keymap")
    query_keymap :: proc(c : ^Connection) -> QueryKeymapCookie ---

    @(link_name="xcb_query_keymap_unchecked")
    query_keymap_unchecked :: proc(c : ^Connection) -> QueryKeymapCookie ---

    @(link_name="xcb_query_keymap_reply")
    query_keymap_reply :: proc(c : ^Connection, cookie : QueryKeymapCookie, e : ^^GenericError) -> ^QueryKeymapReply ---

    @(link_name="xcb_open_font_sizeof")
    open_font_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_open_font_checked")
    open_font_checked :: proc(c : ^Connection, fid : u32, name_len : u16, name : cstring) -> VoidCookie ---

    @(link_name="xcb_open_font")
    open_font :: proc(c : ^Connection, fid : u32, name_len : u16, name : cstring) -> VoidCookie ---

    @(link_name="xcb_open_font_name")
    open_font_name :: proc(r : ^OpenFontRequest) -> cstring ---

    @(link_name="xcb_open_font_name_length")
    open_font_name_length :: proc(r : ^OpenFontRequest) -> _c.int ---

    @(link_name="xcb_open_font_name_end")
    open_font_name_end :: proc(r : ^OpenFontRequest) -> GenericIterator ---

    @(link_name="xcb_close_font_checked")
    close_font_checked :: proc(c : ^Connection, font : u32) -> VoidCookie ---

    @(link_name="xcb_close_font")
    close_font :: proc(c : ^Connection, font : u32) -> VoidCookie ---

    @(link_name="xcb_fontprop_next")
    fontprop_next :: proc(i : ^FontpropIterator) ---

    @(link_name="xcb_fontprop_end")
    fontprop_end :: proc(i : FontpropIterator) -> GenericIterator ---

    @(link_name="xcb_charinfo_next")
    charinfo_next :: proc(i : ^CharinfoIterator) ---

    @(link_name="xcb_charinfo_end")
    charinfo_end :: proc(i : CharinfoIterator) -> GenericIterator ---

    @(link_name="xcb_query_font_sizeof")
    query_font_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_query_font")
    query_font :: proc(c : ^Connection, font : u32) -> QueryFontCookie ---

    @(link_name="xcb_query_font_unchecked")
    query_font_unchecked :: proc(c : ^Connection, font : u32) -> QueryFontCookie ---

    @(link_name="xcb_query_font_properties")
    query_font_properties :: proc(r : ^QueryFontReply) -> ^Fontprop ---

    @(link_name="xcb_query_font_properties_length")
    query_font_properties_length :: proc(r : ^QueryFontReply) -> _c.int ---

    @(link_name="xcb_query_font_properties_iterator")
    query_font_properties_iterator :: proc(r : ^QueryFontReply) -> FontpropIterator ---

    @(link_name="xcb_query_font_char_infos")
    query_font_char_infos :: proc(r : ^QueryFontReply) -> ^Charinfo ---

    @(link_name="xcb_query_font_char_infos_length")
    query_font_char_infos_length :: proc(r : ^QueryFontReply) -> _c.int ---

    @(link_name="xcb_query_font_char_infos_iterator")
    query_font_char_infos_iterator :: proc(r : ^QueryFontReply) -> CharinfoIterator ---

    @(link_name="xcb_query_font_reply")
    query_font_reply :: proc(c : ^Connection, cookie : QueryFontCookie, e : ^^GenericError) -> ^QueryFontReply ---

    @(link_name="xcb_query_text_extents_sizeof")
    query_text_extents_sizeof :: proc(buffer : rawptr, string_len : u32) -> _c.int ---

    @(link_name="xcb_query_text_extents")
    query_text_extents :: proc(c : ^Connection, font : u32, string_len : u32, string : ^Char2B) -> QueryTextExtentsCookie ---

    @(link_name="xcb_query_text_extents_unchecked")
    query_text_extents_unchecked :: proc(c : ^Connection, font : u32, string_len : u32, string : ^Char2B) -> QueryTextExtentsCookie ---

    @(link_name="xcb_query_text_extents_reply")
    query_text_extents_reply :: proc(c : ^Connection, cookie : QueryTextExtentsCookie, e : ^^GenericError) -> ^QueryTextExtentsReply ---

    @(link_name="xcb_str_sizeof")
    str_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_str_name")
    str_name :: proc(r : ^Str) -> cstring ---

    @(link_name="xcb_str_name_length")
    str_name_length :: proc(r : ^Str) -> _c.int ---

    @(link_name="xcb_str_name_end")
    str_name_end :: proc(r : ^Str) -> GenericIterator ---

    @(link_name="xcb_str_next")
    str_next :: proc(i : ^StrIterator) ---

    @(link_name="xcb_str_end")
    str_end :: proc(i : StrIterator) -> GenericIterator ---

    @(link_name="xcb_list_fonts_sizeof")
    list_fonts_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_fonts")
    list_fonts :: proc(c : ^Connection, max_names : u16, pattern_len : u16, pattern : cstring) -> ListFontsCookie ---

    @(link_name="xcb_list_fonts_unchecked")
    list_fonts_unchecked :: proc(c : ^Connection, max_names : u16, pattern_len : u16, pattern : cstring) -> ListFontsCookie ---

    @(link_name="xcb_list_fonts_names_length")
    list_fonts_names_length :: proc(r : ^ListFontsReply) -> _c.int ---

    @(link_name="xcb_list_fonts_names_iterator")
    list_fonts_names_iterator :: proc(r : ^ListFontsReply) -> StrIterator ---

    @(link_name="xcb_list_fonts_reply")
    list_fonts_reply :: proc(c : ^Connection, cookie : ListFontsCookie, e : ^^GenericError) -> ^ListFontsReply ---

    @(link_name="xcb_list_fonts_with_info_sizeof")
    list_fonts_with_info_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_fonts_with_info")
    list_fonts_with_info :: proc(c : ^Connection, max_names : u16, pattern_len : u16, pattern : cstring) -> ListFontsWithInfoCookie ---

    @(link_name="xcb_list_fonts_with_info_unchecked")
    list_fonts_with_info_unchecked :: proc(c : ^Connection, max_names : u16, pattern_len : u16, pattern : cstring) -> ListFontsWithInfoCookie ---

    @(link_name="xcb_list_fonts_with_info_properties")
    list_fonts_with_info_properties :: proc(r : ^ListFontsWithInfoReply) -> ^Fontprop ---

    @(link_name="xcb_list_fonts_with_info_properties_length")
    list_fonts_with_info_properties_length :: proc(r : ^ListFontsWithInfoReply) -> _c.int ---

    @(link_name="xcb_list_fonts_with_info_properties_iterator")
    list_fonts_with_info_properties_iterator :: proc(r : ^ListFontsWithInfoReply) -> FontpropIterator ---

    @(link_name="xcb_list_fonts_with_info_name")
    list_fonts_with_info_name :: proc(r : ^ListFontsWithInfoReply) -> cstring ---

    @(link_name="xcb_list_fonts_with_info_name_length")
    list_fonts_with_info_name_length :: proc(r : ^ListFontsWithInfoReply) -> _c.int ---

    @(link_name="xcb_list_fonts_with_info_name_end")
    list_fonts_with_info_name_end :: proc(r : ^ListFontsWithInfoReply) -> GenericIterator ---

    @(link_name="xcb_list_fonts_with_info_reply")
    list_fonts_with_info_reply :: proc(c : ^Connection, cookie : ListFontsWithInfoCookie, e : ^^GenericError) -> ^ListFontsWithInfoReply ---

    @(link_name="xcb_set_font_path_sizeof")
    set_font_path_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_font_path_checked")
    set_font_path_checked :: proc(c : ^Connection, font_qty : u16, font : ^Str) -> VoidCookie ---

    @(link_name="xcb_set_font_path")
    set_font_path :: proc(c : ^Connection, font_qty : u16, font : ^Str) -> VoidCookie ---

    @(link_name="xcb_set_font_path_font_length")
    set_font_path_font_length :: proc(r : ^SetFontPathRequest) -> _c.int ---

    @(link_name="xcb_set_font_path_font_iterator")
    set_font_path_font_iterator :: proc(r : ^SetFontPathRequest) -> StrIterator ---

    @(link_name="xcb_get_font_path_sizeof")
    get_font_path_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_font_path")
    get_font_path :: proc(c : ^Connection) -> GetFontPathCookie ---

    @(link_name="xcb_get_font_path_unchecked")
    get_font_path_unchecked :: proc(c : ^Connection) -> GetFontPathCookie ---

    @(link_name="xcb_get_font_path_path_length")
    get_font_path_path_length :: proc(r : ^GetFontPathReply) -> _c.int ---

    @(link_name="xcb_get_font_path_path_iterator")
    get_font_path_path_iterator :: proc(r : ^GetFontPathReply) -> StrIterator ---

    @(link_name="xcb_get_font_path_reply")
    get_font_path_reply :: proc(c : ^Connection, cookie : GetFontPathCookie, e : ^^GenericError) -> ^GetFontPathReply ---

    @(link_name="xcb_create_pixmap_checked")
    create_pixmap_checked :: proc(c : ^Connection, depth : u8, pid : u32, drawable : u32, width : u16, height : u16) -> VoidCookie ---

    @(link_name="xcb_create_pixmap")
    create_pixmap :: proc(c : ^Connection, depth : u8, pid : u32, drawable : u32, width : u16, height : u16) -> VoidCookie ---

    @(link_name="xcb_free_pixmap_checked")
    free_pixmap_checked :: proc(c : ^Connection, pixmap : u32) -> VoidCookie ---

    @(link_name="xcb_free_pixmap")
    free_pixmap :: proc(c : ^Connection, pixmap : u32) -> VoidCookie ---

    @(link_name="xcb_create_gc_value_list_serialize")
    create_gc_value_list_serialize :: proc(buffer : ^rawptr, value_mask : u32, aux : ^CreateGcValueList) -> _c.int ---

    @(link_name="xcb_create_gc_value_list_unpack")
    create_gc_value_list_unpack :: proc(buffer : rawptr, value_mask : u32, aux : ^CreateGcValueList) -> _c.int ---

    @(link_name="xcb_create_gc_value_list_sizeof")
    create_gc_value_list_sizeof :: proc(buffer : rawptr, value_mask : u32) -> _c.int ---

    @(link_name="xcb_create_gc_sizeof")
    create_gc_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_create_gc_checked")
    create_gc_checked :: proc(c : ^Connection, cid : u32, drawable : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_create_gc")
    create_gc :: proc(c : ^Connection, cid : u32, drawable : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_create_gc_aux_checked")
    create_gc_aux_checked :: proc(c : ^Connection, cid : u32, drawable : u32, value_mask : u32, value_list : ^CreateGcValueList) -> VoidCookie ---

    @(link_name="xcb_create_gc_aux")
    create_gc_aux :: proc(c : ^Connection, cid : u32, drawable : u32, value_mask : u32, value_list : ^CreateGcValueList) -> VoidCookie ---

    @(link_name="xcb_create_gc_value_list")
    create_gc_value_list :: proc(r : ^CreateGcRequest) -> rawptr ---

    @(link_name="xcb_change_gc_value_list_serialize")
    change_gc_value_list_serialize :: proc(buffer : ^rawptr, value_mask : u32, aux : ^ChangeGcValueList) -> _c.int ---

    @(link_name="xcb_change_gc_value_list_unpack")
    change_gc_value_list_unpack :: proc(buffer : rawptr, value_mask : u32, aux : ^ChangeGcValueList) -> _c.int ---

    @(link_name="xcb_change_gc_value_list_sizeof")
    change_gc_value_list_sizeof :: proc(buffer : rawptr, value_mask : u32) -> _c.int ---

    @(link_name="xcb_change_gc_sizeof")
    change_gc_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_gc_checked")
    change_gc_checked :: proc(c : ^Connection, gc : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_gc")
    change_gc :: proc(c : ^Connection, gc : u32, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_gc_aux_checked")
    change_gc_aux_checked :: proc(c : ^Connection, gc : u32, value_mask : u32, value_list : ^ChangeGcValueList) -> VoidCookie ---

    @(link_name="xcb_change_gc_aux")
    change_gc_aux :: proc(c : ^Connection, gc : u32, value_mask : u32, value_list : ^ChangeGcValueList) -> VoidCookie ---

    @(link_name="xcb_change_gc_value_list")
    change_gc_value_list :: proc(r : ^ChangeGcRequest) -> rawptr ---

    @(link_name="xcb_copy_gc_checked")
    copy_gc_checked :: proc(c : ^Connection, src_gc : u32, dst_gc : u32, value_mask : u32) -> VoidCookie ---

    @(link_name="xcb_copy_gc")
    copy_gc :: proc(c : ^Connection, src_gc : u32, dst_gc : u32, value_mask : u32) -> VoidCookie ---

    @(link_name="xcb_set_dashes_sizeof")
    set_dashes_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_dashes_checked")
    set_dashes_checked :: proc(c : ^Connection, gc : u32, dash_offset : u16, dashes_len : u16, dashes : ^u8) -> VoidCookie ---

    @(link_name="xcb_set_dashes")
    set_dashes :: proc(c : ^Connection, gc : u32, dash_offset : u16, dashes_len : u16, dashes : ^u8) -> VoidCookie ---

    @(link_name="xcb_set_dashes_dashes")
    set_dashes_dashes :: proc(r : ^SetDashesRequest) -> ^u8 ---

    @(link_name="xcb_set_dashes_dashes_length")
    set_dashes_dashes_length :: proc(r : ^SetDashesRequest) -> _c.int ---

    @(link_name="xcb_set_dashes_dashes_end")
    set_dashes_dashes_end :: proc(r : ^SetDashesRequest) -> GenericIterator ---

    @(link_name="xcb_set_clip_rectangles_sizeof")
    set_clip_rectangles_sizeof :: proc(buffer : rawptr, rectangles_len : u32) -> _c.int ---

    @(link_name="xcb_set_clip_rectangles_checked")
    set_clip_rectangles_checked :: proc(c : ^Connection, ordering : u8, gc : u32, clip_x_origin : i16, clip_y_origin : i16, rectangles_len : u32, rectangles : ^Rectangle) -> VoidCookie ---

    @(link_name="xcb_set_clip_rectangles")
    set_clip_rectangles :: proc(c : ^Connection, ordering : u8, gc : u32, clip_x_origin : i16, clip_y_origin : i16, rectangles_len : u32, rectangles : ^Rectangle) -> VoidCookie ---

    @(link_name="xcb_set_clip_rectangles_rectangles")
    set_clip_rectangles_rectangles :: proc(r : ^SetClipRectanglesRequest) -> ^Rectangle ---

    @(link_name="xcb_set_clip_rectangles_rectangles_length")
    set_clip_rectangles_rectangles_length :: proc(r : ^SetClipRectanglesRequest) -> _c.int ---

    @(link_name="xcb_set_clip_rectangles_rectangles_iterator")
    set_clip_rectangles_rectangles_iterator :: proc(r : ^SetClipRectanglesRequest) -> RectangleIterator ---

    @(link_name="xcb_free_gc_checked")
    free_gc_checked :: proc(c : ^Connection, gc : u32) -> VoidCookie ---

    @(link_name="xcb_free_gc")
    free_gc :: proc(c : ^Connection, gc : u32) -> VoidCookie ---

    @(link_name="xcb_clear_area_checked")
    clear_area_checked :: proc(c : ^Connection, exposures : u8, window : u32, x : i16, y : i16, width : u16, height : u16) -> VoidCookie ---

    @(link_name="xcb_clear_area")
    clear_area :: proc(c : ^Connection, exposures : u8, window : u32, x : i16, y : i16, width : u16, height : u16) -> VoidCookie ---

    @(link_name="xcb_copy_area_checked")
    copy_area_checked :: proc(c : ^Connection, src_drawable : u32, dst_drawable : u32, gc : u32, src_x : i16, src_y : i16, dst_x : i16, dst_y : i16, width : u16, height : u16) -> VoidCookie ---

    @(link_name="xcb_copy_area")
    copy_area :: proc(c : ^Connection, src_drawable : u32, dst_drawable : u32, gc : u32, src_x : i16, src_y : i16, dst_x : i16, dst_y : i16, width : u16, height : u16) -> VoidCookie ---

    @(link_name="xcb_copy_plane_checked")
    copy_plane_checked :: proc(c : ^Connection, src_drawable : u32, dst_drawable : u32, gc : u32, src_x : i16, src_y : i16, dst_x : i16, dst_y : i16, width : u16, height : u16, bit_plane : u32) -> VoidCookie ---

    @(link_name="xcb_copy_plane")
    copy_plane :: proc(c : ^Connection, src_drawable : u32, dst_drawable : u32, gc : u32, src_x : i16, src_y : i16, dst_x : i16, dst_y : i16, width : u16, height : u16, bit_plane : u32) -> VoidCookie ---

    @(link_name="xcb_poly_point_sizeof")
    poly_point_sizeof :: proc(buffer : rawptr, points_len : u32) -> _c.int ---

    @(link_name="xcb_poly_point_checked")
    poly_point_checked :: proc(c : ^Connection, coordinate_mode : u8, drawable : u32, gc : u32, points_len : u32, points : ^Point) -> VoidCookie ---

    @(link_name="xcb_poly_point")
    poly_point :: proc(c : ^Connection, coordinate_mode : u8, drawable : u32, gc : u32, points_len : u32, points : ^Point) -> VoidCookie ---

    @(link_name="xcb_poly_point_points")
    poly_point_points :: proc(r : ^PolyPointRequest) -> ^Point ---

    @(link_name="xcb_poly_point_points_length")
    poly_point_points_length :: proc(r : ^PolyPointRequest) -> _c.int ---

    @(link_name="xcb_poly_point_points_iterator")
    poly_point_points_iterator :: proc(r : ^PolyPointRequest) -> PointIterator ---

    @(link_name="xcb_poly_line_sizeof")
    poly_line_sizeof :: proc(buffer : rawptr, points_len : u32) -> _c.int ---

    @(link_name="xcb_poly_line_checked")
    poly_line_checked :: proc(c : ^Connection, coordinate_mode : u8, drawable : u32, gc : u32, points_len : u32, points : ^Point) -> VoidCookie ---

    @(link_name="xcb_poly_line")
    poly_line :: proc(c : ^Connection, coordinate_mode : u8, drawable : u32, gc : u32, points_len : u32, points : ^Point) -> VoidCookie ---

    @(link_name="xcb_poly_line_points")
    poly_line_points :: proc(r : ^PolyLineRequest) -> ^Point ---

    @(link_name="xcb_poly_line_points_length")
    poly_line_points_length :: proc(r : ^PolyLineRequest) -> _c.int ---

    @(link_name="xcb_poly_line_points_iterator")
    poly_line_points_iterator :: proc(r : ^PolyLineRequest) -> PointIterator ---

    @(link_name="xcb_segment_next")
    segment_next :: proc(i : ^SegmentIterator) ---

    @(link_name="xcb_segment_end")
    segment_end :: proc(i : SegmentIterator) -> GenericIterator ---

    @(link_name="xcb_poly_segment_sizeof")
    poly_segment_sizeof :: proc(buffer : rawptr, segments_len : u32) -> _c.int ---

    @(link_name="xcb_poly_segment_checked")
    poly_segment_checked :: proc(c : ^Connection, drawable : u32, gc : u32, segments_len : u32, segments : ^Segment) -> VoidCookie ---

    @(link_name="xcb_poly_segment")
    poly_segment :: proc(c : ^Connection, drawable : u32, gc : u32, segments_len : u32, segments : ^Segment) -> VoidCookie ---

    @(link_name="xcb_poly_segment_segments")
    poly_segment_segments :: proc(r : ^PolySegmentRequest) -> ^Segment ---

    @(link_name="xcb_poly_segment_segments_length")
    poly_segment_segments_length :: proc(r : ^PolySegmentRequest) -> _c.int ---

    @(link_name="xcb_poly_segment_segments_iterator")
    poly_segment_segments_iterator :: proc(r : ^PolySegmentRequest) -> SegmentIterator ---

    @(link_name="xcb_poly_rectangle_sizeof")
    poly_rectangle_sizeof :: proc(buffer : rawptr, rectangles_len : u32) -> _c.int ---

    @(link_name="xcb_poly_rectangle_checked")
    poly_rectangle_checked :: proc(c : ^Connection, drawable : u32, gc : u32, rectangles_len : u32, rectangles : ^Rectangle) -> VoidCookie ---

    @(link_name="xcb_poly_rectangle")
    poly_rectangle :: proc(c : ^Connection, drawable : u32, gc : u32, rectangles_len : u32, rectangles : ^Rectangle) -> VoidCookie ---

    @(link_name="xcb_poly_rectangle_rectangles")
    poly_rectangle_rectangles :: proc(r : ^PolyRectangleRequest) -> ^Rectangle ---

    @(link_name="xcb_poly_rectangle_rectangles_length")
    poly_rectangle_rectangles_length :: proc(r : ^PolyRectangleRequest) -> _c.int ---

    @(link_name="xcb_poly_rectangle_rectangles_iterator")
    poly_rectangle_rectangles_iterator :: proc(r : ^PolyRectangleRequest) -> RectangleIterator ---

    @(link_name="xcb_poly_arc_sizeof")
    poly_arc_sizeof :: proc(buffer : rawptr, arcs_len : u32) -> _c.int ---

    @(link_name="xcb_poly_arc_checked")
    poly_arc_checked :: proc(c : ^Connection, drawable : u32, gc : u32, arcs_len : u32, arcs : ^Arc) -> VoidCookie ---

    @(link_name="xcb_poly_arc")
    poly_arc :: proc(c : ^Connection, drawable : u32, gc : u32, arcs_len : u32, arcs : ^Arc) -> VoidCookie ---

    @(link_name="xcb_poly_arc_arcs")
    poly_arc_arcs :: proc(r : ^PolyArcRequest) -> ^Arc ---

    @(link_name="xcb_poly_arc_arcs_length")
    poly_arc_arcs_length :: proc(r : ^PolyArcRequest) -> _c.int ---

    @(link_name="xcb_poly_arc_arcs_iterator")
    poly_arc_arcs_iterator :: proc(r : ^PolyArcRequest) -> ArcIterator ---

    @(link_name="xcb_fill_poly_sizeof")
    fill_poly_sizeof :: proc(buffer : rawptr, points_len : u32) -> _c.int ---

    @(link_name="xcb_fill_poly_checked")
    fill_poly_checked :: proc(c : ^Connection, drawable : u32, gc : u32, shape : u8, coordinate_mode : u8, points_len : u32, points : ^Point) -> VoidCookie ---

    @(link_name="xcb_fill_poly")
    fill_poly :: proc(c : ^Connection, drawable : u32, gc : u32, shape : u8, coordinate_mode : u8, points_len : u32, points : ^Point) -> VoidCookie ---

    @(link_name="xcb_fill_poly_points")
    fill_poly_points :: proc(r : ^FillPolyRequest) -> ^Point ---

    @(link_name="xcb_fill_poly_points_length")
    fill_poly_points_length :: proc(r : ^FillPolyRequest) -> _c.int ---

    @(link_name="xcb_fill_poly_points_iterator")
    fill_poly_points_iterator :: proc(r : ^FillPolyRequest) -> PointIterator ---

    @(link_name="xcb_poly_fill_rectangle_sizeof")
    poly_fill_rectangle_sizeof :: proc(buffer : rawptr, rectangles_len : u32) -> _c.int ---

    @(link_name="xcb_poly_fill_rectangle_checked")
    poly_fill_rectangle_checked :: proc(c : ^Connection, drawable : u32, gc : u32, rectangles_len : u32, rectangles : ^Rectangle) -> VoidCookie ---

    @(link_name="xcb_poly_fill_rectangle")
    poly_fill_rectangle :: proc(c : ^Connection, drawable : u32, gc : u32, rectangles_len : u32, rectangles : ^Rectangle) -> VoidCookie ---

    @(link_name="xcb_poly_fill_rectangle_rectangles")
    poly_fill_rectangle_rectangles :: proc(r : ^PolyFillRectangleRequest) -> ^Rectangle ---

    @(link_name="xcb_poly_fill_rectangle_rectangles_length")
    poly_fill_rectangle_rectangles_length :: proc(r : ^PolyFillRectangleRequest) -> _c.int ---

    @(link_name="xcb_poly_fill_rectangle_rectangles_iterator")
    poly_fill_rectangle_rectangles_iterator :: proc(r : ^PolyFillRectangleRequest) -> RectangleIterator ---

    @(link_name="xcb_poly_fill_arc_sizeof")
    poly_fill_arc_sizeof :: proc(buffer : rawptr, arcs_len : u32) -> _c.int ---

    @(link_name="xcb_poly_fill_arc_checked")
    poly_fill_arc_checked :: proc(c : ^Connection, drawable : u32, gc : u32, arcs_len : u32, arcs : ^Arc) -> VoidCookie ---

    @(link_name="xcb_poly_fill_arc")
    poly_fill_arc :: proc(c : ^Connection, drawable : u32, gc : u32, arcs_len : u32, arcs : ^Arc) -> VoidCookie ---

    @(link_name="xcb_poly_fill_arc_arcs")
    poly_fill_arc_arcs :: proc(r : ^PolyFillArcRequest) -> ^Arc ---

    @(link_name="xcb_poly_fill_arc_arcs_length")
    poly_fill_arc_arcs_length :: proc(r : ^PolyFillArcRequest) -> _c.int ---

    @(link_name="xcb_poly_fill_arc_arcs_iterator")
    poly_fill_arc_arcs_iterator :: proc(r : ^PolyFillArcRequest) -> ArcIterator ---

    @(link_name="xcb_put_image_sizeof")
    put_image_sizeof :: proc(buffer : rawptr, data_len : u32) -> _c.int ---

    @(link_name="xcb_put_image_checked")
    put_image_checked :: proc(c : ^Connection, format : u8, drawable : u32, gc : u32, width : u16, height : u16, dst_x : i16, dst_y : i16, left_pad : u8, depth : u8, data_len : u32, data : ^u8) -> VoidCookie ---

    @(link_name="xcb_put_image")
    put_image :: proc(c : ^Connection, format : u8, drawable : u32, gc : u32, width : u16, height : u16, dst_x : i16, dst_y : i16, left_pad : u8, depth : u8, data_len : u32, data : ^u8) -> VoidCookie ---

    @(link_name="xcb_put_image_data")
    put_image_data :: proc(r : ^PutImageRequest) -> ^u8 ---

    @(link_name="xcb_put_image_data_length")
    put_image_data_length :: proc(r : ^PutImageRequest) -> _c.int ---

    @(link_name="xcb_put_image_data_end")
    put_image_data_end :: proc(r : ^PutImageRequest) -> GenericIterator ---

    @(link_name="xcb_get_image_sizeof")
    get_image_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_image")
    get_image :: proc(c : ^Connection, format : u8, drawable : u32, x : i16, y : i16, width : u16, height : u16, plane_mask : u32) -> GetImageCookie ---

    @(link_name="xcb_get_image_unchecked")
    get_image_unchecked :: proc(c : ^Connection, format : u8, drawable : u32, x : i16, y : i16, width : u16, height : u16, plane_mask : u32) -> GetImageCookie ---

    @(link_name="xcb_get_image_data")
    get_image_data :: proc(r : ^GetImageReply) -> ^u8 ---

    @(link_name="xcb_get_image_data_length")
    get_image_data_length :: proc(r : ^GetImageReply) -> _c.int ---

    @(link_name="xcb_get_image_data_end")
    get_image_data_end :: proc(r : ^GetImageReply) -> GenericIterator ---

    @(link_name="xcb_get_image_reply")
    get_image_reply :: proc(c : ^Connection, cookie : GetImageCookie, e : ^^GenericError) -> ^GetImageReply ---

    @(link_name="xcb_poly_text_8_sizeof")
    poly_text_8_sizeof :: proc(buffer : rawptr, items_len : u32) -> _c.int ---

    @(link_name="xcb_poly_text_8_checked")
    poly_text_8_checked :: proc(c : ^Connection, drawable : u32, gc : u32, x : i16, y : i16, items_len : u32, items : ^u8) -> VoidCookie ---

    @(link_name="xcb_poly_text_8")
    poly_text_8 :: proc(c : ^Connection, drawable : u32, gc : u32, x : i16, y : i16, items_len : u32, items : ^u8) -> VoidCookie ---

    @(link_name="xcb_poly_text_8_items")
    poly_text_8_items :: proc(r : ^PolyText8_request) -> ^u8 ---

    @(link_name="xcb_poly_text_8_items_length")
    poly_text_8_items_length :: proc(r : ^PolyText8_request) -> _c.int ---

    @(link_name="xcb_poly_text_8_items_end")
    poly_text_8_items_end :: proc(r : ^PolyText8_request) -> GenericIterator ---

    @(link_name="xcb_poly_text_16_sizeof")
    poly_text_16_sizeof :: proc(buffer : rawptr, items_len : u32) -> _c.int ---

    @(link_name="xcb_poly_text_16_checked")
    poly_text_16_checked :: proc(c : ^Connection, drawable : u32, gc : u32, x : i16, y : i16, items_len : u32, items : ^u8) -> VoidCookie ---

    @(link_name="xcb_poly_text_16")
    poly_text_16 :: proc(c : ^Connection, drawable : u32, gc : u32, x : i16, y : i16, items_len : u32, items : ^u8) -> VoidCookie ---

    @(link_name="xcb_poly_text_16_items")
    poly_text_16_items :: proc(r : ^PolyText16Request) -> ^u8 ---

    @(link_name="xcb_poly_text_16_items_length")
    poly_text_16_items_length :: proc(r : ^PolyText16Request) -> _c.int ---

    @(link_name="xcb_poly_text_16_items_end")
    poly_text_16_items_end :: proc(r : ^PolyText16Request) -> GenericIterator ---

    @(link_name="xcb_image_text_8_sizeof")
    image_text_8_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_image_text_8_checked")
    image_text_8_checked :: proc(c : ^Connection, string_len : u8, drawable : u32, gc : u32, x : i16, y : i16, string : cstring) -> VoidCookie ---

    @(link_name="xcb_image_text_8")
    image_text_8 :: proc(c : ^Connection, string_len : u8, drawable : u32, gc : u32, x : i16, y : i16, string : cstring) -> VoidCookie ---

    @(link_name="xcb_image_text_8_string")
    image_text_8_string :: proc(r : ^ImageText8_request) -> cstring ---

    @(link_name="xcb_image_text_8_string_length")
    image_text_8_string_length :: proc(r : ^ImageText8_request) -> _c.int ---

    @(link_name="xcb_image_text_8_string_end")
    image_text_8_string_end :: proc(r : ^ImageText8_request) -> GenericIterator ---

    @(link_name="xcb_image_text_16_sizeof")
    image_text_16_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_image_text_16_checked")
    image_text_16_checked :: proc(c : ^Connection, string_len : u8, drawable : u32, gc : u32, x : i16, y : i16, string : ^Char2B) -> VoidCookie ---

    @(link_name="xcb_image_text_16")
    image_text_16 :: proc(c : ^Connection, string_len : u8, drawable : u32, gc : u32, x : i16, y : i16, string : ^Char2B) -> VoidCookie ---

    @(link_name="xcb_image_text_16_string")
    image_text_16_string :: proc(r : ^ImageText16Request) -> ^Char2B ---

    @(link_name="xcb_image_text_16_string_length")
    image_text_16_string_length :: proc(r : ^ImageText16Request) -> _c.int ---

    @(link_name="xcb_image_text_16_string_iterator")
    image_text_16_string_iterator :: proc(r : ^ImageText16Request) -> Char2BIterator ---

    @(link_name="xcb_create_colormap_checked")
    create_colormap_checked :: proc(c : ^Connection, alloc : u8, mid : u32, window : u32, visual : u32) -> VoidCookie ---

    @(link_name="xcb_create_colormap")
    create_colormap :: proc(c : ^Connection, alloc : u8, mid : u32, window : u32, visual : u32) -> VoidCookie ---

    @(link_name="xcb_free_colormap_checked")
    free_colormap_checked :: proc(c : ^Connection, cmap : u32) -> VoidCookie ---

    @(link_name="xcb_free_colormap")
    free_colormap :: proc(c : ^Connection, cmap : u32) -> VoidCookie ---

    @(link_name="xcb_copy_colormap_and_free_checked")
    copy_colormap_and_free_checked :: proc(c : ^Connection, mid : u32, src_cmap : u32) -> VoidCookie ---

    @(link_name="xcb_copy_colormap_and_free")
    copy_colormap_and_free :: proc(c : ^Connection, mid : u32, src_cmap : u32) -> VoidCookie ---

    @(link_name="xcb_install_colormap_checked")
    install_colormap_checked :: proc(c : ^Connection, cmap : u32) -> VoidCookie ---

    @(link_name="xcb_install_colormap")
    install_colormap :: proc(c : ^Connection, cmap : u32) -> VoidCookie ---

    @(link_name="xcb_uninstall_colormap_checked")
    uninstall_colormap_checked :: proc(c : ^Connection, cmap : u32) -> VoidCookie ---

    @(link_name="xcb_uninstall_colormap")
    uninstall_colormap :: proc(c : ^Connection, cmap : u32) -> VoidCookie ---

    @(link_name="xcb_list_installed_colormaps_sizeof")
    list_installed_colormaps_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_installed_colormaps")
    list_installed_colormaps :: proc(c : ^Connection, window : u32) -> ListInstalledColormapsCookie ---

    @(link_name="xcb_list_installed_colormaps_unchecked")
    list_installed_colormaps_unchecked :: proc(c : ^Connection, window : u32) -> ListInstalledColormapsCookie ---

    @(link_name="xcb_list_installed_colormaps_cmaps")
    list_installed_colormaps_cmaps :: proc(r : ^ListInstalledColormapsReply) -> ^u32 ---

    @(link_name="xcb_list_installed_colormaps_cmaps_length")
    list_installed_colormaps_cmaps_length :: proc(r : ^ListInstalledColormapsReply) -> _c.int ---

    @(link_name="xcb_list_installed_colormaps_cmaps_end")
    list_installed_colormaps_cmaps_end :: proc(r : ^ListInstalledColormapsReply) -> GenericIterator ---

    @(link_name="xcb_list_installed_colormaps_reply")
    list_installed_colormaps_reply :: proc(c : ^Connection, cookie : ListInstalledColormapsCookie, e : ^^GenericError) -> ^ListInstalledColormapsReply ---

    @(link_name="xcb_alloc_color")
    alloc_color :: proc(c : ^Connection, cmap : u32, red : u16, green : u16, blue : u16) -> AllocColorCookie ---

    @(link_name="xcb_alloc_color_unchecked")
    alloc_color_unchecked :: proc(c : ^Connection, cmap : u32, red : u16, green : u16, blue : u16) -> AllocColorCookie ---

    @(link_name="xcb_alloc_color_reply")
    alloc_color_reply :: proc(c : ^Connection, cookie : AllocColorCookie, e : ^^GenericError) -> ^AllocColorReply ---

    @(link_name="xcb_alloc_named_color_sizeof")
    alloc_named_color_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_alloc_named_color")
    alloc_named_color :: proc(c : ^Connection, cmap : u32, name_len : u16, name : cstring) -> AllocNamedColorCookie ---

    @(link_name="xcb_alloc_named_color_unchecked")
    alloc_named_color_unchecked :: proc(c : ^Connection, cmap : u32, name_len : u16, name : cstring) -> AllocNamedColorCookie ---

    @(link_name="xcb_alloc_named_color_reply")
    alloc_named_color_reply :: proc(c : ^Connection, cookie : AllocNamedColorCookie, e : ^^GenericError) -> ^AllocNamedColorReply ---

    @(link_name="xcb_alloc_color_cells_sizeof")
    alloc_color_cells_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_alloc_color_cells")
    alloc_color_cells :: proc(c : ^Connection, contiguous : u8, cmap : u32, colors : u16, planes : u16) -> AllocColorCellsCookie ---

    @(link_name="xcb_alloc_color_cells_unchecked")
    alloc_color_cells_unchecked :: proc(c : ^Connection, contiguous : u8, cmap : u32, colors : u16, planes : u16) -> AllocColorCellsCookie ---

    @(link_name="xcb_alloc_color_cells_pixels")
    alloc_color_cells_pixels :: proc(r : ^AllocColorCellsReply) -> ^u32 ---

    @(link_name="xcb_alloc_color_cells_pixels_length")
    alloc_color_cells_pixels_length :: proc(r : ^AllocColorCellsReply) -> _c.int ---

    @(link_name="xcb_alloc_color_cells_pixels_end")
    alloc_color_cells_pixels_end :: proc(r : ^AllocColorCellsReply) -> GenericIterator ---

    @(link_name="xcb_alloc_color_cells_masks")
    alloc_color_cells_masks :: proc(r : ^AllocColorCellsReply) -> ^u32 ---

    @(link_name="xcb_alloc_color_cells_masks_length")
    alloc_color_cells_masks_length :: proc(r : ^AllocColorCellsReply) -> _c.int ---

    @(link_name="xcb_alloc_color_cells_masks_end")
    alloc_color_cells_masks_end :: proc(r : ^AllocColorCellsReply) -> GenericIterator ---

    @(link_name="xcb_alloc_color_cells_reply")
    alloc_color_cells_reply :: proc(c : ^Connection, cookie : AllocColorCellsCookie, e : ^^GenericError) -> ^AllocColorCellsReply ---

    @(link_name="xcb_alloc_color_planes_sizeof")
    alloc_color_planes_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_alloc_color_planes")
    alloc_color_planes :: proc(c : ^Connection, contiguous : u8, cmap : u32, colors : u16, reds : u16, greens : u16, blues : u16) -> AllocColorPlanesCookie ---

    @(link_name="xcb_alloc_color_planes_unchecked")
    alloc_color_planes_unchecked :: proc(c : ^Connection, contiguous : u8, cmap : u32, colors : u16, reds : u16, greens : u16, blues : u16) -> AllocColorPlanesCookie ---

    @(link_name="xcb_alloc_color_planes_pixels")
    alloc_color_planes_pixels :: proc(r : ^AllocColorPlanesReply) -> ^u32 ---

    @(link_name="xcb_alloc_color_planes_pixels_length")
    alloc_color_planes_pixels_length :: proc(r : ^AllocColorPlanesReply) -> _c.int ---

    @(link_name="xcb_alloc_color_planes_pixels_end")
    alloc_color_planes_pixels_end :: proc(r : ^AllocColorPlanesReply) -> GenericIterator ---

    @(link_name="xcb_alloc_color_planes_reply")
    alloc_color_planes_reply :: proc(c : ^Connection, cookie : AllocColorPlanesCookie, e : ^^GenericError) -> ^AllocColorPlanesReply ---

    @(link_name="xcb_free_colors_sizeof")
    free_colors_sizeof :: proc(buffer : rawptr, pixels_len : u32) -> _c.int ---

    @(link_name="xcb_free_colors_checked")
    free_colors_checked :: proc(c : ^Connection, cmap : u32, plane_mask : u32, pixels_len : u32, pixels : ^u32) -> VoidCookie ---

    @(link_name="xcb_free_colors")
    free_colors :: proc(c : ^Connection, cmap : u32, plane_mask : u32, pixels_len : u32, pixels : ^u32) -> VoidCookie ---

    @(link_name="xcb_free_colors_pixels")
    free_colors_pixels :: proc(r : ^FreeColorsRequest) -> ^u32 ---

    @(link_name="xcb_free_colors_pixels_length")
    free_colors_pixels_length :: proc(r : ^FreeColorsRequest) -> _c.int ---

    @(link_name="xcb_free_colors_pixels_end")
    free_colors_pixels_end :: proc(r : ^FreeColorsRequest) -> GenericIterator ---

    @(link_name="xcb_coloritem_next")
    coloritem_next :: proc(i : ^ColoritemIterator) ---

    @(link_name="xcb_coloritem_end")
    coloritem_end :: proc(i : ColoritemIterator) -> GenericIterator ---

    @(link_name="xcb_store_colors_sizeof")
    store_colors_sizeof :: proc(buffer : rawptr, items_len : u32) -> _c.int ---

    @(link_name="xcb_store_colors_checked")
    store_colors_checked :: proc(c : ^Connection, cmap : u32, items_len : u32, items : ^Coloritem) -> VoidCookie ---

    @(link_name="xcb_store_colors")
    store_colors :: proc(c : ^Connection, cmap : u32, items_len : u32, items : ^Coloritem) -> VoidCookie ---

    @(link_name="xcb_store_colors_items")
    store_colors_items :: proc(r : ^StoreColorsRequest) -> ^Coloritem ---

    @(link_name="xcb_store_colors_items_length")
    store_colors_items_length :: proc(r : ^StoreColorsRequest) -> _c.int ---

    @(link_name="xcb_store_colors_items_iterator")
    store_colors_items_iterator :: proc(r : ^StoreColorsRequest) -> ColoritemIterator ---

    @(link_name="xcb_store_named_color_sizeof")
    store_named_color_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_store_named_color_checked")
    store_named_color_checked :: proc(c : ^Connection, flags : u8, cmap : u32, pixel : u32, name_len : u16, name : cstring) -> VoidCookie ---

    @(link_name="xcb_store_named_color")
    store_named_color :: proc(c : ^Connection, flags : u8, cmap : u32, pixel : u32, name_len : u16, name : cstring) -> VoidCookie ---

    @(link_name="xcb_store_named_color_name")
    store_named_color_name :: proc(r : ^StoreNamedColorRequest) -> cstring ---

    @(link_name="xcb_store_named_color_name_length")
    store_named_color_name_length :: proc(r : ^StoreNamedColorRequest) -> _c.int ---

    @(link_name="xcb_store_named_color_name_end")
    store_named_color_name_end :: proc(r : ^StoreNamedColorRequest) -> GenericIterator ---

    @(link_name="xcb_rgb_next")
    rgb_next :: proc(i : ^RgbIterator) ---

    @(link_name="xcb_rgb_end")
    rgb_end :: proc(i : RgbIterator) -> GenericIterator ---

    @(link_name="xcb_query_colors_sizeof")
    query_colors_sizeof :: proc(buffer : rawptr, pixels_len : u32) -> _c.int ---

    @(link_name="xcb_query_colors")
    query_colors :: proc(c : ^Connection, cmap : u32, pixels_len : u32, pixels : ^u32) -> QueryColorsCookie ---

    @(link_name="xcb_query_colors_unchecked")
    query_colors_unchecked :: proc(c : ^Connection, cmap : u32, pixels_len : u32, pixels : ^u32) -> QueryColorsCookie ---

    @(link_name="xcb_query_colors_colors")
    query_colors_colors :: proc(r : ^QueryColorsReply) -> ^Rgb ---

    @(link_name="xcb_query_colors_colors_length")
    query_colors_colors_length :: proc(r : ^QueryColorsReply) -> _c.int ---

    @(link_name="xcb_query_colors_colors_iterator")
    query_colors_colors_iterator :: proc(r : ^QueryColorsReply) -> RgbIterator ---

    @(link_name="xcb_query_colors_reply")
    query_colors_reply :: proc(c : ^Connection, cookie : QueryColorsCookie, e : ^^GenericError) -> ^QueryColorsReply ---

    @(link_name="xcb_lookup_color_sizeof")
    lookup_color_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_lookup_color")
    lookup_color :: proc(c : ^Connection, cmap : u32, name_len : u16, name : cstring) -> LookupColorCookie ---

    @(link_name="xcb_lookup_color_unchecked")
    lookup_color_unchecked :: proc(c : ^Connection, cmap : u32, name_len : u16, name : cstring) -> LookupColorCookie ---

    @(link_name="xcb_lookup_color_reply")
    lookup_color_reply :: proc(c : ^Connection, cookie : LookupColorCookie, e : ^^GenericError) -> ^LookupColorReply ---

    @(link_name="xcb_create_cursor_checked")
    create_cursor_checked :: proc(c : ^Connection, cid : u32, source : u32, mask : u32, fore_red : u16, fore_green : u16, fore_blue : u16, back_red : u16, back_green : u16, back_blue : u16, x : u16, y : u16) -> VoidCookie ---

    @(link_name="xcb_create_cursor")
    create_cursor :: proc(c : ^Connection, cid : u32, source : u32, mask : u32, fore_red : u16, fore_green : u16, fore_blue : u16, back_red : u16, back_green : u16, back_blue : u16, x : u16, y : u16) -> VoidCookie ---

    @(link_name="xcb_create_glyph_cursor_checked")
    create_glyph_cursor_checked :: proc(c : ^Connection, cid : u32, source_font : u32, mask_font : u32, source_char : u16, mask_char : u16, fore_red : u16, fore_green : u16, fore_blue : u16, back_red : u16, back_green : u16, back_blue : u16) -> VoidCookie ---

    @(link_name="xcb_create_glyph_cursor")
    create_glyph_cursor :: proc(c : ^Connection, cid : u32, source_font : u32, mask_font : u32, source_char : u16, mask_char : u16, fore_red : u16, fore_green : u16, fore_blue : u16, back_red : u16, back_green : u16, back_blue : u16) -> VoidCookie ---

    @(link_name="xcb_free_cursor_checked")
    free_cursor_checked :: proc(c : ^Connection, cursor : u32) -> VoidCookie ---

    @(link_name="xcb_free_cursor")
    free_cursor :: proc(c : ^Connection, cursor : u32) -> VoidCookie ---

    @(link_name="xcb_recolor_cursor_checked")
    recolor_cursor_checked :: proc(c : ^Connection, cursor : u32, fore_red : u16, fore_green : u16, fore_blue : u16, back_red : u16, back_green : u16, back_blue : u16) -> VoidCookie ---

    @(link_name="xcb_recolor_cursor")
    recolor_cursor :: proc(c : ^Connection, cursor : u32, fore_red : u16, fore_green : u16, fore_blue : u16, back_red : u16, back_green : u16, back_blue : u16) -> VoidCookie ---

    @(link_name="xcb_query_best_size")
    query_best_size :: proc(c : ^Connection, class : u8, drawable : u32, width : u16, height : u16) -> QueryBestSizeCookie ---

    @(link_name="xcb_query_best_size_unchecked")
    query_best_size_unchecked :: proc(c : ^Connection, class : u8, drawable : u32, width : u16, height : u16) -> QueryBestSizeCookie ---

    @(link_name="xcb_query_best_size_reply")
    query_best_size_reply :: proc(c : ^Connection, cookie : QueryBestSizeCookie, e : ^^GenericError) -> ^QueryBestSizeReply ---

    @(link_name="xcb_query_extension_sizeof")
    query_extension_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_query_extension")
    query_extension :: proc(c : ^Connection, name_len : u16, name : cstring) -> QueryExtensionCookie ---

    @(link_name="xcb_query_extension_unchecked")
    query_extension_unchecked :: proc(c : ^Connection, name_len : u16, name : cstring) -> QueryExtensionCookie ---

    @(link_name="xcb_query_extension_reply")
    query_extension_reply :: proc(c : ^Connection, cookie : QueryExtensionCookie, e : ^^GenericError) -> ^QueryExtensionReply ---

    @(link_name="xcb_list_extensions_sizeof")
    list_extensions_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_extensions")
    list_extensions :: proc(c : ^Connection) -> ListExtensionsCookie ---

    @(link_name="xcb_list_extensions_unchecked")
    list_extensions_unchecked :: proc(c : ^Connection) -> ListExtensionsCookie ---

    @(link_name="xcb_list_extensions_names_length")
    list_extensions_names_length :: proc(r : ^ListExtensionsReply) -> _c.int ---

    @(link_name="xcb_list_extensions_names_iterator")
    list_extensions_names_iterator :: proc(r : ^ListExtensionsReply) -> StrIterator ---

    @(link_name="xcb_list_extensions_reply")
    list_extensions_reply :: proc(c : ^Connection, cookie : ListExtensionsCookie, e : ^^GenericError) -> ^ListExtensionsReply ---

    @(link_name="xcb_change_keyboard_mapping_sizeof")
    change_keyboard_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_keyboard_mapping_checked")
    change_keyboard_mapping_checked :: proc(c : ^Connection, keycode_count : u8, first_keycode : u8, keysyms_per_keycode : u8, keysyms : ^u32) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_mapping")
    change_keyboard_mapping :: proc(c : ^Connection, keycode_count : u8, first_keycode : u8, keysyms_per_keycode : u8, keysyms : ^u32) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_mapping_keysyms")
    change_keyboard_mapping_keysyms :: proc(r : ^ChangeKeyboardMappingRequest) -> ^u32 ---

    @(link_name="xcb_change_keyboard_mapping_keysyms_length")
    change_keyboard_mapping_keysyms_length :: proc(r : ^ChangeKeyboardMappingRequest) -> _c.int ---

    @(link_name="xcb_change_keyboard_mapping_keysyms_end")
    change_keyboard_mapping_keysyms_end :: proc(r : ^ChangeKeyboardMappingRequest) -> GenericIterator ---

    @(link_name="xcb_get_keyboard_mapping_sizeof")
    get_keyboard_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_keyboard_mapping")
    get_keyboard_mapping :: proc(c : ^Connection, first_keycode : u8, count : u8) -> GetKeyboardMappingCookie ---

    @(link_name="xcb_get_keyboard_mapping_unchecked")
    get_keyboard_mapping_unchecked :: proc(c : ^Connection, first_keycode : u8, count : u8) -> GetKeyboardMappingCookie ---

    @(link_name="xcb_get_keyboard_mapping_keysyms")
    get_keyboard_mapping_keysyms :: proc(r : ^GetKeyboardMappingReply) -> ^u32 ---

    @(link_name="xcb_get_keyboard_mapping_keysyms_length")
    get_keyboard_mapping_keysyms_length :: proc(r : ^GetKeyboardMappingReply) -> _c.int ---

    @(link_name="xcb_get_keyboard_mapping_keysyms_end")
    get_keyboard_mapping_keysyms_end :: proc(r : ^GetKeyboardMappingReply) -> GenericIterator ---

    @(link_name="xcb_get_keyboard_mapping_reply")
    get_keyboard_mapping_reply :: proc(c : ^Connection, cookie : GetKeyboardMappingCookie, e : ^^GenericError) -> ^GetKeyboardMappingReply ---

    @(link_name="xcb_change_keyboard_control_value_list_serialize")
    change_keyboard_control_value_list_serialize :: proc(buffer : ^rawptr, value_mask : u32, aux : ^ChangeKeyboardControlValueList) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_value_list_unpack")
    change_keyboard_control_value_list_unpack :: proc(buffer : rawptr, value_mask : u32, aux : ^ChangeKeyboardControlValueList) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_value_list_sizeof")
    change_keyboard_control_value_list_sizeof :: proc(buffer : rawptr, value_mask : u32) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_sizeof")
    change_keyboard_control_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_keyboard_control_checked")
    change_keyboard_control_checked :: proc(c : ^Connection, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control")
    change_keyboard_control :: proc(c : ^Connection, value_mask : u32, value_list : rawptr) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control_aux_checked")
    change_keyboard_control_aux_checked :: proc(c : ^Connection, value_mask : u32, value_list : ^ChangeKeyboardControlValueList) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control_aux")
    change_keyboard_control_aux :: proc(c : ^Connection, value_mask : u32, value_list : ^ChangeKeyboardControlValueList) -> VoidCookie ---

    @(link_name="xcb_change_keyboard_control_value_list")
    change_keyboard_control_value_list :: proc(r : ^ChangeKeyboardControlRequest) -> rawptr ---

    @(link_name="xcb_get_keyboard_control")
    get_keyboard_control :: proc(c : ^Connection) -> GetKeyboardControlCookie ---

    @(link_name="xcb_get_keyboard_control_unchecked")
    get_keyboard_control_unchecked :: proc(c : ^Connection) -> GetKeyboardControlCookie ---

    @(link_name="xcb_get_keyboard_control_reply")
    get_keyboard_control_reply :: proc(c : ^Connection, cookie : GetKeyboardControlCookie, e : ^^GenericError) -> ^GetKeyboardControlReply ---

    @(link_name="xcb_bell_checked")
    bell_checked :: proc(c : ^Connection, percent : i8) -> VoidCookie ---

    @(link_name="xcb_bell")
    bell :: proc(c : ^Connection, percent : i8) -> VoidCookie ---

    @(link_name="xcb_change_pointer_control_checked")
    change_pointer_control_checked :: proc(c : ^Connection, acceleration_numerator : i16, acceleration_denominator : i16, threshold : i16, do_acceleration : u8, do_threshold : u8) -> VoidCookie ---

    @(link_name="xcb_change_pointer_control")
    change_pointer_control :: proc(c : ^Connection, acceleration_numerator : i16, acceleration_denominator : i16, threshold : i16, do_acceleration : u8, do_threshold : u8) -> VoidCookie ---

    @(link_name="xcb_get_pointer_control")
    get_pointer_control :: proc(c : ^Connection) -> GetPointerControlCookie ---

    @(link_name="xcb_get_pointer_control_unchecked")
    get_pointer_control_unchecked :: proc(c : ^Connection) -> GetPointerControlCookie ---

    @(link_name="xcb_get_pointer_control_reply")
    get_pointer_control_reply :: proc(c : ^Connection, cookie : GetPointerControlCookie, e : ^^GenericError) -> ^GetPointerControlReply ---

    @(link_name="xcb_set_screen_saver_checked")
    set_screen_saver_checked :: proc(c : ^Connection, timeout : i16, interval : i16, prefer_blanking : u8, allow_exposures : u8) -> VoidCookie ---

    @(link_name="xcb_set_screen_saver")
    set_screen_saver :: proc(c : ^Connection, timeout : i16, interval : i16, prefer_blanking : u8, allow_exposures : u8) -> VoidCookie ---

    @(link_name="xcb_get_screen_saver")
    get_screen_saver :: proc(c : ^Connection) -> GetScreenSaverCookie ---

    @(link_name="xcb_get_screen_saver_unchecked")
    get_screen_saver_unchecked :: proc(c : ^Connection) -> GetScreenSaverCookie ---

    @(link_name="xcb_get_screen_saver_reply")
    get_screen_saver_reply :: proc(c : ^Connection, cookie : GetScreenSaverCookie, e : ^^GenericError) -> ^GetScreenSaverReply ---

    @(link_name="xcb_change_hosts_sizeof")
    change_hosts_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_change_hosts_checked")
    change_hosts_checked :: proc(c : ^Connection, mode : u8, family : u8, address_len : u16, address : ^u8) -> VoidCookie ---

    @(link_name="xcb_change_hosts")
    change_hosts :: proc(c : ^Connection, mode : u8, family : u8, address_len : u16, address : ^u8) -> VoidCookie ---

    @(link_name="xcb_change_hosts_address")
    change_hosts_address :: proc(r : ^ChangeHostsRequest) -> ^u8 ---

    @(link_name="xcb_change_hosts_address_length")
    change_hosts_address_length :: proc(r : ^ChangeHostsRequest) -> _c.int ---

    @(link_name="xcb_change_hosts_address_end")
    change_hosts_address_end :: proc(r : ^ChangeHostsRequest) -> GenericIterator ---

    @(link_name="xcb_host_sizeof")
    host_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_host_address")
    host_address :: proc(r : ^Host) -> ^u8 ---

    @(link_name="xcb_host_address_length")
    host_address_length :: proc(r : ^Host) -> _c.int ---

    @(link_name="xcb_host_address_end")
    host_address_end :: proc(r : ^Host) -> GenericIterator ---

    @(link_name="xcb_host_next")
    host_next :: proc(i : ^HostIterator) ---

    @(link_name="xcb_host_end")
    host_end :: proc(i : HostIterator) -> GenericIterator ---

    @(link_name="xcb_list_hosts_sizeof")
    list_hosts_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_list_hosts")
    list_hosts :: proc(c : ^Connection) -> ListHostsCookie ---

    @(link_name="xcb_list_hosts_unchecked")
    list_hosts_unchecked :: proc(c : ^Connection) -> ListHostsCookie ---

    @(link_name="xcb_list_hosts_hosts_length")
    list_hosts_hosts_length :: proc(r : ^ListHostsReply) -> _c.int ---

    @(link_name="xcb_list_hosts_hosts_iterator")
    list_hosts_hosts_iterator :: proc(r : ^ListHostsReply) -> HostIterator ---

    @(link_name="xcb_list_hosts_reply")
    list_hosts_reply :: proc(c : ^Connection, cookie : ListHostsCookie, e : ^^GenericError) -> ^ListHostsReply ---

    @(link_name="xcb_set_access_control_checked")
    set_access_control_checked :: proc(c : ^Connection, mode : u8) -> VoidCookie ---

    @(link_name="xcb_set_access_control")
    set_access_control :: proc(c : ^Connection, mode : u8) -> VoidCookie ---

    @(link_name="xcb_set_close_down_mode_checked")
    set_close_down_mode_checked :: proc(c : ^Connection, mode : u8) -> VoidCookie ---

    @(link_name="xcb_set_close_down_mode")
    set_close_down_mode :: proc(c : ^Connection, mode : u8) -> VoidCookie ---

    @(link_name="xcb_kill_client_checked")
    kill_client_checked :: proc(c : ^Connection, resource : u32) -> VoidCookie ---

    @(link_name="xcb_kill_client")
    kill_client :: proc(c : ^Connection, resource : u32) -> VoidCookie ---

    @(link_name="xcb_rotate_properties_sizeof")
    rotate_properties_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_rotate_properties_checked")
    rotate_properties_checked :: proc(c : ^Connection, window : u32, atoms_len : u16, delta : i16, atoms : ^u32) -> VoidCookie ---

    @(link_name="xcb_rotate_properties")
    rotate_properties :: proc(c : ^Connection, window : u32, atoms_len : u16, delta : i16, atoms : ^u32) -> VoidCookie ---

    @(link_name="xcb_rotate_properties_atoms")
    rotate_properties_atoms :: proc(r : ^RotatePropertiesRequest) -> ^u32 ---

    @(link_name="xcb_rotate_properties_atoms_length")
    rotate_properties_atoms_length :: proc(r : ^RotatePropertiesRequest) -> _c.int ---

    @(link_name="xcb_rotate_properties_atoms_end")
    rotate_properties_atoms_end :: proc(r : ^RotatePropertiesRequest) -> GenericIterator ---

    @(link_name="xcb_force_screen_saver_checked")
    force_screen_saver_checked :: proc(c : ^Connection, mode : u8) -> VoidCookie ---

    @(link_name="xcb_force_screen_saver")
    force_screen_saver :: proc(c : ^Connection, mode : u8) -> VoidCookie ---

    @(link_name="xcb_set_pointer_mapping_sizeof")
    set_pointer_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_pointer_mapping")
    set_pointer_mapping :: proc(c : ^Connection, map_len : u8, _map : ^u8) -> SetPointerMappingCookie ---

    @(link_name="xcb_set_pointer_mapping_unchecked")
    set_pointer_mapping_unchecked :: proc(c : ^Connection, map_len : u8, _map : ^u8) -> SetPointerMappingCookie ---

    @(link_name="xcb_set_pointer_mapping_reply")
    set_pointer_mapping_reply :: proc(c : ^Connection, cookie : SetPointerMappingCookie, e : ^^GenericError) -> ^SetPointerMappingReply ---

    @(link_name="xcb_get_pointer_mapping_sizeof")
    get_pointer_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_pointer_mapping")
    get_pointer_mapping :: proc(c : ^Connection) -> GetPointerMappingCookie ---

    @(link_name="xcb_get_pointer_mapping_unchecked")
    get_pointer_mapping_unchecked :: proc(c : ^Connection) -> GetPointerMappingCookie ---

    @(link_name="xcb_get_pointer_mapping_map")
    get_pointer_mapping_map :: proc(r : ^GetPointerMappingReply) -> ^u8 ---

    @(link_name="xcb_get_pointer_mapping_map_length")
    get_pointer_mapping_map_length :: proc(r : ^GetPointerMappingReply) -> _c.int ---

    @(link_name="xcb_get_pointer_mapping_map_end")
    get_pointer_mapping_map_end :: proc(r : ^GetPointerMappingReply) -> GenericIterator ---

    @(link_name="xcb_get_pointer_mapping_reply")
    get_pointer_mapping_reply :: proc(c : ^Connection, cookie : GetPointerMappingCookie, e : ^^GenericError) -> ^GetPointerMappingReply ---

    @(link_name="xcb_set_modifier_mapping_sizeof")
    set_modifier_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_set_modifier_mapping")
    set_modifier_mapping :: proc(c : ^Connection, keycodes_per_modifier : u8, keycodes : ^u8) -> SetModifierMappingCookie ---

    @(link_name="xcb_set_modifier_mapping_unchecked")
    set_modifier_mapping_unchecked :: proc(c : ^Connection, keycodes_per_modifier : u8, keycodes : ^u8) -> SetModifierMappingCookie ---

    @(link_name="xcb_set_modifier_mapping_reply")
    set_modifier_mapping_reply :: proc(c : ^Connection, cookie : SetModifierMappingCookie, e : ^^GenericError) -> ^SetModifierMappingReply ---

    @(link_name="xcb_get_modifier_mapping_sizeof")
    get_modifier_mapping_sizeof :: proc(buffer : rawptr) -> _c.int ---

    @(link_name="xcb_get_modifier_mapping")
    get_modifier_mapping :: proc(c : ^Connection) -> GetModifierMappingCookie ---

    @(link_name="xcb_get_modifier_mapping_unchecked")
    get_modifier_mapping_unchecked :: proc(c : ^Connection) -> GetModifierMappingCookie ---

    @(link_name="xcb_get_modifier_mapping_keycodes")
    get_modifier_mapping_keycodes :: proc(r : ^GetModifierMappingReply) -> ^u8 ---

    @(link_name="xcb_get_modifier_mapping_keycodes_length")
    get_modifier_mapping_keycodes_length :: proc(r : ^GetModifierMappingReply) -> _c.int ---

    @(link_name="xcb_get_modifier_mapping_keycodes_end")
    get_modifier_mapping_keycodes_end :: proc(r : ^GetModifierMappingReply) -> GenericIterator ---

    @(link_name="xcb_get_modifier_mapping_reply")
    get_modifier_mapping_reply :: proc(c : ^Connection, cookie : GetModifierMappingCookie, e : ^^GenericError) -> ^GetModifierMappingReply ---

    @(link_name="xcb_no_operation_checked")
    no_operation_checked :: proc(c : ^Connection) -> VoidCookie ---

    @(link_name="xcb_no_operation")
    no_operation :: proc(c : ^Connection) -> VoidCookie ---

}
