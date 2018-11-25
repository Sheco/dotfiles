let mapleader = ',' 
set guifont=Consolas:h11

" my favorite tabs are 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" javascript standard call for 2 space indentation levels
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
set nowrap
set colorcolumn=72

set hidden

colorscheme PaperColor
set background=dark

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Setup: add autoload/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kshenoy/vim-signature'
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
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
