#!/bin/bash

packages=(
    7zip
    fd
    ffmpeg
    fzf
    imagemagick
    jq
    poppler
    resvg
    ripgrep
    yazi
    zoxide
    ueberzugpp
    gvfs
    glib2
    gvfs-mtp
    gvfs-afc
    gvfs-google
    gvfs-gphoto2
)

yay -S --needed "${packages[@]}"

ya pkg add yazi-rs/plugins:chmod
ya pkg add yazi-rs/plugins:git
ya pkg add yazi-rs/plugins:mount
ya pkg add yazi-rs/plugins:toggle-pane
ya pkg add yazi-rs/plugins:vcs-files
ya pkg add boydaihungst/gvfs
ya pkg add KKV9/compress
