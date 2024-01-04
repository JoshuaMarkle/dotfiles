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
export FZF_DEFAULT_OPTS="--height=100% --info=inline --border --margin=1 --padding=1 --color=bg+:#1a1b26,bg:#1a1b26,border:#a9b1d6,spinner:#1abc9c,hl:#ff007c,fg:#c0caf5,header:#ffffff,info:#1abc9c,pointer:#f7768e,marker:#db4b4b,fg+:#a9b1d6,preview-bg:#1a1b26,prompt:#7aa2f7,hl+:#1abc9c"

# Disable history
export HISTSIZE=0
export HISTFILESIZE=0
export PYTHONSTARTUP=/dev/null

# Keybinds (make them widgets for instant execution)
project_switcher() {
    ~/.local/bin/project_switcher.sh
    zle reset-prompt  # Reset the prompt to clear current line input
}
open_nvim() {
    nvim
    zle reset-prompt  # Reset the prompt to clear current line input
}
zle -N project_switcher
zle -N open_nvim
bindkey '^f' project_switcher
bindkey '^n' open_nvim

# Add custom aliases
source ~/.config/zsh/aliases

# Superuser stuff (type faster)
xset r rate 220 30

### Load plugins ###
source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source /home/josh/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
