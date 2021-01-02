#!/bin/bash


echo "Beware, this script will remove or modify your dotfiles."
read

cd `dirname "$0"`

#####################
## Setup gitconfig ##
#####################

echo "Enter git email:"
read
git config --global user.email "$REPLY"

echo "Enter git name:"
read
git config --global user.name "$REPLY"

cat gitconfig >> ~/.gitconfig
#####################

#####################
##    Setup Vim    ##
#####################
echo "Beware... About to `rm -f ~/.vim ~/.vimrc` and replace vimrc files..."
echo "Press Enter to Continue..."
read
rm -f ~/.vim ~/.vimrc
cp -r $(pwd)/vim ~/.vim
cp -r $(pwd)/vim/init.vim ~/.vimrc
#####################
