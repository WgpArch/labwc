# 📊 Waybar & Scripts

This setup uses a custom Waybar positioned at the bottom, featuring grouped "drawer" modules that expand on hover to save space.

## 📐 Bar Layout

### Left
- **Custom Arch Launcher:** Opens Rofi (custom config.rasi).
- **WLR Workspaces:** Displays 11 workspaces with Nerd Font icons (Terminal, Browser, Files, Code, Games, Chat, Video, Music, Headphones, Users, Settings).
- **WLR Taskbar:** Shows currently open windows. Left-click to minimize, middle-click to close, right-click to maximize.

### Center
- **Clock:** Date, time, and calendar tooltip.
- **Custom Weather:** Fetches weather data via a custom Ruby script (`get_weather.rb`).

### Right
- **Tray, CPU, Memory, Temperature:** Standard system monitors.
- **Custom Notification:** SwayNC integration.
- **Pulseaudio:** Volume control.
- **Backlight:** Brightness percentage. **Click to switch Waybar themes!** (`switch_themes.sh`)
- **Network:** WiFi signal strength and IP info.
- **Battery Drawer:** Hover to reveal Power Profiles Daemon toggle.
- **Logout Drawer:** Hover to reveal Power, Lock, Reboot, Logout, and Sleep buttons.

## 📜 Key Scripts

Located in `~/.config/labwc/scripts/`:

| Script | Description |
| :--- | :--- |
| `screenshot_labwc.sh` | Screenshot utility. |
| `logout.sh` | Cleanly exits the Labwc session. |

Located in `~/.config/labwc/waybar/scripts/`:

| Script | Description |
| :--- | :--- |
| `switch_themes.sh` | Toggles Waybar CSS themes on the fly. |
| `get_weather.sh` / `weather.py` | Weather data fetchers. |
