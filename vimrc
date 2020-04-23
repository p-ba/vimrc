" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimenter * pluginstall --sync | source $myvimrc
endif

call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
call plug#end()

syntax enable
filetype plugin on
set clipboard+=unnamed
set path+=**
set wildmenu
set relativenumber
set mouse=a
set autoread
set showcmd

set backupdir=~/.vim/.tmp/backup//
set directory=~/.vim/.tmp/swap//
set undodir=~/.vim/.tmp/undo//

" bell
set noerrorbells
set visualbell
set t_vb=

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Show matching bracets
set showmatch

" Change Netrw tree mode
let g:netrw_liststyle=3
let g:netrw_banner=0

" Indent
set tabstop=4
set shiftwidth=4
set ai
set si

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
