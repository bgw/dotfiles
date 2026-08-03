# ~/.profile: executed by the command interpreter for login shells

path_prepend() {
    if [ -d "$1" ]; then
        PATH="$1:$PATH"
    fi
}

path_append() {
    if [ -d "$1" ]; then
        PATH="$PATH:$1"
    fi
}

# package manager bin directories
path_prepend "$HOME/.yarn-config/global/node_modules/.bin"
path_prepend "$HOME/.npm-packages/bin"

PNPM_HOME="$HOME/.local/share/pnpm"
if [ -d "$PNPM_HOME" ]; then
    export PNPM_HOME
    path_prepend "$HOME/.local/share/pnpm/bin"
fi

path_prepend "$HOME/.local/bin" # used by pip
path_prepend "$HOME/.cargo/bin"

# prepend these last: user-defined bin directories
path_prepend "$HOME/bin"
path_prepend "$HOME/bin_local"

# node
export FNM_COREPACK_ENABLED=true

# disable ~/.lesshst (potential data leakage)
export LESSHISTFILE=/dev/null

if command -v x-terminal-emulator >/dev/null; then
    export VTERM=x-terminal-emulator
fi

if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi

# run user-defined local config
unset -f path_prepend
unset -f path_append
if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi
