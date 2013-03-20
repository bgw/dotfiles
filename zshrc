source ~/.zsh/prompt.zsh
source ~/.zsh/options.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/associations.zsh

for f in ~/.zsh/commands/**/*; do
    source "$f"
done
for f in ~/.zsh/bundle/*.zsh; do
    source "$f"
done
