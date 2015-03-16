#!/usr/bin/zsh
# A simple installer for the dotfiles

# CONFIGURABLES ================================================================

# files that simply need to be prepended with a dot and put in $HOME
simple_files=(
    Xmodmap
    ackrc
    ghci
    gitconfig
    gitignore
    profile
    quiltrc-dpkg
    tmux.conf
    vimrc
    zprofile
    zshrc
)

# directories that should be overwritten (or created)
overwrite_dirs=(
    config/base16
    config/pipeep-common
    config/powerline
    vim
    zsh
)

# directories that should be extended with our files (or created)
extended_dirs=(
    fonts
    fonts.conf.d
)

# SPECIAL CASES ================================================================
# ~/bin/ is special, as it doesn't get prepended with a dot
rm -rf ~/bin
cp -r bin ~/bin

# needed for the oh-my-zsh gnupg plugin
touch ~/.gnupg/gpg-agent.env

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
#./gnome-terminal.sh && true
#zsh config/base16/gnome-terminal/base16-default.dark.sh # disable for now
tic xterm-256color-italic.terminfo
tic screen-256color-italic.terminfo
xmodmap ~/.Xmodmap 2> /dev/null && true # will cause errors if already loaded
