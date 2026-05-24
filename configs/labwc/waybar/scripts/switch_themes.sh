#!/usr/bin/env bash

cd ~/.config/labwc/waybar/scripts

mv style.css tmp
mv style_2.css style.css
mv tmp style_2.css

killall waybar
waybar &
