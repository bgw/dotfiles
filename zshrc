plugins=(
    adb
    autojump
    colored-man-pages
    mosh
    npm
    systemd
    tmux
    vagrant
    yarn
)

for f in ~/.zsh/bundle/*.zsh; do
    source "$f"
done

for f in ~/.zsh/bundle/after/*.zsh; do
    source "$f"
done

source ~/.zsh/options.zsh
source ~/.zsh/associations.zsh

for f in ~/.zsh/commands/**/*; do
    source "$f"
done

autoload -U promptinit; promptinit
prompt pure

if [[ -f "~/.zshrc.local" ]]; then
    source "~/.zshrc.local"
fi
