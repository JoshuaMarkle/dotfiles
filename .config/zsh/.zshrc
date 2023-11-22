# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/ohmyzsh"
export TEXMFVAR="/var/lib/texmf"

# Flutter Support
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/bin/java

# PROMPT="%B%F{red}%n@%m: %B%F{blue}%~%b %F{foreground}❱ "
ZSH_THEME="powerlevel10k/powerlevel10k"

# Add custom aliases
source ~/.config/zsh/aliases

# Superuser stuff (type faster)
xset r rate 220 30

# Load plugins
source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source /home/josh/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
