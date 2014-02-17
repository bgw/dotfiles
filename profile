# ~/.profile: executed by the command interpreter for login shells

# if running bash
# TODO: Move to ~/.bash_profile
if test -n "$BASH_VERSION"; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# local bin directories
if test -d "$HOME/bin"; then
    PATH="$HOME/bin:$PATH"
fi
if test -d "$HOME/bin_local"; then
    PATH="$HOME/bin_local:$PATH"
fi
if test -d "$HOME/.cabal/bin"; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# add the android ndk to the path
if test -d "$HOME/applications/android-ndk-r8"; then
    PATH="$HOME/applications/android-ndk-r8:$PATH"
fi

# define the prefered visual terminal
VTERM=x-terminal-emulator
