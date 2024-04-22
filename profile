# ~/.profile: executed by the command interpreter for login shells

path_prepend() {
    if test -d "$1"; then
        PATH="$1:$PATH"
    fi
}

path_append() {
    if test -d "$1"; then
        PATH="$PATH:$1"
    fi
}

# ccache
path_prepend "/usr/lib/ccache"

# local bin directories
path_prepend "$HOME/bin"
path_prepend "$HOME/bin_local"
path_prepend "$HOME/.cabal/bin"
path_prepend "$HOME/.yarn-config/global/node_modules/.bin"
path_prepend "$HOME/.npm-packages/bin"
path_prepend "$HOME/.local/bin" # used by pip

# android stuff
export ANDROID_HOME="$HOME/opt/android-sdk"
export ANDROID_SDK="$ANDROID_HOME"
path_append "$ANDROID_SDK/tools"
path_append "$ANDROID_SDK/platform-tools"
path_append "$ANDROID_SDK/cmdline-tools/latest/bin"
path_append "$HOME/opt/gradle/bin"
path_append "$HOME/opt/buck/bin"

# rust
path_append "$HOME/.cargo/bin"

# disable ~/.lesshst (potential data leakage)
export LESSHISTFILE=/dev/null

# define the prefered visual terminal
export VTERM=x-terminal-emulator

# vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt

if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi

# npm
export NODE_PATH="$NODE_PATH:$HOME/.npm-packages/lib/node_modules"

# libvirt/virsh
export LIBVIRT_DEFAULT_URI="qemu:///system"

unset -f path_prepend
unset -f path_append

if [ -f "$HOME/.profile.local" ]; then
    . "$HOME/.profile.local"
fi

# if running bash
# TODO: Move to ~/.bash_profile
if test -n "$BASH_VERSION"; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
