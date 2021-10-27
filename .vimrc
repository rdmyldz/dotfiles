set background=dark 	   " necessary for tmux color consistency
set t_Co=256 		   " necessary for tmux color consistency

let mapleader = " "

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


syntax enable
colorscheme desert         " Change a colorscheme.
syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set encoding=utf-8         " Change how vim represents characters on the screen
set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.
set backspace=2            " Fix backspace behavior on most terminals.
set number
set relativenumber
set smartcase
set ignorecase
set splitbelow
set splitright
set wildmenu               " Enable enhanced tab autocomplete.
set wildmode=list:longest,full " Complete till longest string, then open the wildmenu.
set incsearch
set ruler
set visualbell
set laststatus=2
set nocompatible
set showmatch
set mouse=ni
set autoread
set scrolloff=6
set completeopt=menu,popup,noselect,noinsert " autocompletion preview instead of scratch

nnoremap <leader>w :update<CR>     " saving file
nnoremap <silent> <leader>l :nohlsearch<CR><C-L>

" easymotion config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" put backup and swap files in a fixed directory to keep things more organized
set undofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Plugins
call plug#begin('~/.vim/plugged')
   Plug 'easymotion/vim-easymotion' 
   Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
   Plug 'tpope/vim-commentary'
   Plug 'tpope/vim-surround'
call plug#end()

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1
         
let g:go_code_completion_icase = 1 " necessary for case insensitive completion
au filetype go inoremap <buffer> . .<C-x><C-o>

" close automatically
inoremap ( ()<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap { {<Cr>}<Esc>O
inoremap [ []<Esc>i
inoremap ` ``<Esc>i


