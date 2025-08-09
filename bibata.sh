#!/bin/bash

packages=(
    # bibata-cursor-theme-bin
    bibata-cursor-git
)

yay -S --needed "${packages[@]}"
