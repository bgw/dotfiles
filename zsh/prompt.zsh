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
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}"
    fi
}
RPROMPT=$'$(vcs_info_wrapper)'
