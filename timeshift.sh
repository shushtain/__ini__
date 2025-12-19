#!/bin/bash

packages=(
    timeshift
    timeshift-systemd-timer
)

yay -S --needed "${packages[@]}"

sudo systemctl enable --now timeshift-boot.timer
sudo systemctl enable --now timeshift-hourly.timer
