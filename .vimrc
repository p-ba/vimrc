let mapleader="," "Changes Leader key into a comma instead of a backslash
set nocompatible "be iMproved
filetype off "required!

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'php.vim'
Plugin 'L9'
Plugin 'twilight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'FuzzyFinder'
Plugin 'mattn/emmet-vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'walm/jshint.vim'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

:set tags=./tags;

set rtp+=~/.fzf

map <C-n> :NERDTreeToggle<CR>

" Indentaion
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
syntax on

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

set wildchar=<Tab> wildmenu wildmode=full

set t_Co=256

" Visual options
colorscheme railscasts
" set background=dark
set number
set guioptions=egmt "remove toolbar, scrollbars
" Ignore following files when completing file/directory names
" Version control
set wildignore+=.hg,.git,.svn
" Python byte code
set wildignore+=*.pyc
" Binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg


" Searching
set incsearch "Search while typing
set ignorecase "Case Insensitive Searching
set smartcase "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch "Highlight all search results
" clear text hightlighted by seach
nnoremap <leader>b :nohlsearch<CR>
nmap ,f :FufBufferTag<CR>
nmap ,p :FufCoverageFile<CR>
nmap ,t :FufTag<CR>

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

" Ctrl+s
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" {<CR>
" auto complete {} indent and position the cursor in the middle line
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O

" Move lines
" Move one line
nmap <C-S-k> ddkP
nmap <C-S-j> ddp
" Move selected lines
" See http://www.vim.org/scripts/script.php?script_id=1590
vmap <C-S-k> xkP'[V']
vmap <C-S-j> xp'[V']

" Backup и swp file
" Don't create backups
set nobackup
" Don't create swap files
set noswapfile

set guifont=Ubuntu\ Mono\ 12
