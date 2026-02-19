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
    yay -Y --gendb
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
# CORE
#

do_core() {
    local packages=(
        linux-headers
        thermald
        iwd
        gawk
        alacritty
        bash-completion
        bat
        bat-extras
        clang
        openssh
        firefox
        btop
        dropbox
        dropbox-cli
        duf
        dust
        eza
        fd
        fzf
        skim
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
        ripgrep-all
        rustup
        sd
        stow
        choose
        watchexec
        trash-cli
        vim
        mpv
        mpv-mpris
        vulkan-intel
        vulkan-tools
        vulkan-icd-loader
        vulkan-mesa-implicit-layers
        wireplumber
        wl-clipboard
        xdg-utils
        yq
        wget
        xorg-xhost
        mtools
        libinput
        libinput-tools
        wev
        # ::: wifi
        nftables
        wireless-regdb
        dnsmasq
        haveged
        ufw
        ufw-extras
        linux-wifi-hotspot-bin
    )
    yay -S --needed "${packages[@]}"

    rustup default stable
    npm config set prefix "$HOME/.npm-global"
    sudo systemctl enable --now thermald
    sudo systemctl enable --now haveged
    sudo ufw enable
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
# HYPR
#

do_hypr() {
    local packages=(
        cmake
        brightnessctl
        cliphist
        dbus-broker
        dunst
        fuzzel
        hypridle
        hyprland
        hyprland-guiutils
        hyprland-qt-support
        hyprcursor
        hyprlock
        hyprpicker
        hyprpolkitagent
        hyprshade
        hyprshot
        imagemagick
        kitty
        playerctl
        qt5-wayland
        qt6-wayland
        woff2-font-awesome
        udiskie
        waybar
        wf-recorder
        wl-clip-persist
        wl-clipboard
        wtype
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser-hunkyburrito-git
        xdg-terminal-exec
        smartmontools
    )

    yay -S --needed "${packages[@]}"

    sudo systemctl enable --now dbus-broker.service
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
# EXTRA
#

do_extra() {
    local packages=(
        scrcpy
        libappindicator
        pandoc-bin
        tealdeer
        fastfetch
        aichat
        systemctl-tui
        font-manager
        rqbit
        # TODO: impression alt
        serie
        signal-desktop
        snapshot
        earlyoom
        typst
        openvpn
        wlctl-bin
        bluetui
        wiremix
        lazygit
        bibata-cursor-theme-bin
        # ::: disk management
        gparted
        dosfstools
        mtools
        exfatprogs
        ntfs-3g
        gpart
        btrfs-progs
        f2fs-tools
    )
    yay -S --needed "${packages[@]}"

    sudo systemctl enable --now earlyoom
    sudo sysctl -w vm.dirty_background_bytes=16777216
    sudo sysctl -w vm.dirty_bytes=48234496
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
