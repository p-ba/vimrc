set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'php.vim'
Bundle 'L9'
Bundle 'twilight'
Bundle 'scrooloose/nerdtree'
"Bundle 'kien/ctrlp'
Bundle 'taglist.vim'
Bundle 'joonty/vdebug'
Bundle 'FuzzyFinder'
Bundle 'mattn/emmet-vim'

" set runtimepath^=~/.vim/bundle/ctrlp.vim

colorscheme twilight

filetype plugin indent on     " required!

:set tags=./tags;

map <C-n> :NERDTreeToggle<CR>
map <C-p> :FufCoverageFile<CR>
nnoremap <silent> <F8> :TlistToggle<CR>


set tabstop=4

set shiftwidth=4

set expandtab

let g:vdebug_options = {
\ "path_maps" : {"/var/www/site/": "/home/pavel/vm/vbox/site/"},
\ "server"    : "0.0.0.0"
\}

" let g:ctrlp_working_path_mode = 'ra'

set wildchar=<Tab> wildmenu wildmode=full

"Visual options
set number
set guioptions=egmt "remove toolbar, scrollbars
