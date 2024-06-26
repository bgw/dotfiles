#!/usr/bin/env zsh
# A simple installer for the dotfiles

set -eux
set -o pipefail

# CONFIGURABLES ================================================================

# files that simply need to be prepended with a dot and put in $HOME
simple_files=(
    gitconfig
    gitignore
    npmrc
    profile
    tmux-powerlinerc
    tmux.conf
    zprofile
    zshrc
)

# directories that should be overwritten (or created)
overwrite_dirs=(
    config/nvim
    config/bgw-common
    config/tmux-powerline-themes
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

# clean up old inconsolata/hack/knack fonts
if [[ -d ~/.fonts ]]; then
    rm -f ~/.fonts/Inconsolata*(N)
    rm -f ~/.fonts/Hack-*.ttf(N) ~/.fonts/Knack-*.ttf(N)
fi

# clean up old and dead config files
rm -f ~/.terminfo/{s/screen,x/xterm}-256color{,-italic}
rmdir ~/.terminfo/s 2>/dev/null || true
rmdir ~/.terminfo/x 2>/dev/null || true
rmdir ~/.terminfo 2>/dev/null || true
rm -rf ~/.config/pipeep-common
rm -rf ~/.config/powerline
rm -f .quiltrc-dpkg

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
