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

dnf5 install -y \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf5 install -y akmod-nvidia
dnf5 install -y xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda

dnf5 install -y gnome-tweaks niri xwayland-satellite swaybg fuzzel zsh bat btop mako blueman waybar wine winetricks xinput
dnf5 remove -y alacritty

# VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf5 install -y code # or code-insiders

# XPPen
dnf5 install -y https://download01.xp-pen.com/file/2025/02/XPPenLinux4.0.7-250117.rpm

#### Example for enabling a System Unit File

systemctl enable podman.socket
