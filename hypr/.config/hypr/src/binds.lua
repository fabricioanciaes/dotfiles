local core = require("src.core")

local function bind(keys, action, description, options)
    options = options or {}
    options.description = description
    hl.bind(keys, action, options)
end

bind(core.mainMod .. " + RETURN", hl.dsp.exec_cmd(core.terminal), "Open terminal")
bind(core.mainMod .. " + Q", hl.dsp.window.close(), "Close focused window")
bind(core.mainMod .. " + code:24", hl.dsp.window.close(), "Close focused window")
bind("CTRL + SPACE", hl.dsp.exec_cmd("vicinae deeplink 'vicinae://launch/wm/switch-windows'"), "Open window switcher")
bind(core.mainMod .. " + e", hl.dsp.exec_cmd(core.fileManager), "Open file manager")
bind(core.mainMod .. " + b", hl.dsp.exec_cmd(core.browser), "Open browser")
bind(core.mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), "Toggle floating window")
bind(core.mainMod .. " + F", hl.dsp.layout("colresize +conf"), "Toggle configured column width")
bind(core.mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }), "Toggle fullscreen")
bind(core.mainMod .. " + SPACE", hl.dsp.exec_cmd(core.menu), "Open app launcher")
bind(core.mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd(core.clipboard), "Open clipboard history")
bind(core.mainMod .. " + P", hl.dsp.window.pseudo(), "Toggle pseudotiling")
bind(core.mainMod .. " + slash", hl.dsp.layout("promote"), "Promote window")
bind(core.mainMod .. " + ESCAPE", hl.dsp.exec_cmd(core.powerMenu), "Open power menu")
bind(core.mainMod .. " + F12", hl.dsp.exec_cmd(core.lockScreen), "Lock screen")
bind(core.mainMod .. " + SHIFT + e", hl.dsp.exec_cmd("~/.local/bin/vim-anywhere"), "Open vim-anywhere")

