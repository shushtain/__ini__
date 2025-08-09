#!/bin/bash

packages=(
    amberol
    dconf-editor
    extension-manager
    gnome-power-manager
    gnome-tweaks
    nautilus-dropbox
)

yay -S --needed "${packages[@]}"
