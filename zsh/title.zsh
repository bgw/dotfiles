# oh-my-zsh's auto-title implementation doesn't play well with hyper, because
# xterm.js interprets the short and long titles the same way. This is a hack to
# wrap the title function and make it use the long title in place of both the
# short and long titles.

eval "`declare -f title | sed '1s/.*/omz_&/'`"

function title () {
  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}
  omz_title $2
}