bind("CTRL + SHIFT + 4", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"), "Screenshot region to clipboard")
bind("CTRL + SHIFT + 3", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"), "Screenshot window to clipboard")

bind(core.mainMod .. " + CTRL + I", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call network togglePanel"), "Toggle network panel")
bind(core.mainMod .. " + CTRL + B", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call bluetooth togglePanel"), "Toggle Bluetooth panel")
bind(core.mainMod .. " + C", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:clipper toggle"), "Toggle clipper")
bind(core.mainMod .. " + S", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:screen-toolkit toggle"), "Toggle screen toolkit (screenshot/screen recording/ocr/etc.)")
bind(core.mainMod .. " + CTRL + V", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call volume togglePanel"), "Toggle volume panel")

bind(core.mainMod .. " + SHIFT + T", hl.dsp.group.toggle(), "Toggle window group")
bind(core.mainMod .. " + T", hl.dsp.group.next(), "Focus next grouped window")

bind(core.mainMod .. " + TAB", core.dispatch("movecurrentworkspacetomonitor r"), "Move workspace to right monitor")
bind(core.mainMod .. " + SHIFT + TAB", core.dispatch("movecurrentworkspacetomonitor l"), "Move workspace to left monitor")

bind(core.mainMod .. " + H", hl.dsp.layout("focus l"), "Focus left column")
bind(core.mainMod .. " + J", hl.dsp.focus({ direction = "down" }), "Focus window below")
bind(core.mainMod .. " + K", hl.dsp.focus({ direction = "up" }), "Focus window above")
bind(core.mainMod .. " + L", hl.dsp.layout("focus r"), "Focus right column")

bind(core.mainMod .. " + SHIFT + H", hl.dsp.layout("swapcol l"), "Move column left")
bind(core.mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }), "Move window down")
bind(core.mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }), "Move window up")
bind(core.mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"), "Move column right")
bind(core.mainMod .. " + minus", hl.dsp.layout("colresize -0.05"), "Shrink column")
bind(core.mainMod .. " + equal", hl.dsp.layout("colresize +0.05"), "Grow column")

-- Use physical top-row keycodes for workspace binds. Avoid printable-key parser/layout mismatch.
bind(core.mainMod .. " + code:10", hl.dsp.focus({ workspace = 1 }), "Focus workspace 1")
bind(core.mainMod .. " + code:11", hl.dsp.focus({ workspace = 2 }), "Focus workspace 2")
bind(core.mainMod .. " + code:12", hl.dsp.focus({ workspace = 3 }), "Focus workspace 3")
bind(core.mainMod .. " + code:13", hl.dsp.focus({ workspace = 4 }), "Focus workspace 4")
bind(core.mainMod .. " + code:14", hl.dsp.focus({ workspace = 5 }), "Focus workspace 5")
bind(core.mainMod .. " + code:15", hl.dsp.focus({ workspace = 6 }), "Focus workspace 6")
bind(core.mainMod .. " + code:16", hl.dsp.focus({ workspace = 7 }), "Focus workspace 7")
bind(core.mainMod .. " + code:17", hl.dsp.focus({ workspace = 8 }), "Focus workspace 8")
bind(core.mainMod .. " + code:18", hl.dsp.focus({ workspace = 9 }), "Focus workspace 9")
bind(core.mainMod .. " + code:19", hl.dsp.focus({ workspace = 10 }), "Focus workspace 10")

bind(core.mainMod .. " + SHIFT + code:10", hl.dsp.window.move({ workspace = 1 }), "Move window to workspace 1")
bind(core.mainMod .. " + SHIFT + code:11", hl.dsp.window.move({ workspace = 2 }), "Move window to workspace 2")
bind(core.mainMod .. " + SHIFT + code:12", hl.dsp.window.move({ workspace = 3 }), "Move window to workspace 3")
bind(core.mainMod .. " + SHIFT + code:13", hl.dsp.window.move({ workspace = 4 }), "Move window to workspace 4")
bind(core.mainMod .. " + SHIFT + code:14", hl.dsp.window.move({ workspace = 5 }), "Move window to workspace 5")
bind(core.mainMod .. " + SHIFT + code:15", hl.dsp.window.move({ workspace = 6 }), "Move window to workspace 6")
bind(core.mainMod .. " + SHIFT + code:16", hl.dsp.window.move({ workspace = 7 }), "Move window to workspace 7")
bind(core.mainMod .. " + SHIFT + code:17", hl.dsp.window.move({ workspace = 8 }), "Move window to workspace 8")
bind(core.mainMod .. " + SHIFT + code:18", hl.dsp.window.move({ workspace = 9 }), "Move window to workspace 9")
bind(core.mainMod .. " + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }), "Move window to workspace 10")

bind(core.mainMod .. " + M", hl.dsp.focus({ workspace = "name:M" }), "Focus messages workspace")
bind(core.mainMod .. " + N", hl.dsp.focus({ workspace = "name:N" }), "Focus notes workspace")
bind(core.mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "name:M" }), "Move window to messages workspace")
bind(core.mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "name:N" }), "Move window to notes workspace")

bind(core.mainMod .. " + grave", hl.dsp.workspace.toggle_special("magic"), "Toggle scratchpad workspace")
bind(core.mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:magic" }), "Move window to scratchpad")

bind(core.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), "Focus next workspace")
bind(core.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), "Focus previous workspace")

bind(core.mainMod .. " + mouse:272", hl.dsp.window.drag(), "Drag focused window", { mouse = true })
bind(core.mainMod .. " + mouse:273", hl.dsp.window.resize(), "Resize focused window", { mouse = true })

bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), "Raise volume", { locked = true, repeating = true })
bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), "Lower volume", { locked = true, repeating = true })
bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), "Toggle audio mute", { locked = true, repeating = true })
bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), "Toggle microphone mute", { locked = true, repeating = true })
bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), "Raise brightness", { locked = true, repeating = true })
bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), "Lower brightness", { locked = true, repeating = true })

bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), "Next media track", { locked = true })
bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), "Pause or resume media", { locked = true })
bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), "Play or pause media", { locked = true })
bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), "Previous media track", { locked = true })

bind("CTRL + SUPER + mouse:274", core.keyword("cursor:zoom_factor 3.0"), "Zoom cursor in", { mouse = true })
bind("CTRL + SUPER + mouse:274", core.keyword("cursor:zoom_factor 1.0"), "Reset cursor zoom", { mouse = true, release = true })
