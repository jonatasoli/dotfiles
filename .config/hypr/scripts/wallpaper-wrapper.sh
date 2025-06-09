#!/bin/bash
# Método direto para hyprpaper recente
hyprpaper &
sleep 2  # Espera inicialização

WALLPAPER=$(find ~/wallpapers -type f | shuf -n 1)
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER"
