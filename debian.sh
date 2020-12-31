#!/bin/bash

# Update + Requirements
sudo apt update
sudo apt -y dist-upgrade
sudo apt install -y git gparted apt-transport-https

# essential dev tools
sudo apt install -y cmake ninja-build clang clang-format clangd clang-tidy lldb lld vim tmux git

# build deps
sudo apt install -y python3-distutils 

# handy console tools
sudo apt install -y ripgrep fd-find htop net-tools di tig expect wget curl

# remoting etc
sudo apt install -y barrier gparted openssh-server x11vnc mosh

# rust + cargo
sudo apt install -y cargo

# Lame early exist for Linux virtualization and GUI apps in the presence of WSL2.
if [ -d /mnt/c ]; then
  echo "Early exit for WSL2..."
  exit 0
fi

# git/vscode auth WA for Kubuntu
sudo apt install -y gnome-keyring

# Docker (The Debian/Ubuntu Distributed One) and Virt-Manager+KVM+QEMU
sudo apt install -y docker.io virt-manager

# For Formating nvme dev drives
sudo apt install -y gparted

# Password Management
sudo apt install -y keepassxc

# Add Microsoft Linux Package Repository and install VSCode (Insiders):
# https://docs.microsoft.com/en-us/windows-server/administration/linux-package-repository-for-microsoft-software
# https://code.visualstudio.com/docs/setup/linux
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/code stable main'
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code-insiders

# Add the following to /ets/fstab for nvme mount:
# LABEL=FastBoy                             /mnt/FastBoy    ext4    defaults          0       0
