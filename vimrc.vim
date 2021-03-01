augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
execute pathogen#infect()
execute pathogen#helptags()
set nocompatible
syntax on
filetype on
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

Bundle 'hashivim/vim-terraform'
Bundle 'godlygeek/tabular'

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'isruslan/vim-es6'
Plug 'pangloss/vim-javascript'
call plug#end()

let g:go_info_mode = 'gocode'
let g:terraform_align=1
filetype plugin indent on
set t_Co=256
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent
set number
set cursorline!
set cursorcolumn
set colorcolumn=80
set hlsearch
set noswapfile
set ttyfast
set lazyredraw
set backspace=indent,eol,start
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
colorscheme molokai
highlight Comment ctermfg=Gray

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
