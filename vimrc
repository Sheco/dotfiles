let mapleader = ',' 
set guifont=Consolas:h11

" my favorite tabs are 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" javascript standard call for 2 space indentation levels
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" avoid wordwrapping and show a vertical line at column 72
" so you start thinking about cutting the lines
set nowrap
set colorcolumn=72

" hidden buffers, you can switch between files and the changes don't
" have to be written to disk until you're ready to save everything
" you wan use :wa for that
set hidden

" I like dark color schemes
colorscheme PaperColor
set background=dark

" splits
set splitbelow
set splitright

" the default updatetime of 4000 is too long for some tools
" like gitgutter
set updatetime=400
" hide dotfiles in the netrw explorer
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:airline#extensions#tabline#enabled = 1

" the standard linter works fine, remember to npm i -g standard
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fixers = {'javascript': ['standard']}

let g:ale_completion_enabled = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Install Vim Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
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
Plug 'w0rp/ale'

" The next block of plugins are needed for deoplete, an autocompleter
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

Plug 'carlitux/deoplete-ternjs'

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
