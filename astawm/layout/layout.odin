package layout

import "core:builtin"

Series :: enum {
    ROW, COLUMN,
}

SingleLayout :: struct {
    using padding : Padding,
}

Padding :: struct {
    padding_left, padding_top, padding_right, padding_bottom : u16,
}

SeriesLayout :: struct {
    using padding : Padding,
    gap_between : u16,
    max : u16, // 0 means infinite
    type : Series,
    reverse : bool,
}

MetaLayout :: struct {
    outer : ^Layout,
    inner : ^Layout,
}

LayoutData :: struct {
    amount : u16,

    // used in MetaLayout and DistributeLayout
    outer : ^LayoutData,
    inner : [dynamic]LayoutData,
}

Layout :: union #no_nil {
    SingleLayout,
    SeriesLayout,
    MetaLayout,
}

delete :: proc(data : LayoutData) {
    if data.outer != nil {
        delete(data.outer^)
        free(data.outer)
    }

    for inner in data.inner do delete(inner)
    builtin.delete(data.inner)
}

is_finite :: proc(layout : Layout) -> bool {
    switch l in layout {
    case SingleLayout:
        return true
    case SeriesLayout:
        return l.max > 0
    case MetaLayout:
        return is_finite(l.outer^) && is_finite(l.inner^)
    case:
        panic("undefined layout")
    }
}

remove :: proc(layout : Layout, data : ^LayoutData, idx : u16) {
    data.amount -= 1

    switch l in layout {
    case SingleLayout:
    case SeriesLayout:
    case MetaLayout:
        // get sub-index
        index : u16 = 0
        offset : u16 = 0

        for idx >= offset + data.inner[index].amount {
            offset += data.inner[index].amount
            index += 1
        }

        // remove
        remove(l.inner^, &data.inner[index], idx - offset)

        if data.inner[index].amount == 0 {
            delete(data.inner[index])
            ordered_remove(&data.inner, int(index))

            remove(l.outer^, data.outer, index)
        }
    case:
        panic("undefined layout")
    }
}

insert_first :: proc(layout : Layout, data : ^LayoutData) -> bool {
    switch l in layout {
    case SingleLayout:
        if data.amount == 0 {
            data.amount = 1
            return true
        }
    case SeriesLayout:
        if l.max == 0 || data.amount < l.max {
            data.amount += 1
            return true
        }
    case MetaLayout:
        if data.outer == nil do data.outer = new(LayoutData)

        if len(data.inner) > 0 && insert_first(l.inner^, &data.inner[0]) {
            data.amount += 1
            return true
        } else if insert_first(l.outer^, data.outer) {
            inject_at(&data.inner, 0, LayoutData{})
            assert(insert_first(l.inner^, &data.inner[0]))

            data.amount += 1
            return true
        }
    case:
        panic("undefined layout")
    }

    return false
}

insert_last :: proc(layout : Layout, data : ^LayoutData) -> bool {
    switch l in layout {
    case SingleLayout:
        if data.amount == 0 {
            data.amount = 1
            return true
        }
    case SeriesLayout:
        if l.max == 0 || data.amount < l.max {
            data.amount += 1
            return true
        }
    case MetaLayout:
        if data.outer == nil do data.outer = new(LayoutData)

        if len(data.inner) > 0 && insert_last(l.inner^, &data.inner[len(data.inner) - 1]) {
            data.amount += 1
            return true
        } else if insert_last(l.outer^, data.outer) {
            append(&data.inner, LayoutData{})
            assert(insert_last(l.inner^, &data.inner[len(data.inner) - 1]))

            data.amount += 1
            return true
        }
    case:
        panic("undefined layout")
    }

    return false
}

insert_after :: proc(layout : Layout, data : ^LayoutData, idx : u16) -> (u16, bool) {

    assert(idx <= data.amount)

    switch l in layout {
    case SingleLayout:
    case SeriesLayout:
        if l.max == 0 || data.amount < l.max {
            data.amount += 1
            return idx + 1, true
        }
    case MetaLayout:
        // get sub-index
        index : u16 = 0
        offset : u16 = 0

        for idx >= offset + data.inner[index].amount {
            offset += data.inner[index].amount
            index += 1
        }

        // add to sub-layout
        if inner_index, ok := insert_after(l.inner^, &data.inner[index], idx - offset); ok {
            data.amount += 1
            return offset + inner_index, true
        }

        // add new sub-layout
        if outer_index, ok := insert_after(l.outer^, data.outer, index); ok {
            inject_at(&data.inner, int(outer_index), LayoutData{})
            assert(insert_first(l.inner^, &data.inner[outer_index]))

            offset = 0
            for d in data.inner[:outer_index] do offset += d.amount

            data.amount += 1
            return offset, true
        }
    case:
        panic("undefined layout")
    }

    return 0, false
}

calc_inner_layout :: proc(layout : Layout, data : LayoutData, using desktop_size : Size, amount_override : u16 = 0) -> []Rect {

    // prevent division by 0
    if data.amount == 0 do return {}

    overshoot := max(data.amount, amount_override)

    rects := make([]Rect, data.amount)

    switch l in layout {
    case SingleLayout:
        // single window filling the entire screen
        rects[0] = rect(
            i16(l.padding_left),
            i16(l.padding_top),
            width  - l.padding_left - l.padding_right,
            height - l.padding_top  - l.padding_bottom,
        )

    case SeriesLayout:
        // row or column of windows
        inner_width  := width  - l.padding_left - l.padding_right
        inner_height := height - l.padding_top  - l.padding_bottom

        switch l.type {
        case .ROW:
            inner_width = (inner_width + l.gap_between) / overshoot - l.gap_between
            for i in 0..<data.amount {
                j := data.amount - 1 - i if l.reverse else i
                rects[i] = rect(
                    i16(l.padding_left) + i16(inner_width + l.gap_between) * i16(j),
                    i16(l.padding_top),
                    inner_width,
                    inner_height,
                )
            }
        case .COLUMN:
            inner_height = (inner_height + l.gap_between) / overshoot - l.gap_between
            for i in 0..<data.amount {
                j := data.amount - 1 - i if l.reverse else i
                rects[i] = rect(
                    i16(l.padding_left),
                    i16(l.padding_top) + i16(inner_height + l.gap_between) * i16(j),
                    inner_width,
                    inner_height,
                )
            }
        }

    case MetaLayout:
        // layout of layouts
        overshoot = (overshoot * data.outer.amount - 1) / data.amount + 1
        outer_rects := calc_inner_layout(l.outer^, data.outer^, desktop_size, overshoot)

        i := 0

        for outer_rect, idx in outer_rects {
            count := data.inner[idx].amount
            inner_rects := calc_inner_layout(l.inner^, data.inner[idx], outer_rect.size)

            for inner_rect in inner_rects {
                rects[i] = Rect {
                    outer_rect.pos + inner_rect.pos,
                    inner_rect.size,
                }
                i += 1
            }
        }

    case:
        panic("undefined layout")
    }

    return rects

}
