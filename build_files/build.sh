#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf5 install -y tmux

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 install -y niri xwayland-satellite swaybg waybar
dnf5 install -y zsh bat btop fzf ripgrep trash-cli
dnf5 install -y wine winetricks podman
dnf5 install -y blueman bluez bluez-tools
dnf5 install -y inotify-tools mako
dnf5 install -y gnome-tweaks fuzzel input-remapper firefox foot kitty
dnf5 install -y adw-gtk3-theme papirus-icon-theme
dnf5 install -y qt5ct qt6ct
dnf5 install -y xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring
dnf5 install -y nautilus
dnf5 install -y podman-compose

dnf5 copr -y enable scottames/ghostty
dnf5 install -y ghostty

dnf5 copr -y enable atim/starship
dnf5 install -y starship

dnf5 copr -y enable rockowitz/ddcutil
dnf5 install -y ddcutil

dnf5 copr -y enable errornointernet/quickshell
dnf5 install -y quickshell-git

# XPPen
dnf5 install -y https://download01.xp-pen.com/file/2025/02/XPPenLinux4.0.7-250117.rpm

systemctl enable podman.socket
systemctl enable input-remapper
