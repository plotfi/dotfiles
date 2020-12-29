#!/bin/bash


echo "Beware, this script will remove or modify your dotfiles."
read

cd `dirname "$0"`

#####################
## Setup gitconfig ##
#####################
rm -f ~/.gitconfig ~/.tmux.conf ~/.vim ~/.vimrc

echo "Enter git email:"
read
git config --global user.email "$REPLY"

echo "Enter git name:"
read
git config --global user.name "$REPLY"

cat gitconfig >> ~/.gitconfig
#####################

#####################
## Setup the rest  ##
#####################
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/vim ~/.vim
ln -s $(pwd)/vim/init.vim ~/.vimrc
echo "source $(pwd)/bashrc" >> ~/.bashrc
ln -s $(which clang) ./vim/plugins/
#####################
