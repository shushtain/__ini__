#!/bin/bash

#
# BASH
#

do_bash() {
    local packages=(
        bash-language-server
        shellcheck-bin
        shfmt
    )
    yay -S --needed "${packages[@]}"
}

while true; do
    read -r -p "Bash? (y/n) " answer
    case $answer in
    [Yy]*)
        do_bash
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# LUA
#

do_lua() {
    local packages=(
        emmylua-ls-bin
        lua-language-server
        luajit
        luarocks
        stylua
    )
    yay -S --needed "${packages[@]}"
}

while true; do
    read -r -p "Lua? (y/n) " answer
    case $answer in
    [Yy]*)
        do_lua
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# RUST
#

do_rust() {
    local packages=(
        rustup
        rust-analyzer
    )
    yay -S --needed "${packages[@]}"

    rustup default stable

    # crates=(
    #     # cargo-bloat
    #     # cargo-edit
    #     # cargo-outdated
    #     # cargo-audit
    #     # cargo-license
    #     # cargo-msrv
    # )
    #
    # cargo install "${crates[@]}"
}

while true; do
    read -r -p "Rust? (y/n) " answer
    case $answer in
    [Yy]*)
        do_rust
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# PYTHON
#

do_python() {
    local packages=(
        python
        python-pip
        ruff
        ty
        uv
    )
    yay -S --needed "${packages[@]}"
}

while true; do
    read -r -p "Python? (y/n) " answer
    case $answer in
    [Yy]*)
        do_python
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# DATA
#

do_data() {
    local packages=(
        markdownlint-cli
        marksman
        prettier
        tombi
        vscode-json-languageserver
        yaml-language-server
        yamllint
    )
    yay -S --needed "${packages[@]}"
}

while true; do
    read -r -p "Data? (y/n) " answer
    case $answer in
    [Yy]*)
        do_data
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# WEB
#

do_web() {
    local packages=(
        emmet-language-server
        htmlhint
        prettier
        typescript-language-server
        vscode-css-languageserver
        vscode-html-languageserver
    )
    yay -S --needed "${packages[@]}"
}

while true; do
    read -r -p "Web? (y/n) " answer
    case $answer in
    [Yy]*)
        do_web
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# MISC
#

do_misc() {
    local packages=(
        glsl_analyzer
        prettier
        typos
        typos-lsp
        harper
        ts_query_ls-bin
        hyprls-git
        systemd-lsp
        vim-language-server
        tinymist
        just-lsp
    )
    yay -S --needed "${packages[@]}"

    cargo install ebnfer
}

while true; do
    read -r -p "Misc? (y/n) " answer
    case $answer in
    [Yy]*)
        do_misc
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done
