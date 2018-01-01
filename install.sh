#!/usr/bin/env zsh
# A simple installer for the dotfiles

# CONFIGURABLES ================================================================

# files that simply need to be prepended with a dot and put in $HOME
simple_files=(
    ackrc
    config/redshift.conf
    ghci
    gitconfig
    gitignore
    hyper.js
    npmrc
    profile
    quiltrc-dpkg
    tmux.conf
    vimrc
    zprofile
    zshrc
)

# directories that should be overwritten (or created)
overwrite_dirs=(
    config/mpDris2
    config/nvim
    config/pipeep-common
    config/powerline
    vim
    zsh
)

# directories that should be extended with our files (or created)
extended_dirs=(
    fonts
)

# SPECIAL CASES ================================================================
# ~/bin/ is special, as it doesn't get prepended with a dot
rm -rf ~/bin
cp -r bin ~/bin

# clean up old inconsolata fonts
rm -f ~/.fonts/Inconsolata*
rm -f ~/.fonts.conf.d/10-powerline-symbols.conf

# clean up old Xmodmap file
rm -f ~/.Xmodmap

# PROCESSING CODE ==============================================================
for dir in $overwrite_dirs; do
    mkdir -p ~/."$dir"
    rm -rf ~/."$dir"
    cp -r "$dir" ~/."$dir"
done

for dir in $extended_dirs; do
    mkdir -p ~/."$dir"
    cp -r "$dir"/. ~/."$dir"
done

for file in $simple_files; do
    rm -f ~/."$file"
    cp "$file" ~/."$file"
done

# POSTINSTALL ==================================================================
tic xterm-256color.terminfo
tic screen-256color.terminfo
