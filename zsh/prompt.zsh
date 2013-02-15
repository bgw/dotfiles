# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1
PROMPT="$PROMPT"'$([ -n "$TMUX" ] &&
                 tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

