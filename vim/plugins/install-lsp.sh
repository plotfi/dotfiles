#!/bin/bash

rm -rf LanguageClient-neovim
git clone --depth 1 https://github.com/autozimu/LanguageClient-neovim
cd LanguageClient-neovim
bash install.sh
