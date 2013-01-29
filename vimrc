" Enable pathogen
call pathogen#infect()

" Enable powerline
set laststatus=2
let g:Powerline_colorscheme='skwp'
let g:Powerline_symbols = 'fancy'

" Styling
set t_Co=256 " I like colors!
syntax on
colorscheme jellybeans

" Subconfiguration options
filetype plugin on " custom language configuration

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
" highlight ColorColumn ctermbg=233

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

" Make vim more responsive when ESC is pressed
set timeout timeoutlen=1000 ttimeoutlen=100

" Make searches highlighted
set hlsearch " the default jellybeans coloring is fine for this
" pressing space will disable search highlighting, and clear the message line
nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
