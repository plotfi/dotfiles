#!/bin/bash

# essential dev tools
sudo apt install cmake ninja-build clang clang-format clangd clang-tidy lldb lld vim tmux git

# build deps
sudo apt install python3-distutils 

# handy console tools
sudo apt install ripgrep htop net-tools di tig

# other
sudo apt install barrier gparted openssh-server

# git/vscode auth WA for Kubuntu
sudo apt install gnome-keyring

# rust + cargo
sudo apt install cargo

# Docker (The Debian/Ubuntu Distributed One) and Virt-Manager+KVM+QEMU
sudo apt install docker.io virt-manager
