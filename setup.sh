#!/bin/bash

# NOTE: This setup file is specific to Void Linux

# install packages
window_manager=" sway swaybg swaylock swayidle foot bemenu Waybar polkit xorg xorg-server-xwayland elogind brightnessctl"
drivers="vulkan-loader mesa-vulkan-radeon mesa-vaapi mesa-vdpau mesa-vulkan-intel intel-video-accel"
web_browsers="firefox qutebrowser"
media="mpv mpc mpd ncmpcpp zathura zathura-pdf-mupdf imv"
tools="neovim fzf ripgrep ranger htop git stow base-devel zip unzip tmux python3-tmuxp xdg-user-dirs xdg-desktop-portal xdg-desktop-portal-wlr gnupg grimshot cronie curl wget mako libnotify qt5-wayland qt6-wayland python3-adblock"
network="NetworkManager network-manager-applet"
audio="pipewire wireplumber pavucontrol pamixer libjack-pipewire"
programming="docker docker-compose openssl openssl-devel libyaml-devel"

sudo xbps-install -Su
sudo xbps-install ${window_manager} ${drivers} ${web_browsers} ${media} ${tools} ${network} ${audio} ${programming} ${databases}

# disable bitmap fonts
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f fontconfig

# pipewire setup
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

# link dotfiles
rm ~/.bash*
cd dots && stow -t ~ *

# create xdg-dirs
cd
sed -n 's/.*HOME\/\([a-z\/]\+\).*/\1/p' ~/.config/user-dirs.dirs | xargs mkdir -p

# create mpd+ncmpcpp directories and files
awk '/(directory)/ { print $2 }' ~/.config/mpd/mpd.conf | xargs -I % bash -c "mkdir -p %"
awk '/(_file)/ { print $2 }' ~/.config/mpd/mpd.conf | xargs -I % bash -c "touch %"
awk -F '=' '/(_directory)/ { print $2 }' ~/.config/ncmpcpp/config | xargs -I % bash -c "mkdir -p %"

# download nerd font
mkdir ~/.local/share/fonts -p
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
unzip CascadiaCove.zip && rm CaskadiaCove.zip

# install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
# install rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
#
# enable services
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/cronie /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/docker /var/service/
