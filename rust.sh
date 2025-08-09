#!/bin/bash

packages=(
    rustup
)

yay -S --needed "${packages[@]}"

rustup default stable

crates=(
    # cargo-bloat
    # cargo-edit
    # cargo-outdated
    # cargo-audit
    # cargo-license
    # cargo-msrv
)

cargo install "${crates[@]}"
