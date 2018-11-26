let mapleader = ',' 
set guifont=Consolas:h11

" my favorite tabs are 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" javascript standard calls for 2 space indentation levels
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" avoid wordwrapping and show a vertical line at column 72
" so you start thinking about cutting the lines
set nowrap
set colorcolumn=72

" hidden buffers, you can switch between files and the changes don't
" have to be written to disk until you're ready to save everything
" you want to use :wa for that
set hidden

set termguicolors

" splits
set splitbelow
set splitright

" the default updatetime of 4000 is too long for some tools
" like gitgutter
set updatetime=400
" hide dotfiles in the netrw explorer
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" the standard linter works fine, remember to npm i -g standard
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:ale_completion_enabled = 0

let g:flow#enable = 0

" Install Vim Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fsLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Setup: add autoload/plug.vim
call plug#begin('~/.vim/plugged')
" tpope's vinegar improves the vim file manager
" the most common shortcut is - you can use it to jump back
" to the current file's directory and then parent directories
Plug 'tpope/vim-vinegar'

" tpope's sensible introduces simple defaults
Plug 'tpope/vim-sensible'

" tpope's eunuch introduces handy commands, for example:
" :SudoWrite when you edited a file as a regular user and want to write to it
Plug 'tpope/vim-eunuch'

" tpope's surround, very handy to change blocks of text, please read
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" tpope's fugitive makes it easy to work with git repositories
" :Gwrite is git add %
" :Gread is git checkout % (revert changes)
" :Gblame shows the git blame
" :Gstatus is git status
"   you can press - to stage/unstage a file
"   you can press p to stage/unstage (patch) a file
" :Gcommit opens a buffer to write the commit message
" all this is handy, but sometimes I prefer to use "tig"
Plug 'tpope/vim-fugitive'

" ctrlp introduces a fuzzy file finder when pressing Control+P
" it also has a handy buffer manager, which I bound to Control+B (down below)
Plug 'ctrlpvim/ctrlp.vim'

" vim-signature adds a new column on the left side with marks for each lie
" for example, in this line, in command mode:
" ma toggle Mark "a"
" dma remove mark "a"
" 'a to jump to mark "a"
" m- to remove the current line's marks
" more info at https://github.com/kshenoy/vim-signature
Plug 'kshenoy/vim-signature'

" vim-airline
Plug 'vim-airline/vim-airline'

" Easy HTML prefilling with css-like syntax
" For example: 
" html:5<C-y>, will type an empty html doc
" div>ul#xx>li.yy*5>a<C-y>, will type <div id="xx"><ul><li class="yy"><a...>
Plug 'mattn/emmet-vim'

" Great asynchronous linter, it works as you type
Plug 'w0rp/ale', {'do': 'npm install -g standard'}

Plug 'flowtype/vim-flow', {'do': 'npm install -g flow-bin'}
Plug 'ajh17/VimCompletesMe'

Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'

" better terminal integration, it improves text pasting and mouse support
Plug 'wincent/terminus'

Plug 'airblade/vim-gitgutter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mustache/vim-mustache-handlebars'
call plug#end()

" In my environment, Shift-arrows are reserved to switch between
" tmux tabs, so shift-h and shift-l are then used to switch between 
" vim buffers
nmap <S-H> :bp<cr>
nmap <S-L> :bn<cr>

" ,, will jump to the previous window
nmap <Leader>, <C-W><C-W>

" Control-B will load ControlP's buffer switcher
" Control-B and then enter will swith to the last buffer
nmap <C-B> :CtrlPBuffer<cr>

"--- autocommands
augroup autosourcing
	autocmd!
	autocmd BufWritePost vimrc source %
augroup END

" I like dark color schemes
set background=dark
try
    colorscheme nova
catch
endtry

