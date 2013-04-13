" Enable pathogen
call pathogen#infect()

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

nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Autocomplete me when opening a file:
set wildmode=longest,list
