"
" PLUGIN START
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Better highlighting and indentation for Haskell
Plug 'neovimhaskell/haskell-vim'

" Colors
Plug 'ayu-theme/ayu-vim'

call plug#end()

"
" PLUGIN STOP
"

"
" Colors
"

" Make colors not look like crap
set termguicolors

" ayu
let ayucolor='dark'

" Set the chosen color scheme (any configuration of comes before this)
colorscheme ayu

"
" General options
"

" Syntax highlighting
syntax on
filetype plugin indent on

" Relative line numbers
set number relativenumber
set numberwidth=5

" Specify a color for the line numbers.
highlight LineNr ctermfg=Grey guifg=Grey

" Color in the column at the specified width.
set colorcolumn=80

" Show certain whitespace as characters.
set list listchars=tab:\›\ ,trail:·,extends:>,precedes:<

function TrimWhiteSpace()
  %s/\(^--\)\@<!\s*$//
  ''
endfunction

" Tab/space insertion. By default, insert 4 spaces instead of a TAB character.
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Turn off automatic formatting, except for removal of comment leaders when
" appropriate.
set formatoptions=jqm

" Use smartcase search by default (case-sensitive if pattern contains
" upper-case letters, case-insensitive otherwise. Include the '\C' escape
" sequence anywhere in the pattern to override and use case-sensitive search.
" Note that smartcase only activates if ignorecase is already active.
set ignorecase
set smartcase

"
" Language-specific options
"

"
" Bindings
"

" Remap leader key to space.
nnoremap <space> <Nop>
let mapleader = ' '

" Reload this init.vim file.
nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<cr>

" Bind Escape to clear current highlighting
nnoremap <silent> <esc> :noh<CR>

