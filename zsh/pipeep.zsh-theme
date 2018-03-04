# A fork of 'josh'

grey='\e[0;90m'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%} ["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$grey%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$grey%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$grey%}"
ZSH_THEME_VIRTUALENV_PREFIX="%{$grey%} ["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

setopt prompt_subst

PROMPT='
%n@%m %{%F{green}%}$PWD$alignment%{%F{red}%}$(rvm_prompt_info || rbenv_prompt_info)%{$reset_color%}
%(?,%{%F{green}%},%{%F{red}%}) %{$reset_color%}'
RPROMPT='$(git_prompt_info)$(virtualenv_prompt_info)'

# Currently disabled, as it can cause cd to hang. I may re-enable this after
# some hardware upgrades...
parse_git_dirty() {}
