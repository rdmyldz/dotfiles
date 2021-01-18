" use : so % to reload
" use : Ctrl-p and Ctrl-n for up/down in vi history

syntax enable
set nocompatible

set ttimeoutlen=100

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

set ruler
set number 		" turn on line umbers"
colorscheme integralist
set background=dark
set relativenumber
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set autoindent
set scrolloff=999
set noswapfile
set autowrite      " Automatically save before commands like :next and :make

" Flash screen instead of beep sound
set visualbell


" to see the file name
set laststatus=2

" easier to see characters when `set paste` is on
"set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨

" Highlight tailing whitespace
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:·,extends:⟩,precedes:⟨
set hlsearch
set incsearch
set smartcase
set ignorecase
set icon
" Clear search buffer
" :nnoremap § :nohlsearch<cr>
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
set viminfo='20,<1000,s1000

set hidden

filetype plugin indent on

" install vim-plug if not already installed
" (Yes I know about Vim 8 Plugins. They suck.)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  echo "Don't forget to GoInstallBinaries if you're doing Go dev."
endif

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin()
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'
  call plug#end()

  set cursorline

  " golang
  let g:go_fmt_fail_silently = 0 " let me out even with errors
  let g:go_fmt_command = 'goimports' " autoupdate import
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
  " Go syntax highlighting
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_operators = 1
  " Status line types/signatures
  let g:go_auto_type_info = 1
  "let g:go_gopls_analyses = { 'composites' : v:false }
  au filetype go inoremap <buffer> . .<C-x><C-o>
  au FileType go nmap <leader>t :GoTest!<CR>
  au FileType go nmap <leader>v :GoVet!<CR>
  au FileType go nmap <leader>b :GoBuild!<CR>
  " au FileType go nmap <leader>i :GoInstall!<CR>
  au FileType go nmap <leader>l :GoMetaLinter!<CR>

else
  autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif


map <C-n> :NERDTreeToggle<CR>

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
