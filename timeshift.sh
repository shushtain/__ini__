#!/bin/bash

packages=(
    timeshift
    timeshift-systemd-timer
)

yay -S --needed "${packages[@]}"

sudo systemctl enable timeshift-boot.timer
sudo systemctl enable timeshift-hourly.timer
