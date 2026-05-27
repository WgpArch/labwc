# 🎨 Look & Feel

This Labwc config embraces a classic, familiar desktop aesthetic, styled closely after traditional Openbox.

## General Appearance
- **Decoration:** Server-side decorations (titlebars) enabled.
- **Theme:** Clearlooks-3.4 (Classic GTK look).
- **Corner Radius:** 8px
- **Font:** Sans, size 10.
- **Drop Shadows:** Disabled for a clean, flat look.

## Window Snapping
- **Top Maximize:** Dragging a window to the top edge will maximize it.
- **Edge Snapping:** Dragging to left/right edges snaps to 50%.
- **Resistance:** 20px resistance at screen and window edges before snapping.

## Window Switcher (Alt-Tab)
- **Style:** Classic list format.
- **Preview:** Enabled (shows window outlines).
- **Fields:** Displays the application icon, desktop entry name, and window title.

## Autostart
Applications are spawned automatically via `~/.config/labwc/autostart`:
- **Wallpaper:** `swaybg` sets a dark road wallpaper.
- **Waybar:** Launches with `config.jsonc` and `style.css`.
- **Network:** `nm-applet`
- **Notifications:** `swaync`

## Input Devices
- **Keyboard:** Repeat rate 25, delay 600.
- **Touchpad:** Tap-to-click enabled. Scroll factor 1.0.
