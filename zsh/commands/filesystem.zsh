# Tools for traversing the filesystem

# Alias vless
VLESS="/usr/share/vim/vimcurrent/macros/less.sh"
if [ ! -z $VLESS ]; then
    alias vless=$VLESS
fi

# Make less use -R by default
alias less="less -R"

# Improve tree
tree() {
    # Fancy UTF8 codes, colors, don't clear screen, quit if output is short
    command tree --charset UTF8 -C "$@" | less -RXF
}

# make my ls pretty and colorful!
alias ls="ls --color=auto"
alias sl=ls # yeah, I do this way too much

# ack is shorter than ack-grep
if ! type ack > /dev/null; then # Some systems already define `ack`
    alias ack=ack-grep
fi

