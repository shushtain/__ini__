#!/bin/bash

packages=(
    7zip
    fd
    ffmpeg
    fzf
    imagemagick
    jg
    poppler
    resvg
    ripgrep
    yazi
    zoxide
    ueberzugpp
)

yay -S --needed "${packages[@]}"

ya pkg add yazi-rs/plugins:piper
