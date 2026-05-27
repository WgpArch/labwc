# 🛠️ Installation

This configuration uses standard Labwc XDG base directories and a custom Waybar launched via the autostart script.

## Prerequisites

**Core:**
- `labwc`
- `waybar`
- `rofi`
- `swaybg` (Wallpaper setter)
- `swaync` (Notification center)

**Utilities:**
- `lxterminal` (Default terminal)
- `brightnessctl` (Backlight)
- `amixer` / `alsa-utils` (Volume control)

## Deploying the Config

1. Clone the repository:
        
        git clone https://codeberg.org/WgpArch/labwc.git ~/.dotfiles/labwc

2. Symlink the Labwc configuration:
        
        ln -sf ~/.dotfiles/labwc/configs/labwc ~/.config/labwc

3. Ensure scripts are executable:
        
        chmod +x ~/.config/labwc/scripts/*
        chmod +x ~/.config/labwc/waybar/scripts/*
