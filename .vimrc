let mapleader=" " "Changes Leader key into a space instead of a backslash
set nocompatible "be iMproved
set laststatus=2
set encoding=utf-8
filetype off "required!

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'dbeecham/ctrlp-commandpalette.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'sumpygump/php-documentor-vim'
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'rking/ag.vim'
Plugin 'joonty/vdebug.git'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-expand-region'
Plugin 'sheerun/vim-polyglot' " Language syntax support

call vundle#end()            " required
filetype plugin indent on    " required

:set tags=./tags;
:set mouse=a

set rtp+=~/.fzf

map <C-n> :NERDTreeToggle<CR>

" .editorconfig Fugitive compability
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Php doc generator
au BufRead,BufNewFile *.php inoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

" Php namespace autoimport
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

" Syntastic
let g:syntastic_js_checkers = ['jshint', 'eslint']
let g:syntastic_jsx_checkers = ['jshint', 'eslint']
let g:syntastic_es6_checkers = ['jshint', 'eslint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpmd_args='codesize, controversial, design, naming, unusedcode'
let g:syntastic_php_phpcs_args='--extensions=php --standard=PSR2'

" Airline
let g:airline#extensions#tabline#enabled = 1

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>p :CtrlP<Cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <leader>t :CtrlPCommandPalette<cr>

" Indentaion
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
syntax on

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

set wildchar=<Tab> wildmenu wildmode=full

set t_Co=256

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Visual options
try
    colorscheme lucius
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

set background=dark
set number
set guioptions=egmt "remove toolbar, scrollbars
" Ignore following files when completing file/directory names
" Version control
set wildignore+=.hg,.git,.svn
" Python byte code
set wildignore+=*.pyc
" Binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" PhpDocumentator
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

" Searching
set incsearch "Search while typing
set ignorecase "Case Insensitive Searching
set smartcase "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch "Highlight all search results
" clear text hightlighted by seach
nnoremap <leader>b :nohlsearch<CR>

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
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"------ Moving Between Windows ------
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" Ctrl+s
map <Leader>s :w<CR>

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

set guifont=Source\ Code\ Pro\ Medium\ 12

