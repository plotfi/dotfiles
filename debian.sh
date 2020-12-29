#!/bin/bash

# essential dev tools
sudo apt install cmake ninja-build clang clang-format clangd clang-tidy lldb lld vim tmux git

# build deps
sudo apt install python3-distutils 

# handy console tools
sudo apt install ripgrep htop net-tools di tig expect wget curl

# remoting etc
sudo apt install barrier gparted openssh-server x11vnc

# git/vscode auth WA for Kubuntu
sudo apt install gnome-keyring

# rust + cargo
sudo apt install cargo

# Docker (The Debian/Ubuntu Distributed One) and Virt-Manager+KVM+QEMU
sudo apt install docker.io virt-manager

# For Formating nvme dev drives
sudo apt install gparted

# Password Management
sudo apt install keepassxc

# Add the following to /ets/fstab for nvme mount:
# LABEL=FastBoy                             /mnt/FastBoy    ext4    defaults          0       0
