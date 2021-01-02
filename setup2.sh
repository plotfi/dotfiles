#!/bin/bash


echo "Beware, this script will remove or modify your dotfiles."
read

if [ -e ~/.gitconfig ]; then
  echo "~/.gitconfig directory exists, bailing"
  exit 0
fi

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
echo "Beware... About to `rm -rf ~/.vim ~/.vimrc` and replace vimrc files..."
echo "Press Enter to Continue..."
read

if [ -e ~/.vim ]; then
  echo "~/.vim directory exists, bailing"
  exit 0
fi

if [ -e ~/.vimrc ]; then
  echo "~/.vimrc exists, bailing"
  exit 0
fi

cp -r $(pwd)/vim ~/.vim
cp -r $(pwd)/vim/init.vim ~/.vimrc
#####################
