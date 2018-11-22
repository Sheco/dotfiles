
let g:airline_powerline_fonts = 1
let mapleader = ',' 
set guifont=Consolas:h11

" my favorite tabs are 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab

set hidden

colorscheme PaperColor
set background=dark

" Setup: add autoload/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()


" splits
set splitbelow
set splitright

" Shift-arrows are reserved to switch between
" tmux tabs, so shift-h and shift-l are then
" used to switch between vim buffers
nmap <S-H> :bp<cr>
nmap <S-L> :bn<cr>

nmap <Leader>, <C-W><C-W>

nmap <C-B> :CtrlPBuffer<cr>

let g:airline#extensions#tabline#enabled = 1

"--- autocommands
augroup autosourcing
	autocmd!
	autocmd BufWritePost vimrc source %
augroup END
