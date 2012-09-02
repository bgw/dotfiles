# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

# setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt \
    %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' \
    'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt \
    %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Alias ~/bin and ~/bin_local (for machine-local binaries)
export PATH="$HOME/bin_local:$HOME/bin:$PATH"

# Alias Sage and setup SageTeX
export SAGE_ROOT="$HOME/Applications/$( \
    for alternative in "$(ls $HOME/Applications/ 2> /dev/null | grep ^sage)"; \
        do echo "$alternative"; done \
    | sort | tail -n 1 | tr -d "\n" \
)" # finds the latest version of sage installed
alias sage="$SAGE_ROOT/sage"
export TEXINPUTS="$SAGE_ROOT/local/share/texmf//:"

# Alias vless
VLESS="/usr/share/vim/vimcurrent/macros/less.sh"
if [ ! -z $VLESS ]; then
    alias vless=$VLESS
fi

# Use vim as the default editor
export EDITOR=vim

# Make lynx use the mouse
alias lynx="lynx -use_mouse"

# shortcuts for school
export SCHOOL_CUR="$HOME/Documents/school/12_fall"
cdschool () {
    cd "$SCHOOL_CUR/$1"
}

# make my ls pretty and colorful!
alias ls="ls --color=auto"

if [ $TERM = "xterm" ]; then
    # Use 256 Colors! (in xterm and things that report themselves as xterm, like
    # gnome-terminal)
    export TERM=xterm-256color
fi

# shorter aptitude commands
alias apti="sudo aptitude install"
alias aptr="sudo aptitude remove"
alias aptd=aptr
alias apts="aptitude search"
alias aptv="aptitude versions"
alias aptu="sudo aptitude update && sudo aptitude safe-upgrade"

# work around a bug with starting evince under tmux sometimes
alias evince="dbus-launch evince"

# add the android ndk to the path
export PATH="$HOME/Applications/android-ndk-r8:$PATH"

# Debian VBox virtual machine
debvm-start() {
    echo "Once VM is booted, run: ssh debian_vm"
    VBoxHeadless -startvm 'Debian Squeeze (Minimal)'
}

debvm-stop() {
    VBoxManage controlvm 'Debian Squeeze (Minimal)' acpipowerbutton
}

debvm-cp() {
    rsync -rtp --delete "$1" "debian_vm:$2"
}

# On the UF CISE servers, aliases for simple quota lookups
if [ `hostname` = "storm" ] || [ `hostname` = "thunder" ]; then
    export LOCAL_QUOTA="$(quota -vsw 2> /dev/null | grep woodruff | tail -n 1 |\
                        tr -s " " "\012")"
    export QUOTA_USAGE="$(echo $LOCAL_QUOTA | sed -n 2p)"
    export QUOTA_TOTAL="$(echo $LOCAL_QUOTA | sed -n 3p)"
    alias simplequota='echo "Using $QUOTA_USAGE out of $QUOTA_TOTAL."'
fi

# define suffix aliases for files (default programs)
alias -s tex="$EDITOR"
alias -s md="$EDITOR"
alias -s markdown="$EDITOR"
alias -s rst="$EDITOR"
alias -s css="$EDITOR"
alias -s scss="$EDITOR"
alias -s sass="$EDITOR"
alias -s html=firefox
alias -s pdf=evince
