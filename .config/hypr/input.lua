-- Input devices (was input.conf)
hl.config({
  input = {
    kb_layout = "us,ara",
    kb_options = "grp:alt_shift_toggle",
    kb_variant = "",
    kb_model = "",
    kb_rules = "",

    follow_mouse = 1,
    sensitivity = 0.5,
    special_fallthrough = false,

    touchpad = {
      natural_scroll = true,
      disable_while_typing = true,
      clickfinger_behavior = false,
      drag_lock = 1, -- was `true`; 1 = enabled with timeout
      tap_and_drag = true, -- renamed from tap-and-drag
    },
  },
})

hl.device({
  name = "elan0518:01-04f3:31fc-touchpad",
  sensitivity = 0,
})

hl.device({
  name = "at-translated-set-2-keyboard",
  kb_options = "grp:alt_shift_toggle, caps:swapescape",
})
