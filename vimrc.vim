call plug#begin()
  Plug 'joshdick/onedark.vim'
  Plug 'fatih/vim-go'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-surround'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'tpope/vim-endwise'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'hashivim/vim-terraform'
  Plug 'sheerun/vim-polyglot'
call plug#end()

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
let g:go_info_mode='gocode'
let g:terraform_align=1
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:javascript_plugin_jsdoc = 1
let g:rg_derive_root='true'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
\ 'enter': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit'}
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
set regexpengine=1
colorscheme onedark
highlight Comment ctermfg=Gray

nnoremap <C-F> :Rg<CR>
nnoremap <C-P> :Files<CR>
command! -bang -nargs=0 Rgw
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1,
  \   fzf#vim#with_preview(), <bang>0)
