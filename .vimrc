let mapleader="," "Changes Leader key into a comma instead of a backslash

set nocompatible "be iMproved
set laststatus=2
set encoding=utf-8

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
" Plug 'sumpygump/php-documentor-vim'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'joonty/vdebug'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-expand-region'
Plug 'sheerun/vim-polyglot' " Language syntax support
Plug 'majutsushi/tagbar'
if has('nvim')
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
    Plug 'phpactor/ncm2-phpactor'
    Plug 'phpactor/phpactor', {'do': 'composer install'}
endif
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'osyo-manga/vim-over'
" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'vim-scripts/vim-auto-save'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
"Plug 'mbbill/undotree'
Plug 'vim-scripts/php-annotations-syntax'
" if has('persistent_undo')
"    set undodir=~/.vim/.undodir
"    set undofile
" endif


call plug#end()

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
" au BufRead,BufNewFile *.php inoremap <buffer> <C-P> :call PhpDoc()<CR>
" au BufRead,BufNewFile *.php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
" au BufRead,BufNewFile *.php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

" Php namespace autoimport
" inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
" noremap <Leader>u :call PhpInsertUse()<CR>
" inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
" noremap <Leader>e :call PhpExpandClass()<CR>
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


" Syntastic
let g:syntastic_js_checkers = ['jshint', 'eslint']
let g:syntastic_jsx_checkers = ['jshint', 'eslint']
let g:syntastic_es6_checkers = ['jshint', 'eslint']
let g:syntastic_php_checkers = ['php']
let g:syntastic_php_phpmd_args='codesize, controversial, design, naming, unusedcode'
let g:syntastic_php_phpcs_args='--extensions=php --standard=PSR2'


let g:ale_linters = {
\   'php': ['php', 'phpstan', 'phpcs'],
\   'python': ['flake8']
\}

let g:ale_fixers = {
\   'php': ['php-cs-fixer'],
\   'python': ['yapf']
\}

" Airline
let g:airline#extensions#tabline#enabled = 1

" FZF
nnoremap <C-P> :FZF<CR>
nnoremap <C-F> :Rg<CR>
vnoremap <C-F> y:<C-r>"<C-b>Rg <C-e><CR>
nnoremap <C-E> :Command<CR>

" Indentaion
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
syntax on

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

set wildchar=<Tab> wildmenu wildmode=full


autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpactor#Complete

" Visual options
try
    colorscheme solarized8_low
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry
set background=light
set termguicolors
set t_Co=256

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

" Autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" Copy/paste options
if has("virtualedit")
  let paste#paste_cmd = {'n': ":call Paste()<CR>"}
  let paste#paste_cmd['v'] = '"-c<Esc>' . paste#paste_cmd['n']
  let paste#paste_cmd['i'] = 'x<BS><Esc>' . paste#paste_cmd['n'] . 'gi'

  func! Paste()
    let ove = &ve
    set ve=all
    normal! `^
    if @+ != ''
      normal! "+gP
    endif
    let c = col(".")
    normal! i
    if col(".") < c " compensate for i<ESC> moving the cursor left
      normal! l
    endif
    let &ve = ove
  endfunc
else
  let paste#paste_cmd = {'n': "\"=@+.'xy'<CR>gPFx\"_2x"}
  let paste#paste_cmd['v'] = '"-c<Esc>gix<Esc>' . paste#paste_cmd['n'] . '"_x'
  let paste#paste_cmd['i'] = 'x<Esc>' . paste#paste_cmd['n'] . '"_s'
endi

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

"------ Moving Between Windows ------
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

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

