# Default apps
export TERM=xterm-256color
export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim
export READER=zathura
export BROWSER=firefox

# XDG paths
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

# QT5 fix
export QT_QPA_PLATFORMTHEME=qt5ct

# Wayland fix
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_SESSION_TYPE=wayland
export GDK_BACKEND=wayland,x11
export MOZ_ENABLE_WAYLAND=1

# Flutter
export ANDROID_HOME=$HOME/tools/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Fixing paths
export JAVA_HOME=/usr/bin/java
export GOPATH=$XDG_DATA_HOME/go
export CARGO_HOME=$XDG_DATA_HOME/cargo
export NPM_CONFIG_HOME=$XDG_CONFIG_HOME/npm/npmrc
export GTK2_RC_FILES=$XDG_DATA_HOME/gtk-2.0/gtkrc
export ZDOTDIR=$HOME/.config/zsh

# History
export HISTSIZE=0
export HISTFILESIZE=0
export PYTHONSTARTUP=/dev/null

# Scaling
# export QT_AUTO_SCREEN_SCALE_FACTOR=0
# export QT_SCALE_FACTOR=1
# export QT_SCREEN_SCALE_FACTORS="1;1;1"
# export GDK_SCALE=1
# export GDK_DPI_SCALE=1

# Misc
export TEXMFVAR="/var/lib/texmf"
export FZF_DEFAULT_OPTS="--height=100% --info=inline --border --margin=1 --padding=1 --color=bg+:#1a1b26,bg:#1a1b26,border:#a9b1d6,spinner:#1abc9c,hl:#ff007c,fg:#c0caf5,header:#ffffff,info:#1abc9c,pointer:#f7768e,marker:#db4b4b,fg+:#a9b1d6,preview-bg:#1a1b26,prompt:#7aa2f7,hl+:#1abc9c"
