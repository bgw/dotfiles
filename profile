# ~/.profile: executed by the command interpreter for login shells

# if running bash
# TODO: Move to ~/.bash_profile
if test -n "$BASH_VERSION"; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

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

# local bin directories
path_prepend "$HOME/bin"
path_prepend "$HOME/bin_local"
path_prepend "$HOME/.cabal/bin"

# android stuff
export ANDROID_HOME="$HOME/opt/android-sdk"
export ANDROID_SDK="$ANDROID_HOME"
path_append "$ANDROID_SDK_HOME/tools"
path_append "$ANDROID_SDK_HOME/platform-tools"
path_append "$HOME/opt/gradle/bin"
path_append "$HOME/opt/buck/bin"

# disable ~/.lesshst (potential data leakage)
export LESSHISTFILE=/dev/null

# define the prefered visual terminal
export VTERM=x-terminal-emulator

unset -f path_prepend
unset -f path_append
