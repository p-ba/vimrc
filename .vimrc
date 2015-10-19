let mapleader="," "Changes Leader key into a comma instead of a backslash
set nocompatible "be iMproved
set laststatus=2
set encoding=utf-8
filetype off "required!

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'php.vim'
Plugin 'L9'
Plugin 'twilight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
"Plugin 'FuzzyFinder'
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
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Lokaltog/vim-powerline'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'SirVer/ultisnips'
Plugin 'jsx/jsx.vim.git'
Plugin 'evidens/vim-twig'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'fatih/vim-go'

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
let g:syntastic_js_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpmd_args='codesize, controversial, design, naming, unusedcode'
let g:syntastic_php_phpcs_args='--extensions=php --standard=PSR2'

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>p :CtrlP<Cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

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
"nmap ,f :FufBufferTag<CR>
"nmap ,p :FufCoverageFile<CR>
"nmap ,t :FufTag<CR>

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
nnoremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

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
