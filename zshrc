source ~/.zsh/prompt.zsh
source ~/.zsh/options.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/associations.zsh

for f in ~/.zsh/commands/**/*; do
    source "$f"
done
