---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "kitty -e yazi"
local menu        = "caelestia shell drawers toggle launcher"


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Core Applications & Terminal
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))

-- Open app launcher menu when Super (Windows key) is tapped and released
hl.bind("SUPER + Super_L", hl.dsp.exec_cmd(menu), { release = true })

----------------------------------
---- CAELESTIA SHELL & DRAWERS ----
----------------------------------
hl.bind(mainMod .. " + Z",         hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))
hl.bind(mainMod .. " + D",         hl.dsp.exec_cmd("caelestia shell drawers toggle dashboard"))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd("caelestia shell drawers toggle sidebar"))
hl.bind(mainMod .. " + U",         hl.dsp.exec_cmd("caelestia shell drawers toggle utilities"))
hl.bind(mainMod .. " + L",         hl.dsp.exec_cmd("caelestia shell lock lock"))
hl.bind(mainMod .. " + N",         hl.dsp.exec_cmd("caelestia shell notifs toggleDnd"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("caelestia shell notifs clear"))

-----------------------------------
---- CAELESTIA UTILITIES & THEME ----
-----------------------------------
hl.bind(mainMod .. " + ALT + C",   hl.dsp.exec_cmd("caelestia shell picker open"))
hl.bind(mainMod .. " + W",         hl.dsp.exec_cmd("caelestia wallpaper -f"))

-- Screenshots & Recording
hl.bind("Print",                   hl.dsp.exec_cmd("caelestia screenshot full"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("caelestia screenshot region"))
hl.bind("CTRL + ALT + R",          hl.dsp.exec_cmd("caelestia record toggle"))

---------------------------------
---- WINDOW MANAGEMENT & FOCUS ----
---------------------------------
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",         hl.dsp.layout("togglesplit"))    -- dwindle layout split
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pin({ action = "toggle" }))

-- Focus Navigation (SUPER + Arrow Keys)
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move Window Position (SUPER + SHIFT + Arrow Keys)
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

----------------------------------
---- WORKSPACES & SCRATCHPADS ----
----------------------------------

-- Switch workspaces [1-10] / Move active window to workspace [1-10]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Caelestia Magic Workspace (Scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + ALT + S",   hl.dsp.window.move({ workspace = "special:magic" }))

-- Alternative Scratchpad Controls (Minimize/Restore feel)
hl.bind("CTRL + ALT + down",       hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("CTRL + ALT + up",         hl.dsp.workspace.toggle_special("magic"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------------------
---- HARDWARE & MEDIA KEYS ----
--------------------------------

-- Volume & Brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media Control (playerctl)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-------------------------
---- AUTOSTART HOOKS ----
-------------------------

-- Start cliphist daemons on startup
hl.on("hyprland.start", function ()
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)


-------------------------
----- MOUSE TRIGGER -----
-------------------------

