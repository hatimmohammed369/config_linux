let g:python_recommended_style=0
source ~/.vim/bundle/cscope_maps.vim
set timeoutlen=1000
set ttimeoutlen=0
nnoremap <C-C> :.t.<CR>k:.t.<CR>
set termguicolors
nnoremap <C-S> :w<CR>
set bg=light
nnoremap <HOME> gg0
nnoremap <C-HOME> 0
nnoremap <END> G$
nnoremap <C-END> $

inoremap <HOME> gg0
inoremap <C-HOME> 0
inoremap <END> G$
inoremap <C-END> $

nnoremap <S-CR> ggO
nnoremap <C-CR> Go
nnoremap <F5> :w<CR>:!clear<CR>:!python3 %<CR>
inoremap <F5> <ESC>:w<CR>:!clear<CR>:!python3 %<CR>

set backspace=indent,eol,start
set clipboard+=unnamedplus
set clipboard=unnamed,unnamedplus

set nocompatible
set nu
set relativenumber
syntax on

set autoindent
set smartindent
set fileformat=unix

set wildmenu
set incsearch
set nohlsearch

set showcmd
set showmode
set autoread
set spell
highlight CursorLine guibg=lightblue ctermbg=lightblue
highlight Cursor guifg=white guibg=black

set laststatus=2
set ruler
set cursorline

set errorbells
set visualbell

set swapfile
set directory=$HOME/.vim/swaps//

set backup
set writebackup
set backupdir=~/.vim/backups//

set undofile
set undodir=~/.vim/undos//
"
" Vundle setup
set rtp+=/home/hatim/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin 'psf/black', {'branch': 'stable'}
" Plugin 'puremourning/vimspector'
" Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'ayu-theme/ayu-vim'
" Plugin 'ray-x/aurora'
" Plugin 'rafalbromirski/vim-aurora'
" Plugin 'joshdick/onedark.vim'
" Plugin 'sonph/onehalf', {'rtp': 'vim/'}
" Plugin 'srcery-colors/srcery-vim'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/tagbar'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'scrooloose/nerdtree'
" Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
"
call vundle#end()
filetype plugin indent on
" Vundle setup done!

call plug#begin('~/.vim/plugged')
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

colorscheme gruvbox
let python_hightlight_all=1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

nnoremap <silent> <F8> :TagbarToggle<CR>

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set cindent

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
" packadd! vimspector
" let g:vimspector_enable_mappings = 'HUMAN'
let g:python3_host_prog='/usr/local/bin/python3.10'
" nnoremap <C-S-F10> <Plug>VimspectorStepOver

" " Format on save
" autocmd BufWritePre *.py execute ':Black'

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre * :%s/\s\+$//e
