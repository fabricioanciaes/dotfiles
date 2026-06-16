hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "intl",
        kb_model = "",
        kb_options = "caps:escape",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
            scroll_factor = 0.25,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
