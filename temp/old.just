set quiet := true

default:
    just --list

[private]
install pkgs:
    yay -S --needed --noconfirm {{ pkgs }}

all: fonts core hyprland extra gtk ide nvim yazi

[group("main")]
fonts:
    just install """
    adwaita-fonts
    inter-font
    ttf-jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    """

[group("main")]
core: fonts
    just install """
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
    wpa_supplicant
    xorg-xhost
    mtools
    libinput
    libinput-tools
    wev
    nftables
    wireless-regdb
    dnsmasq
    haveged
    ufw
    ufw-extras
    linux-wifi-hotspot-bin
    """
    rustup default stable
    npm config set prefix "$HOME/.npm-global"
    sudo systemctl enable --now thermald
    sudo systemctl enable --now haveged
    sudo ufw enable

[group("main")]
hyprland: core
    just install """
    bibata-cursor-theme-bin
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
    """
    sudo systemctl enable --now dbus-broker.service

# TODO: impression alt
[group("extra")]
extra: core
    just install """
    scrcpy
    libappindicator
    pandoc-bin
    tealdeer
    fastfetch
    aichat
    systemctl-tui
    diskonaut
    font-manager
    rqbit
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
    gparted
    dosfstools
    mtools
    exfatprogs
    ntfs-3g
    gpart
    btrfs-progs
    f2fs-tools
    """
    sudo systemctl enable --now earlyoom
    sudo sysctl -w vm.dirty_background_bytes=16777216
    sudo sysctl -w vm.dirty_bytes=48234496

[group("extra")]
nvim: core
    just install """
    neovim
    cmake
    npm
    tree-sitter
    tree-sitter-cli
    wl-clipboard
    luajit
    git
    """
    npm install -g live-server

[group("extra")]
gtk: hyprland
    just install """
    gtk4
    gtk3
    """
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice
    gsettings set org.gnome.desktop.interface cursor-size 24
    gsettings set org.gnome.desktop.interface cursor-blink false
    gsettings set org.gnome.desktop.interface enable-animations false
    gsettings set org.gnome.desktop.interface clock-format 24h

[group("extra")]
ide: core
    just install """
    bash-language-server
    shellcheck-bin
    shfmt
    emmylua-ls-bin
    lua-language-server
    luajit
    luarocks
    stylua
    rustup
    rust-analyzer
    python
    python-pip
    ruff
    ty
    uv
    markdownlint-cli
    marksman
    prettier
    tombi
    vscode-json-languageserver
    yaml-language-server
    yamllint
    emmet-language-server
    htmlhint
    prettier
    typescript-language-server
    vscode-css-languageserver
    vscode-html-languageserver
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
    """
    rustup default stable
    cargo install ebnfer

[group("extra")]
yazi:
    just install """
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
    """
    ya pkg add yazi-rs/plugins:chmod
    ya pkg add yazi-rs/plugins:git
    ya pkg add yazi-rs/plugins:mount
    ya pkg add yazi-rs/plugins:toggle-pane
    ya pkg add yazi-rs/plugins:vcs-files
    ya pkg add boydaihungst/gvfs
    ya pkg add KKV9/compress
