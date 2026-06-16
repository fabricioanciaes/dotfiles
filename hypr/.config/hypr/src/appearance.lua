local noctalia = require("src.noctalia")
local colors = noctalia.colors()

local function current_workspace_window_count()
    local workspace = hl.get_active_workspace()
    if not workspace then
        return nil
    end

    local windows = hl.get_workspace_windows(workspace)
    if type(windows) ~= "table" then
        return nil
    end

    return #windows
end

local function apply_workspace_rule()
    local workspace = hl.get_active_workspace()
    if not workspace then
        return
    end

    local count = current_workspace_window_count()
    local ws = workspace.name or workspace.id

    if count == 1 then
        hl.workspace_rule({
            workspace = ws,
            no_border = true,
            gaps_in = 0,
            gaps_out = 0,
        })
    else
        hl.workspace_rule({
            workspace = ws,
            no_border = false,
            gaps_in = 0,
            gaps_out = 0,
        })
    end
end

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        col = {
            active_border = colors.primary or "rgb(b4c5ff)",
            inactive_border = colors.surface or "rgb(131316)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "scrolling",
    },

    decoration = {
        rounding = 4,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        focus_fit_method = 1,
        follow_focus = true,
        follow_min_visible = 0.4,
        explicit_column_widths = "0.5, 1.0",
        wrap_focus = true,
        wrap_swapcol = true,
        direction = "right",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        focus_on_activate = true,
    },

    group = {
        col = {
            border_active = colors.secondary or "rgb(c1c5dd)",
            border_inactive = colors.surface or "rgb(131316)",
            border_locked_active = colors.error or "rgb(ffb4ab)",
            border_locked_inactive = colors.surface or "rgb(131316)",
        },
        groupbar = {
            col = {
                active = colors.secondary or "rgb(c1c5dd)",
                inactive = colors.surface or "rgb(131316)",
                locked_active = colors.error or "rgb(ffb4ab)",
                locked_inactive = colors.surface or "rgb(131316)",
            },
        },
    },
})

hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("softAcDecel", { type = "bezier", points = { { 0.26, 0.26 }, { 0.15, 1 } } })
hl.curve("md2", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 5%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 5%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "md3_accel", style = "popin 5%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "md3_decel" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 1, bezier = "menu_decel", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1, bezier = "menu_accel", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1, bezier = "md3_standard" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1, bezier = "md3_standard" })
hl.animation({ leaf = "workspaces", enabled = false })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1, bezier = "md3_standard", style = "slidefadevert -5%" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 2, bezier = "md3_decel" })

hl.on("hyprland.start", apply_workspace_rule)
hl.on("window.open", apply_workspace_rule)
hl.on("window.close", apply_workspace_rule)
hl.on("window.destroy", apply_workspace_rule)
hl.on("window.kill", apply_workspace_rule)
hl.on("window.move_to_workspace", apply_workspace_rule)
hl.on("workspace.active", apply_workspace_rule)
hl.on("workspace.created", apply_workspace_rule)
hl.on("workspace.removed", apply_workspace_rule)
