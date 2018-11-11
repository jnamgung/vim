set nocompatible  "Kill vi-compatibility
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

" Indent 4 spaces
set tabstop=4  "4 space tabs
set shiftwidth=4  "4 space shift
set softtabstop=4  "Tab spaces in no hard tab mode
set expandtab  " Expand tabs into spaces
set autoindent  "autoindent on new lines

set showmatch  "Highlight matching braces

set ruler  "Show bottom ruler

set equalalways  "Split windows equal size

set formatoptions=croq  "Enable comment line auto formatting

set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately

set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position
set relativenumber "Show line numbers

set foldmethod=syntax

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" Syntax highlighting and stuff
syntax on
filetype plugin indent on

fun! SetupCommandAlias(from, to)
    exec 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Q", "q")
call SetupCommandAlias("WQ", "wq")
call SetupCommandAlias("Wq", "wq")
call SetupCommandAlias("wQ", "wq")

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'taohexxx/lightline-buffer'
Plug 'mhinz/vim-signify'
call plug#end()

autocmd BufEnter,FocusGained * set nonumber relativenumber
autocmd BufLeave,FocusLost * set number norelativenumber
set timeoutlen=500

set background=dark
colorscheme jellybeans
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set laststatus=2
set hidden
set showtabline=2
let g:lightline = {
            \ 'component': {
            \   'lineinfo': "%{printf('%4u/%-4u: %3u/%-3u', line('.'), line('$'), col('.'), col('$'))}",
            \   'separator': '',
            \ },
            \ 'colorscheme': 'jellybeans',
            \ 'tabline': {
            \   'left': [ [ 'bufferinfo' ],
            \             [ 'separator' ],
            \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
            \   'right': [ [ 'close' ], ],
            \ },
            \ 'component_expand': {
            \   'buffercurrent': 'lightline#buffer#buffercurrent',
            \   'bufferbefore': 'lightline#buffer#bufferbefore',
            \   'bufferafter': 'lightline#buffer#bufferafter',
            \ },
            \ 'component_type': {
            \   'buffercurrent': 'tabsel',
            \   'bufferbefore': 'raw',
            \   'bufferafter': 'raw',
            \ },
            \ 'component_function': {
            \   'bufferinfo': 'lightline#buffer#bufferinfo',
            \ },
            \ }
let g:signify_vcs_list = ['git', 'svn']

nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
nnoremap <Up> :bfirst<CR>
nnoremap <Down> :blast<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20

