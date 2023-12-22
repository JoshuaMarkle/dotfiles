# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# General
export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

# Terminal
export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/ohmyzsh"
export TEXMFVAR="/var/lib/texmf"

# Tools
export ANDROID_HOME=$HOME/tools/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/bin/java

# Disable history
export HISTSIZE=0
export HISTFILESIZE=0
export PYTHONSTARTUP=/dev/null

# Add custom aliases
source ~/.config/zsh/aliases

# Keybinds
bindkey -s ^f "~/.local/bin/project_switcher.sh/n"

# Superuser stuff (type faster)
xset r rate 220 30

### Load plugins ###
source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source /home/josh/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
