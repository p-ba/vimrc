let mapleader="," "Changes Leader key into a comma instead of a backslash
set nocompatible "be iMproved
filetype off "required!

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'php.vim'
Bundle 'L9'
Bundle 'twilight'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'joonty/vdebug'
Bundle 'FuzzyFinder'
Bundle 'mattn/emmet-vim'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

:set tags=./tags;

map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

" Indentaion
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on

let g:vdebug_options = {
\ "path_maps" : {"/var/www/site/": "/home/pavel/vm/vbox/site/"},
\ "server"    : "0.0.0.0"
\}

set wildchar=<Tab> wildmenu wildmode=full

" Visual options
colorscheme railscasts
" set background=dark
set number
set rnu
set guioptions=egmt "remove toolbar, scrollbars

" Searching
set incsearch "Search while typing
set ignorecase "Case Insensitive Searching
set smartcase "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch "Highlight all search results
" clear text hightlighted by seach
nnoremap <leader>b :nohlsearch<CR>
nmap ,f :FufBufferTag<CR>
nmap ,p :FufCoverageFile<CR>

" Buffers
" Ctrl Left & Right move between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nnoremap <silent> <Leader>q :bd<CR>

" Copy/paste options
set pastetoggle=<F2>
" ,v = Paste from OS buffer
map <Leader>v "+gP
" ,c = Copy to OS buffer
map <Leader>c "+y

"------ Moving Between Windows ------
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
