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

# make cd perform ls, with truncation for long output
cd() { builtin cd "$@" && truncated_ls }
popd() { builtin popd "$@" && truncated_ls }
pushd() { builtin pushd "$@" && truncated_ls }

truncated_ls() {
    local N_LINES=10 # use no more than N lines for ls output
    local N_RESERVED=5 # reserve N lines of the term, useful for short windows
    local TERM_WIDTH=$(stty size | cut -d " " -f 2)
    local TERM_HEIGHT=$(stty size | cut -d " " -f 1)

    # if using all N lines might make us go over the reserved number of lines
    if [[ $(($TERM_HEIGHT - $N_RESERVED)) -lt $N_LINES ]]; then
        local N_LINES=$(($TERM_HEIGHT - $N_RESERVED))
    fi

    # compute and store the result of ls
    local LS_OUT="$(command ls --group-directories-first --format=across \
                               --color=always --width=$TERM_WIDTH)"
    local LS_N_LINES=$(builtin echo -E "$LS_OUT" | wc -l)

    if [[ $LS_N_LINES -gt $N_LINES ]]; then
        builtin echo -E "$LS_OUT" | head -n $(($N_LINES - 1))
        builtin echo "..."
    else
        builtin echo -E "$LS_OUT"
    fi
}

# I do this *way* too often (Thanks Colin!)
mkcd() {
    mkdir -p "$1"
    builtin cd "$1"
}

# ack is shorter than ack-grep
if ! type ack > /dev/null; then # Some systems already define `ack`
    alias ack=ack-grep
fi

