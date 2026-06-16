local M = {}

M.terminal = "kitty"
M.fileManager = "nautilus -w"
M.browser = "helium-browser"
M.menu = "vicinae toggle"
M.clipboard = "qs -c noctalia-shell ipc call launcher clipboard"
M.powerMenu = "qs -c noctalia-shell ipc call sessionMenu toggle"
M.lockScreen = "qs -c noctalia-shell ipc call lockScreen lock"
M.mainMod = "SUPER"

function M.dispatch(cmd)
    return function()
        hl.exec_cmd("hyprctl dispatch " .. cmd)
    end
end

function M.keyword(cmd)
    return function()
        hl.exec_cmd("hyprctl keyword " .. cmd)
    end
end

hl.on("hyprland.start", function()
    hl.exec_cmd("vicinae server")
    hl.exec_cmd("QS_ICON_THEME=Adwaita qs -c noctalia-shell")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

return M
