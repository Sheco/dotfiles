
let g:airline_powerline_fonts = 1
let mapleader = ',' 
set guifont=Consolas:h11

" my favorite tabs are 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab

set hidden

" Setup: add colors/atom-dark.vim
colorscheme atom-dark-256

" Setup: add autoload/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
call plug#end()


" splits
set splitbelow
set splitright


nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <C-B> :CtrlPBuffer<cr>

"--- autocommands
augroup autosourcing
	autocmd!
	autocmd BufWritePost vimrc source %
augroup END
