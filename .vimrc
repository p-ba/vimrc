let mapleader=","

set nocompatible
set laststatus=2
set encoding=utf-8
" Rely on gutentags instead
"set tags=./tags;
set mouse=a
set clipboard=unnamedplus
set rtp+=~/.fzf
set background=light
set termguicolors
set t_Co=256
set number
set relativenumber
set guioptions=egmt "remove toolbar, scrollbars
" ignore following files when completing file/directory names
" version control
set wildignore+=.hg,.git,.svn
" python byte code
set wildignore+=*.pyc
" binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
" searching
set incsearch "search while typing
set ignorecase "case insensitive searching
set smartcase "lowercase = case insensitive, any uppercase = case sensitive
set hlsearch "highlight all search results
" clear text hightlighted by seach
nnoremap <leader>b :nohlsearch<cr>

" don't create backups
set nobackup
" don't create swap files
set noswapfile

" indentaion
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
filetype plugin indent on
set wildchar=<tab> wildmenu wildmode=full
autocmd filetype ruby setlocal ts=2 sw=2 expandtab
autocmd filetype javascript set omnifunc=javascriptcomplete#completejs

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimenter * pluginstall --sync | source $myvimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
" .editorconfig Fugitive compability
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
Plug 'joonty/vdebug'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
if has('nvim')
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    autocmd bufenter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
    Plug 'phpactor/ncm2-phpactor'
    Plug 'phpactor/phpactor', {'do': 'composer install'}
    autocmd filetype php setlocal omnifunc=phpactor#Complete
    " Include use statement
    nmap <Leader>u :call phpactor#UseAdd()<CR>
    " Invoke the context menu
    nmap <Leader>mm :call phpactor#ContextMenu()<CR>
    " Goto definition of class or class member under the cursor
    nmap <Leader>o :call phpactor#GotoDefinition()<CR>
    " Transform the classes in the current file
    nmap <Leader>tt :call phpactor#Transform()<CR>
    " Generate a new class (replacing the current file)
    nmap <Leader>cc :call phpactor#ClassNew()<CR>
endif
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'osyo-manga/vim-over'
Plug 'vim-scripts/vim-auto-save'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'ludovicchabant/vim-gutentags'

" Project-wide search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-P> :FZF<CR>
nnoremap <C-F> :Rg<CR>
vnoremap <C-F> y:<C-r>"<C-b>Rg <C-e><CR>
Plug 'jesseleite/vim-agriculture'
nmap <Leader>/ <Plug>AgRawWordUnderCursor
vmap <Leader>/ <Plug>AgRawVisualSelection
Plug 'zackhsi/fzf-tags'
nmap <C-]> <Plug>(fzf_tags)

" History of edits
if has('persistent_undo')
    Plug 'mbbill/undotree'
    set undodir=~/.vim/.undodir
    set undofile
endif

call plug#end()


let g:gutentags_cache_dir = '~/.vim/.gutentags'
let g:gutentags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*node_modules*', '*var/cache*', '*var/log*']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Php namespace autoimport
" inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
" noremap <Leader>u :call PhpInsertUse()<CR>
" inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
" noremap <Leader>e :call PhpExpandClass()<CR>

" Syntastic
let g:syntastic_js_checkers = ['jshint', 'eslint']
let g:syntastic_jsx_checkers = ['jshint', 'eslint']
let g:syntastic_es6_checkers = ['jshint', 'eslint']
let g:syntastic_php_checkers = ['php']
let g:syntastic_php_phpmd_args='codesize, controversial, design, naming, unusedcode'
let g:syntastic_php_phpcs_args='--extensions=php --standard=PSR2'

let g:ale_linters = {
\   'php': ['php', 'phpcs'],
\   'python': ['flake8']
\}

let g:ale_fixers = {
\   'php': ['php-cs-fixer'],
\   'python': ['yapf']
\}

colorscheme lucius

" Airline
let g:airline#extensions#tabline#enabled = 1

" Visual options

" PhpDocumentator
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

" Buffers
" Ctrl Left & Right move between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nnoremap <silent> <Leader>q :bd<CR>

" Autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" {<CR>
" auto complete {} indent and position the cursor in the middle line
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O
