# This should contains some really generic options, mainly setopt stuff

# The editor of the gods
export EDITOR=vim

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

if [ $TERM = "xterm" ]; then
    # Use 256 Colors! (in xterm and things that report themselves as xterm, like
    # gnome-terminal)
    export TERM=xterm-256color
fi

# Make cd act like pushd instead, letting us use popd to go back
setopt autopushd

# Comments in the REPL, useful for ascii.io recordings
setopt interactivecomments
