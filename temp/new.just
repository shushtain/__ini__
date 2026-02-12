# TODO:
# - networking: focus on NM
# - keep multilib enabled by default
# - move from gparted? fdisk?
# - make a script of core tools for ventoy
# - rtkit
# - throttled
# - auto-cpufreq
# - smartd
# - keyd
# - console setup?
# - label partitions, swap, (home?)
# - user groups? networkmanager video
# - qt config
# - trash-cli -> rip?
# - link Dropbox to box by default
# - secrets management (age?)
# - waybar alt? tray?
# - dd for impression

default:
    @just --list

[private]
install pkgs:
    yay -S --needed {{ pkgs }}

dep: fonts

[group("special")]
fonts:
    just install """
    adwaita-fonts
    inter-font
    ttf-jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    woff2-font-awesome
    """

core: system toolchains coreutils coreware xdg fs nvim

[group("core")]
system: dep
    just install """
    linux-headers
    intel-media-driver
    pacman-contrib
    thermald
    mesa
    pipewire
    pipewire-alsa
    pipewire-pulse
    power-profiles-daemon
    brightnessctl
    wireplumber
    vulkan-intel
    vulkan-tools
    vulkan-icd-loader
    vulkan-mesa-implicit-layers
    dbus-broker
    playerctl
    """
    sudo systemctl enable --now thermald
    sudo systemctl enable --now dbus-broker.service

[group("core")]
toolchains: dep
    just install """
    python
    python-pip
    rustup
    npm
    luarocks
    cmake
    """
    rustup default stable
    npm config set prefix "$HOME/.npm-global"

[group("core")]
coreutils: dep
    just install """
    iwd
    dunst
    gawk
    bash-completion
    bat
    bat-extras
    clang
    openssh
    duf
    dust
    eza
    fd
    udiskie
    fzf
    skim
    git-cliff
    git-delta
    jq
    less
    libcamera
    libva-utils
    libvdpau-va-gl
    man-db
    nano
    pavucontrol
    repgrep
    ripgrep
    ripgrep-all
    sd
    stow
    choose
    watchexec
    trash-cli
    wl-clipboard
    yq
    wf-recorder
    wl-clip-persist
    earlyoom
    smartmontools
    wl-clipboard
    wtype
    wget
    xorg-xhost
    mtools
    libinput
    cliphist
    imagemagick
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
    sudo systemctl enable --now earlyoom
    sudo systemctl enable --now haveged
    sudo ufw enable

[group("core")]
coreware: dep
    just install """
    alacritty
    firefox
    btop
    dropbox
    dropbox-cli
    github-cli
    vim
    mpv
    mpv-mpris
    fuzzel
    """

[group("core")]
nvim: dep toolchains
    just install """
    neovim
    cmake
    npm
    tree-sitter
    tree-sitter-cli
    wl-clipboard
    luajit
    lua51
    git
    """
    npm install -g live-server

[group("core")]
nix: dep
    just install """
    nix
    """
    sudo nix-store --init
    sudo systemctl enable --now nix-daemon.service
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
    nix-channel --update

[group("core")]
xdg: dep
    just install """
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-termfilechooser-hunkyburrito-git
    xdg-terminal-exec
    """

[group("core")]
fs: dep
    just install """
    dosfstools
    mtools
    exfatprogs
    ntfs-3g
    gpart
    btrfs-progs
    f2fs-tools
    """
    sudo sysctl -w vm.dirty_background_bytes=16777216
    sudo sysctl -w vm.dirty_bytes=48234496

display: gui hyprland

[group("display")]
gui: dep
    just install """
    bibata-cursor-theme-bin
    libappindicator
    qt5-wayland
    qt6-wayland
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

[group("display")]
hyprland: dep gui xdg
    just install """
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
    kitty
    waybar
    """

extra: extrautils extraware

[group("extra")]
extrautils: dep
    just install """
    ventoy-bin
    scrcpy
    aichat
    systemctl-tui
    pandoc-bin
    tealdeer
    fastfetch
    diskonaut
    rqbit
    openvpn
    serie
    wlctl-bin
    bluetui
    wiremix
    lazygit
    viu
    typst
    """

[group("extra")]
extraware: dep
    just install """
    font-manager
    signal-desktop
    snapshot
    gparted
    """

[group("extra")]
yazi: dep
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

[group("special")]
ide: dep
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
    nixfmt
    """
    rustup default stable
    cargo install ebnfer
    cargo install --git https://github.com/oxalica/nil nil
