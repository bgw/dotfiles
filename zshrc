source ~/.config/base16/shell/base16-default.dark.sh
ZSH_THEME=pipeep

plugins=(
    adb
    autojump
    colored-man
    git
    mosh
    npm
    tmux
    vagrant
    vi-mode
    virtualenv
)

for f in ~/.zsh/bundle/*.zsh; do
    source "$f"
done

source ~/.zsh/options.zsh
source ~/.zsh/associations.zsh

for f in ~/.zsh/commands/**/*; do
    source "$f"
done

if [[ -f "~/.zshrc.local" ]]; then
    source "~/.zshrc.local"
fi
