#!/bin/bash

#
# PREP
#

sudo pacman -Syu

#
# YAY
#

do_yay() {
    sudo pacman -S --needed git base-devel &&
        git clone https://aur.archlinux.org/yay.git &&
        cd yay && makepkg -si &&
        cd .. && rm -rf yay
}

while true; do
    read -r -p "Install yay? (y/n) " answer
    case $answer in
    [Yy]*)
        do_yay
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# FONTS
#

do_fonts() {
    local packages=(
        adwaita-fonts
        inter-font
        ttf-jetbrains-mono
        noto-fonts
        noto-fonts-emoji
    )
    yay -S --needed "${packages[@]}"
}

while true; do
    read -r -p "Install font packages? (y/n) " answer
    case $answer in
    [Yy]*)
        do_fonts
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# HYPR
#

do_hypr() {
    local packages=(
        cmake
        app2unit
        brightnessctl
        bzmenu
        cliphist
        dbus-broker
        dunst
        fuzzel
        gnome-keyring
        hypridle
        hyprland
        hyprlock
        hyprpicker
        hyprpolkitagent
        hyprshade
        hyprshot
        imagemagick
        iwmenu
        kitty
        playerctl
        qt5-wayland
        qt6-wayland
        rofimoji
        woff2-font-awesome
        udiskie
        waybar
        wf-recorder
        wl-clip-persist
        wl-clipboard
        wtype
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser-hunkyburrito-git
        xdg-terminal-exec
        smartmontools
    )

    yay -S --needed "${packages[@]}"

    sudo systemctl enable dbus-broker.service
}

while true; do
    read -r -p "Install Hyprland packages? (y/n) " answer
    case $answer in
    [Yy]*)
        do_hypr
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# CORE
#

do_core() {
    local packages=(
        bc
        iwd
        alacritty
        bash-completion
        bat
        bat-extras
        clang
        openssh
        brave-bin
        btop
        dropbox
        dropbox-cli
        duf
        dust
        eza
        fd
        fzf
        git-cliff
        github-cli
        git-delta
        intel-media-driver
        jq
        less
        libcamera
        libva-utils
        libvdpau-va-gl
        luarocks
        man-db
        mesa
        nano
        npm
        pacman-contrib
        pavucontrol
        pipewire
        pipewire-alsa
        pipewire-pulse
        power-profiles-daemon
        python
        python-pip
        repgrep
        ripgrep
        rustup
        sd
        stow
        choose
        inotify-tools
        trash-cli
        vim
        vulkan-intel
        wireplumber
        wl-clipboard
        xdg-utils
        yq
        wget
        wpa_supplicant
    )
    yay -S --needed "${packages[@]}"

    rustup default stable
}

while true; do
    read -r -p "Install core packages? (y/n) " answer
    case $answer in
    [Yy]*)
        do_core
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# EXTRA
#

do_extra() {
    local packages=(
        libappindicator-gtk3
        ripgrep-all
        pandoc-cli
        tealdeer
        fastfetch
        aichat
        celluloid
        systemctl-tui
        diskonaut
        font-manager
        fragments
        gparted
        impression
        serie
        signal-desktop
        snapshot
    )
    yay -S --needed "${packages[@]}"
}

while true; do
    read -r -p "Install extra packages? (y/n) " answer
    case $answer in
    [Yy]*)
        do_extra
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done

#
# NVIM
#

do_nvim() {
    local packages=(
        neovim
        cmake
        npm
        tree-sitter
        tree-sitter-cli
        wl-clipboard
        luajit
        git
    )

    yay -S --needed "${packages[@]}"

    npm config set prefix "$HOME/.npm-global"

    npm install -g neovim
    npm install -g live-server
}

while true; do
    read -r -p "Install Neovim packages? (y/n) " answer
    case $answer in
    [Yy]*)
        do_nvim
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done
