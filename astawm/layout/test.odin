package layout

import "core:fmt"

main :: proc() {
    layout := cast(Layout) MetaLayout {
        &cast(Layout) SeriesLayout { {}, 0, 2, Series.ROW,    false  },
        &cast(Layout) SeriesLayout { {}, 0, 0, Series.COLUMN, true },
    }

    data : LayoutData

    insert_first(layout, &data)

    last : u16 = 0

    for i in 1..<10 {
        last, _ = insert_after(layout, &data, last)
        fmt.println(calc_inner_layout(layout, data, { 100, 100 }))
    }
}
