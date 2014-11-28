# Load the standard ~/.profile in sh emulation mode
if [[ -e ~/.profile ]]; then
    emulate sh
    . $HOME/.profile
    emulate zsh
fi
