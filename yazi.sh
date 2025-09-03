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

# ya pkg add yazi-rs/plugins:piper
ya pkg add yazi-rs/plugins:chmod
ya pkg add yazi-rs/plugins:git
ya pkg add yazi-rs/plugins:mount
ya pkg add yazi-rs/plugins:toggle-pane
ya pkg add yazi-rs/plugins:vcs-files

ya pkg add KKV9/compress
