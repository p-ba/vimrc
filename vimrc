" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimenter * pluginstall --sync | source $myvimrc
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'preservim/nerdtree'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"Linting
Plug 'dense-analysis/ale'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'

Plug 'vim-test/vim-test'
call plug#end()

let g:netrw_list_hide='.git,.DS_Store,.idea,.vscode'

syntax enable
set lazyredraw
set updatetime=300
filetype plugin on
set clipboard+=unnamed
set path+=**
set wildmenu
set mouse=a
set autoread
set showcmd
set number
set shortmess+=c

set backupdir=~/.vim/.tmp/backup//
set directory=~/.vim/.tmp/swap//
set undodir=~/.vim/.tmp/undo//

if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif

let base16colorspace=256  "Access colors present in 256 colorspace
" set background=light
colorscheme PaperColor

" OS X backspace
set backspace=indent,eol,start

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

nnoremap <C-n> :NERDTreeFind<CR>
nmap <ESC> :noh<CR>

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>r :BTags<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>w :TestNearest<CR>
nnoremap <Leader>d :TestLast<CR>


noreabbrev <expr> ts getcmdtype() == ":" && getcmdline() == 'ts' ? 'FZFTselect' : 'ts'

:nmap <Leader>c :let @+ = expand("%")<cr>

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Fixing
let g:ale_fixers = {'javascript': ['eslint'], 'php': ['php_cs_fixer']}
let g:ale_linters = {'javascript': ['eslint'], 'php': ['phpstan']}
let g:ale_fix_on_save = 1


if !empty(glob('~/.vim/local.vim'))
   source ~/.vim/local.vim
endif

