-- General window/workspace behavior (was general.conf)
hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        col = {
            inactive_border = "rgba(000000ff)",
            active_border = "rgba(333333ff)",
        },
        no_focus_fallback = true,
        layout = "scrolling",
        allow_tearing = true,
        resize_on_border = true,
    },
})

hl.config({
    scrolling = {
        explicit_column_widths = "0.5, 1.0",
    },
})
