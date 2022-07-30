" Run vim-sensible first so we can override it as needed
runtime! plugin/sensible.vim

" Styling
set t_Co=256 " I like colors!
set termguicolors
set t_ut= " disable background color erase
colorscheme base16-default-dark
let g:airline_theme='base16_default'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
set hlsearch
highlight Search ctermbg=00 ctermfg=03 cterm=underline
highlight VertSplit ctermbg=232 ctermfg=232
highlight LineNr ctermbg=235 ctermfg=08
set encoding=utf-8

" ALE
let g:ale_enabled=0 " disable by default, until I'm more comfortable with it
highlight SignColumn ctermbg=235
highlight ALEErrorSign ctermbg=01 ctermfg=01
highlight ALEWarningSign ctermbg=03 ctermfg=03

" handle indentation
set autoindent
set smartindent
command -nargs=1 SetIndent setlocal ts=<args> sts=<args> sw=<args>
set ts=4 sts=4 sw=4
set expandtab " use spaces in place of tabs

" Unfold by default
set foldlevel=99

" Give us a line at 80 columns
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235

" Let us use the mouse inside gnome-terminal
set mouse=a

" Custom commands
command StripEOL %s/\s\+\n/\r/g
command Strp StripEOL

command UseTabs set noexpandtab
command Utb UseTabs

command UseSpaces set expandtab
command Usp UseSpaces

nnoremap <Space> :
nnoremap Y y$

nmap <F8> :TagbarToggle<CR>

" Autocomplete me when opening a file:
set wildmode=longest,list

" Disable vim-sensible's undo files (because I don't think it's sensible)
if has('persistent_undo')
    set noundofile
endif

" Disable ~/.viminfo -- It's leaky and doesn't add much
set viminfo=""

" pandoc
let g:pandoc#syntax#conceal#use=0
let g:pandoc#formatting#textwidth=&textwidth
let g:pandoc#formatting#mode = "ha"
let g:pandoc#modules#enabled = [
    \"bibliographies",
    \"completion",
    \"command",
    \"formatting",
    \"menu",
    \"metadata",
    \"keyboard" ,
    \"toc",
    \"chdir",
    \"spell",
    \"hypertext"]

" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" ctrlp options for working with large projects
let g:ctrlp_lazy_update = 350
let g:ctrlp_max_files = 0
if executable("rg")
    set grepprg=rg\ --no-heading\ --color=never
    let g:ctrlp_user_command = 'cd %s && rg --files --color=never --glob "" --iglob "!node_modules"'
elseif executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
