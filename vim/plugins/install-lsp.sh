#!/bin/bash

# rm -rf LanguageClient-neovim deoplete.nvim

# Un-comment for code completion.
# git clone https://github.com/Shougo/deoplete.nvim.git

git clone --depth 1 https://github.com/autozimu/LanguageClient-neovim.git
cd LanguageClient-neovim
bash install.sh
