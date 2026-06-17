" --- 1. General Settings ---
set ttyfast
set lazyredraw
set nocompatible
set hidden
set mouse=a
filetype plugin indent on
set autoindent
set smartindent
syntax on

set background=light
colorscheme delek
set showtabline=2

set number
highlight LineNr guifg=#808080 ctermfg=244

set expandtab
set tabstop=4
set shiftwidth=4

set colorcolumn=80
highlight ColorColumn guibg=#808080 ctermbg=244 

" --- 2. Plugins ---
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" --- 3. Opening Settings ---
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_theme='deus'
let g:airline#extensions#tabline#formatter='default'
let g:airline_powerline_fonts=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" --- 4. Key Mappings ---
let mapleader = " "
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>o :bd!<CR>
nmap <leader>/ gcc
xmap <leader>/ gc
nnoremap <leader>f :Files<CR>
