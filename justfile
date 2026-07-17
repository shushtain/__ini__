default:
    @just --list

[private]
install pkgs:
    yay -S --needed {{ replace(pkgs, "\n", " ") }}

# ::: CORE

fonts:
    @just install "{{ '''
    noto-fonts
    noto-fonts-emoji
    ttf-jetbrains-mono
    adwaita-fonts
    inter-font
    ''' }}"

neovim:
    @just install "{{ '''
    neovim
    vim-language-server
    ''' }}"

hypr:
    @just install "{{ '''
    hyprcursor
    hypridle
    hyprland
    wev
    hyprland-guiutils
    hyprland-qt-support
    hyprlock
    hyprls-git
    hyprpicker
    hyprpolkitagent
    hyprshade
    hyprshot
    wf-recorder
    ''' }}"

terminals:
    @just install "{{ '''
    alacritty
    ''' }}"

helpers:
    @just install "{{ '''
    bluetui
    btop
    dunst
    fastfetch
    fuzzel
    man-db
    scrcpy
    stow
    tealdeer
    wlctl-bin
    ''' }}"

git:
    @just install "{{ '''
    git
    serie
    git-cliff
    git-delta
    github-cli
    ''' }}"

browsers:
    @just install "{{ '''
    firefox
    chromium
    ''' }}"

communication:
    @just install "{{ '''
    signal-desktop
    telegram-desktop
    ''' }}"

mpv:
    @just install "{{ '''
    mpv
    mpv-mpris
    yt-dlp
    ''' }}"

yazi:
    @just install "{{ '''
    7zip
    yazi
    ''' }}"

trash:
    @just install "{{ '''
    trash-cli
    ''' }}"

sync:
    @just install "{{ '''
    dropbox
    dropbox-cli
    python-gpgme
    rclone
    ''' }}"

tree-sitter:
    @just install "{{ '''
    tree-sitter
    tree-sitter-cli
    ts_query_ls-bin
    ''' }}"

bash:
    @just install "{{ '''
    bash-language-server
    shellcheck-bin
    shfmt
    ''' }}"

rust:
    @just install "{{ '''
    rustup
    rust-analyzer
    ''' }}"

python:
    @just install "{{ '''
    python
    python-pip
    uv
    ruff
    ty
    ''' }}"

markdown:
    @just install "{{ '''
    markdownlint-cli
    marksman
    ''' }}"

toml:
    @just install "{{ '''
    tombi
    ''' }}"

webdev:
    @just install "{{ '''
    htmlhint
    prettier
    typescript-language-server
    vscode-css-languageserver
    vscode-html-languageserver
    vscode-json-languageserver
    emmet-language-server
    ''' }}"

yaml:
    @just install "{{ '''
    yaml-language-server
    yamllint
    ''' }}"

typst:
    @just install "{{ '''
    typst
    tinymist
    ''' }}"

justfile:
    @just install "{{ '''
    just
    just-lsp
    ''' }}"

nix:
    @just install "{{ '''
    nix
    nixfmt
    ''' }}"

lua:
    @just install "{{ '''
    lua51
    luajit
    emmylua-ls-bin
    lua-language-server
    stylua
    luarocks
    ''' }}"

systemd:
    @just install "{{ '''
    systemctl-tui
    systemd-lsp
    ''' }}"

glsl:
    @just install "{{ '''
    glsl_analyzer-bin
    ''' }}"

spelling:
    @just install "{{ '''
    harper
    hunspell
    hunspell-en_us
    typos
    typos-lsp
    ''' }}"

#
# # ::: EXTRA
# # ::: IDE
