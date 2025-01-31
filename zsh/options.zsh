# This should contains some really generic options, mainly setopt stuff

# The editor of the gods
export EDITOR=vim

# Use vi keybindings regardless of EDITOR
bindkey -v
KEYTIMEOUT=1
bindkey -M vicmd '/' history-incremental-search-backward
bindkey "^R" history-incremental-search-backward
bindkey -v '^?' backward-delete-char

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
unsetopt share_history # oh-my-zsh sets this, I don't want it.

# Make cd act like pushd instead, letting us use popd to go back
setopt autopushd

# Comments in the REPL, useful for ascii.io recordings
setopt interactivecomments
