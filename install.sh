#!/bin/bash
# A simple installer for the dotfiles

# CONFIGURABLES ================================================================

# a list of files that simply need to be prepended with a dot and put in $HOME
SIMPLE_FILES[0]="tmux.conf"
SIMPLE_FILES[1]="vimrc"
SIMPLE_FILES[2]="zshrc"
SIMPLE_FILES[3]="profile"
SIMPLE_FILES[4]="zprofile"
SIMPLE_FILES[5]="gitconfig"
SIMPLE_FILES[6]="gitignore"
SIMPLE_FILES[7]="ackrc"
SIMPLE_FILES[8]="ghci"
SIMPLE_FILES[9]="quiltrc-dpkg"

# a list of directories that should be overwritten (or created)
OVERWRITE_DIRS[0]="vim"
OVERWRITE_DIRS[1]="zsh"
OVERWRITE_DIRS[2]="config/pipeep-common"
OVERWRITE_DIRS[3]="config/powerline"

# a list of directories that should be extended with our files (or created)
EXTENDED_DIRS[0]="fonts"
EXTENDED_DIRS[1]="fonts.conf.d"

# SPECIAL CASES ================================================================
# ~/bin/ is special, as it doesn't get prepended with a dot
rm -rf "$HOME/bin"
cp -r "bin" "$HOME/bin"

# PROCESSING CODE ==============================================================
for DIR in ${OVERWRITE_DIRS[@]}; do
    mkdir -p "$HOME/.$DIR"
    rm -rf "$HOME/.$DIR"
    cp -r "$DIR" "$HOME/.$DIR"
done

for DIR in ${EXTENDED_DIRS[@]}; do
    mkdir -p "$HOME/.$DIR"
    cp -r "$DIR/." "$HOME/.$DIR"
done

for FILE in ${SIMPLE_FILES[@]}; do
    rm -f "$HOME/.$FILE"
    cp "$FILE" "$HOME/.$FILE"
done

# POSTINSTALL ==================================================================
./gnome-terminal.sh && true

