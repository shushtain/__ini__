#!/usr/bin/env bash
set -e

report() { echo "==> $1..."; }

report "Updating packages"
sudo pacman -Syu --noconfirm

report "Bootstrapping"
pkgs=(
    git
    base-devel
    just
)
sudo pacman -S --needed --noconfirm "${pkgs[@]}"

if ! command -v yay &>/dev/null; then
    report "Installing yay"
    git clone https://aur.archlinux.org/yay.git
    (
        cd yay
        makepkg -si --noconfirm
    )
    rm -rf yay
    yay -Y --gendb
fi
