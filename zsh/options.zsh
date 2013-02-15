# This should contains some really generic options, mainly setopt stuff

# The editor of the gods
export EDITOR=vim

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

if [ $TERM = "xterm" ]; then
    # Use 256 Colors! (in xterm and things that report themselves as xterm, like
    # gnome-terminal)
    export TERM=xterm-256color
fi

# Make cd act like pushd instead, letting us use popd to go back
setopt autopushd

# Comments in the REPL, useful for ascii.io recordings
setopt interactivecomments

