#!/bin/bash

# JoshuaMarkle Dotfiles Install Script

# Update & download required packages
sudo pacman -Syu &&
sudo pacman -S --needed zsh fzf exa git stow firefox dunst waybar || exit 1
sudo pacman -S --needed wl-clipboard unzip npm || exit 1 # Neovim required packages

# Download the dotfiles & sub repos
git clone --recursive https://github.com/JoshuaMarkle/dotfiles.git || exit 1

# Backup existing configurations in .config
mkdir -p ~/.config_backup
mv ~/.config/* ~/.config_backup || true

# Setup stow links between dotfiles and system
stow -t ~ -d ~/dotfiles -v . || exit 1

# Change the default shell
chsh -s /bin/zsh

# Install yay
sudo pacman -S --needed base-devel git || exit 1
yay_installed=$(pacman -Qs yay)
if [ -z "$yay_installed" ]; then
    yay_temp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$yay_temp_dir" || exit 1
    cd "$yay_temp_dir"
    makepkg -si || exit 1
    cd -
    rm -rf "$yay_temp_dir"
fi

# Install yay packages
yay -S --needed pyprland swww || exit 1

# Extra nice packages
sudo pacman -S --needed tmux zathura || exit 1

# Extra extra packages
# sudo pacman -S libreoffice texlive bluez bluez-utils
