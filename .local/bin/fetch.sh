#!/bin/bash

# Clear the terminal screen
clear

# Display image with kitty
kitty +kitten icat --align left --place "20x20@0x0" "$HOME/pictures/fetch/pochita.png"

# Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
WHITE='\033[0;37m'
NO_COLOR='\033[0m'

# Icons (you can replace these with preferred icons)
USER_ICON="${RED}${NO_COLOR}"
HOSTNAME_ICON="${YELLOW}${NO_COLOR}"
DISTRO_ICON="${GREEN}󰻀${NO_COLOR}"
UPTIME_ICON="${CYAN}${NO_COLOR}"
SHELL_ICON="${BLUE}${NO_COLOR}"
PKGS_ICON="${MAGENTA}󰏖${NO_COLOR}"
RAM_ICON="${RED}󰍛${NO_COLOR}"
COLOR_ICON="󰏘"

# System Information Gathering
userInfo=$(whoami)
hostnameInfo=$(hostname)
distroInfo="Arch Linux"
uptimeInfo=$(uptime -p | sed 's/up //')
shellInfo=$SHELL
pkgsInfo=$(pacman -Q | wc -l)
ramInfo=$(awk '/MemTotal/ {total=$2} /MemAvailable/ {available=$2} END {used=(total-available)/1024; printf "%d | %d MiB\n", used, total/1024}' /proc/meminfo)

# Spacing
spacing="                      " # Make space for image

# Displaying Information with Formatting
echo -e "${spacing}╭───────────╮"
echo -e "${spacing}│ ${USER_ICON}  user   │ ${RED}$userInfo${NO_COLOR}"
echo -e "${spacing}│ ${HOSTNAME_ICON}  hname  │ ${YELLOW}$hostnameInfo${NO_COLOR}"
echo -e "${spacing}│ ${DISTRO_ICON}  distro │ ${GREEN}$distroInfo${NO_COLOR}"
echo -e "${spacing}│ ${UPTIME_ICON}  uptime │ ${CYAN}$uptimeInfo${NO_COLOR}"
echo -e "${spacing}│ ${SHELL_ICON}  shell  │ ${BLUE}$(basename $shellInfo)${NO_COLOR}"
echo -e "${spacing}│ ${PKGS_ICON}  pkgs   │ ${MAGENTA}$pkgsInfo${NO_COLOR}"
echo -e "${spacing}│ ${RAM_ICON}  memory │ ${RED}$ramInfo${NO_COLOR}"
echo -e "${spacing}├───────────┤"
echo -e "${spacing}│ ${COLOR_ICON} colors  │ ${WHITE} ${RED} ${YELLOW} ${GREEN} ${CYAN} ${BLUE} ${MAGENTA} ${NO_COLOR}"
echo -e "${spacing}╰───────────╯${NO_COLOR}"
echo
