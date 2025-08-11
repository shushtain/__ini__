#!/bin/bash

packages=(
    gtk4
    gtk3
    gtk2
)

yay -S --needed "${packages[@]}"

printf "\nSetting variables"
gsettings set org.gnome.desktop.interface gtk-theme Adwaita || echo "[gtk-theme Adwaita] can't be set"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark || echo "[color-scheme prefer-dark] can't be set"
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice || echo "[cursor-theme Bibata-Modern-Ice] can't be set"
gsettings set org.gnome.desktop.interface cursor-size 24 || echo "[cursor-size 24] can't be set"
gsettings set org.gnome.desktop.interface cursor-blink false || echo "[cursor-blink false] can't be set"
gsettings set org.gnome.desktop.interface enable-animations false || echo "[enable-animations false] can't be set"
gsettings set org.gnome.desktop.interface clock-format 24h || echo "[clock-format 24h] can't be set"
printf "DONE"
