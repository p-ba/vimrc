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
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug '907th/vim-auto-save'

"LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"LSP-neovim
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'steelsojka/completion-buffers'

"Linting
Plug 'dense-analysis/ale'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'

Plug 'vim-test/vim-test'
call plug#end()

let g:netrw_list_hide='.git,.DS_Store,.idea,.vscode'

let g:auto_save = 1

syntax enable
set redrawtime=5000
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
set background=light
colorscheme solarized8_low

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

" LSP
set completeopt=menuone,noinsert,noselect
autocmd FileType php set iskeyword+=$

nmap <silent> gd <Plug>(coc-definition)
nmap <f2> <Plug>(coc-rename)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-f> coc#refresh()

nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <Leader>s :w<CR>
nmap <Leader>q :q!<CR>

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>r :BTags<CR>
nnoremap <Leader>t :Tags<CR>

nmap <C-]> <Plug>(fzf_tags)
noreabbrev <expr> ts getcmdtype() == ":" && getcmdline() == 'ts' ? 'FZFTselect' : 'ts'

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Testing
let test#php#phpunit#executable = '/usr/local/bin/docker-compose run tests ./vendor/bin/phpunit'

" Fixing
let g:ale_fixers = {'javascript': ['eslint'], 'php': ['php_cs_fixer']}
let g:ale_linters = {'javascript': ['eslint'], 'php': ['phpstan']}
let g:ale_fix_on_save = 1

