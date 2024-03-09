# Tools for traversing the filesystem

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
cd() { builtin cd "$@" && _truncated_ls }
popd() { builtin popd "$@" && _truncated_ls }
pushd() { builtin pushd "$@" && _truncated_ls }

# try to use gnu's version of ls, needed for --group-directories-first
# on OS X, you'll need to run `brew install coreutils`
if hash gls >/dev/null 2>&1; then
    # gls maps to gnu coreutil's ls on OS X
    _GLS_COMMAND=gls
else
    _GLS_COMMAND=ls
fi

# a pretty ls truncated to at most N lines; helper function for cd, popd, pushd
_truncated_ls() {
    local LS_LINES=8 # use no more than N lines for ls output
    local RESERVED_LINES=5 # reserve N lines of the term, for short windows
    # eg. if a window is only 8 lines high, we want to avoid filling up the
    # whole screen, so instead only 3 lines would be consumed.

    # if using all N lines makes us go over the reserved number of lines
    if [[ $(($LINES - $RESERVED_LINES)) -lt $LS_LINES ]]; then
        local LS_LINES=$(($LINES - $RESERVED_LINES))
    fi

    # compute and store the result of ls
    local RAW_LS_OUT="$(command $_GLS_COMMAND --group-directories-first \
                                              --format=across \
                                              --color=always \
                                              --width=$COLUMNS)"
    local RAW_LS_LINES="$(command wc -l <<< "$RAW_LS_OUT")"

    if [[ $RAW_LS_LINES -gt $LS_LINES ]]; then
        command head -n $(($LS_LINES - 1)) <<< "$RAW_LS_OUT"
        _right_align "... $(($RAW_LS_LINES - $LS_LINES + 1)) lines hidden"
    else
        builtin echo -E "$RAW_LS_OUT"
    fi
}

# right align text and echo it; helper function for _truncated_ls
_right_align() {
    local PADDING=$(($COLUMNS - ${#1}))
    [[ $PADDING -gt 0 ]] && builtin printf "%${PADDING}s"
    builtin echo "$1"
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

