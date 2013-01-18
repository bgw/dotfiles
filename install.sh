#!/bin/bash
# A simple installer for the dotfiles

# CONFIGURABLES ================================================================

# a list of files that simply need to be prepended with a dot and put in $HOME
SIMPLE_FILES[0]="tmux.conf"
SIMPLE_FILES[1]="tmux-powerlinerc"
SIMPLE_FILES[2]="vimrc"
SIMPLE_FILES[3]="zshrc"
SIMPLE_FILES[4]="profile"
SIMPLE_FILES[5]="zprofile"
SIMPLE_FILES[6]="gitconfig"
SIMPLE_FILES[7]="gitignore"

# a list of directories that should be overwritten (or created)
OVERWRITE_DIRS[0]="vim"
OVERWRITE_DIRS[1]="tmux"

# a list of directories that should be extended with our files (or created)
EXTENDED_DIRS[0]="fonts"
EXTENDED_DIRS[1]="local/share/applications"
EXTENDED_DIRS[2]="icons"

# SPECIAL CASES ================================================================
# ~/bin/ is special, as it doesn't get prepended with a dot
rm -rf "$HOME/bin"
cp -r "bin" "$HOME/bin"

# PROCESSING CODE ==============================================================
for DIR in ${OVERWRITE_DIRS[@]}; do
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
