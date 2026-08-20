-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "12")
hl.env("HYPRCURSOR_SIZE", "12")


-- -- Hyprland Environment Variables 
-- hl.env("HYPRLAND_TRACE", "1")
-- hl.env("HYPRLAND_NO_RT", "1")
-- hl.env("HYPRLAND_NO_SD_NOTIFY", "1")
-- hl.env("HYPRLAND_NO_SD_VARS", "1")
-- hl.env("HYPRLAND_CONFIG", "/home/aaradhya/.config/hypr/hyprland.lua")

-- -- Aquamarine Environment Variables 
-- hl.env("AQ_TRACE", "1")
-- hl.env("AQ_DRM_DEVICES", "...")
-- hl.env("AQ_FORCE_LINEAR_BLIT", "0")
-- hl.env("AQ_MGPU_NO_EXPLICIT", "1")
-- hl.env("AQ_NO_MODIFIERS", "1")
-- hl.env("AQ_NO_KMS_REQUIREMENT", "1")

-- Toolkit Backend Variables
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

--Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- NVIDIA Specific 
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env = {"WLR_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"}