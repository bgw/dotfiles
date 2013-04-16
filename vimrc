" Enable pathogen
call pathogen#infect()

" Run vim-sensible first so we can override it as needed
runtime! plugin/sensible.vim

" Styling
set t_Co=256 " I like colors!
colorscheme jellybeans
set encoding=utf-8

" handle indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces in place of tabs

" Unfold by default
set foldlevel=99

" Give us a line at 80 columns
set textwidth=80
set colorcolumn=+1

" Let us use the mouse inside gnome-terminal
set mouse=a
" Let us use the system clipboard
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

" Custom commands
command StripEOL %s/\s\+\n/\r/g
command Strp StripEOL

command UseTabs set noexpandtab
command Utb UseTabs

command UseSpaces set expandtab
command Usp UseSpaces

nnoremap <Space> :

" Autocomplete me when opening a file:
set wildmode=longest,list

" Disable vim-sensible's undo files (because I don't think it's sensible)
if has('persistent_undo')
    set noundofile
endif
