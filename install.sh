#!/bin/bash
# A simple installer for the dotfiles
# Run with -d to remove old configuration files first

# a list of files that simply need to be prepended with a dot and put in $HOME
SIMPLE_FILES[0]="tmux.conf"
SIMPLE_FILES[1]="vimrc"
SIMPLE_FILES[2]="zshrc"
SIMPLE_FILES[3]="gitconfig"

if [ $# -eq 1 ] && ( [ $1 = "-d" ] || [ $1 = "--delete" ] ); then
    echo "Warning: Removing old install"
    rm -rf "$HOME/bin"
    rm -rf "$HOME/.vim"
fi

cp -r bin "$HOME"
cp -r vim "$HOME/.vim"
cp fonts/* "$HOME/.fonts"
for FILE in ${SIMPLE_FILES[@]}; do
    rm "$HOME/.$FILE"
    cp "$FILE" "$HOME/.$FILE"
done
