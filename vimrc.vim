augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
set nocompatible               " be iMproved
filetype on                   " required!
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-powerline'
" Powerline: cool status lines
if has("gui_running") && has("gui_macvim")
  let g:Powerline_symbols='fancy'
endif

let g:Powerline_colorscheme='solarized256'
" lighter colors: let g:Powerline_colorscheme='solarized'
" To reload: :PowerlineReloadColorscheme

let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1

Bundle 'tpope/vim-fugitive'
" Fugitive: Git client
" :Gcd
" :Gstatus
" :G...
"
Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
autocmd QuickFixCmdPost *grep* cwindow " Open Ggrep in quickfix window
map ,gc :Gcommit<Cr>
map ,gs :Gstatus<Cr>
filetype plugin indent on
set t_Co=256
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent
set number
set cursorline
set cursorcolumn
set colorcolumn=80
set hlsearch
set noswapfile
colorscheme molokai
execute pathogen#infect()
