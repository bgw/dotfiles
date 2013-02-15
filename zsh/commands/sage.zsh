# Alias Sage and setup SageTeX
export SAGE_ROOT="$HOME/Applications/$( \
    for alternative in "$(ls $HOME/Applications/ 2> /dev/null | grep ^sage)"; \
        do echo "$alternative"; done \
    | sort | tail -n 1 | tr -d "\n" \
)" # finds the latest version of sage installed
alias sage="$SAGE_ROOT/sage"
export TEXINPUTS="$SAGE_ROOT/local/share/texmf//:"
