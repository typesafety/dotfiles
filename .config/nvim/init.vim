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
Plug 'hachy/eva01.vim'

call plug#end()

"
" PLUGIN STOP
"

"
" Colors
"

" Make colors not look like crap
set termguicolors
set background=dark

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

function TrimWhitespace()
  %s/\(^--\)\@<!\s*$//
  ''
endfunction

autocmd BufWritePre * call TrimWhitespace()

" Tab/space insertion. By default, insert 4 spaces instead of a TAB character.
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Turn off automatic formatting, except for removal of comment leaders when
" appropriate. Do this for all languages
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=j formatoptions+=q

" Use smartcase search by default (case-sensitive if pattern contains
" upper-case letters, case-insensitive otherwise. Include the '\C' escape
" sequence anywhere in the pattern to override and use case-sensitive search.
" Note that smartcase only activates if ignorecase is already active.
set ignorecase
set smartcase

" Expand path of the file being edited.
set statusline+=%F

"
" Language-specific options
"

" Haskell

" Settings for configuring the haskell-vim plugin:
" https://github.com/neovimhaskell/haskell-vim

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_disable_TH = 0            " to disable TH highlighting
let g:haskell_classic_highlighting = 0  " for more traditional highlighting
let g:haskell_indent_disable = 0        " to disable haskell-vim's indenting

" Indent case-expressions consistently, i.e. not dependent on the horizonatl
" positioning of the case keyword.
let g:haskell_indent_case_alternative = 1

" Indentation sizes
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 4
let g:haskell_indent_after_bare_where = 4
let g:haskell_indent_do = 4
let g:haskell_indent_in = 4
let g:haskell_indent_guard = 4

let g:cabal_indent_section = 2

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

