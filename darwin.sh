#!/bin/bash

# The following assumes you've installed Xcode tools and brew, ie:
#
#  xcode-select --install
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# essential dev tools (no clangd)
brew install cmake ninja clang-format clang-tidy tmux

# handy console tools
brew install ripgrep fd-find htop di tig expect wget
