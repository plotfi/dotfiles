#!/bin/bash

# Update + Requirements
sudo apt update
sudo apt -y dist-upgrade
sudo apt install -y git gparted

# essential dev tools
sudo apt install -y cmake ninja-build clang clang-format clangd clang-tidy lldb lld vim tmux git

# build deps
sudo apt install -y python3-distutils 

# handy console tools
sudo apt install -y ripgrep htop net-tools di tig expect wget curl

# remoting etc
sudo apt install -y barrier gparted openssh-server x11vnc mosh

# git/vscode auth WA for Kubuntu
sudo apt install -y gnome-keyring

# rust + cargo
sudo apt install -y cargo

# Docker (The Debian/Ubuntu Distributed One) and Virt-Manager+KVM+QEMU
sudo apt install -y docker.io virt-manager

# For Formating nvme dev drives
sudo apt install -y gparted

# Password Management
sudo apt install -y keepassxc

# Add the following to /ets/fstab for nvme mount:
# LABEL=FastBoy                             /mnt/FastBoy    ext4    defaults          0       0
