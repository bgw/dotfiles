# Set up the prompt

autoload -Uz promptinit
autoload -Uz vcs_info
autoload -Uz colors && colors
setopt prompt_subst

# Build our base prompt from adam1
promptinit
prompt adam1
# Set some stuff for tmux-powerline
PROMPT="$PROMPT"'$([ -n "$TMUX" ] &&
                 tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Configure version control support on the right
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' enable git hg svn

# Define a wrapper used via command substitution
vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo " [$vcs_info_msg_0_]"
    fi
}
virtualenv_info_wrapper() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo " [$name]"
    fi
}
RPROMPT='%F{243}'
RPROMPT="$RPROMPT"'$(vcs_info_wrapper)$(virtualenv_info_wrapper)'
RPROMPT="$RPROMPT"'%f'
