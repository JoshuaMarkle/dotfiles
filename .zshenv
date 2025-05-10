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

# Wayland fix
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_SESSION_TYPE=wayland
export GDK_BACKEND=wayland,x11
export MOZ_ENABLE_WAYLAND=1

# Fixing paths
# export JAVA_HOME=/usr/lib/jvm/java-22-openjdk
export GOPATH=$XDG_DATA_HOME/go
export CARGO_HOME=$XDG_DATA_HOME/cargo
# export NPM_CONFIG_HOME=$XDG_CONFIG_HOME/npm/npmrc
export GTK2_RC_FILES=$XDG_DATA_HOME/gtk-2.0/gtkrc
export ZDOTDIR=$HOME/.config/zsh
export CHROME_EXECUTABLE=/opt/google/chrome/google-chrome
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH="$HOME/.pyenv/bin:$PATH"

export PATH=$PATH:/opt/flutter/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:/opt/anaconda/bin

# History
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$ZDOTDIR/.zhistory
export PYTHONSTARTUP=/dev/null

# Scaling
# export QT_AUTO_SCREEN_SCALE_FACTOR=0
# export QT_SCALE_FACTOR=1
# export QT_SCREEN_SCALE_FACTORS="1;1;1"
# export GDK_SCALE=1
# export GDK_DPI_SCALE=1

# Misc
export TEXMFVAR="/var/lib/texmf"
export FZF_DEFAULT_OPTS="--height=100% --reverse --color=bg+:#101319,bg:#101319,border:#101319,spinner:#7cc47c,hl:#e34f4f,fg:#f4f3ee,header:#f4f3ee,info:#7cc47c,pointer:#e34f4f,marker:#de3b3b,fg+:#3a435a,preview-bg:#1a1b26,prompt:#5599e2,hl+:#7cc47c"
