hl.window_rule({
    name = "vim-anywhere",
    match = {
        class = "vim-anywhere",
    },
    float = true,
    center = true,
    size = "80% 80%",
    opacity = "0.85 0.85",
})

hl.window_rule({
    name = "messages-apps",
    match = {
        class = "^(discord|Discord|zapzap|ZapZap|com\\.rtosta\\.zapzap)$",
    },
    workspace = "name:M silent",
})

hl.window_rule({
    name = "notes-app",
    match = {
        class = "^(obsidian|Obsidian)$",
    },
    workspace = "name:N silent",
})

hl.workspace_rule({
    workspace = "name:M",
    default_name = "M",
})

hl.workspace_rule({
    workspace = "name:N",
    default_name = "N",
})

hl.layer_rule({
    name = "vicinae-blur",
    match = {
        namespace = "vicinae",
    },
    blur = true,
    ignore_alpha = 0,
})
