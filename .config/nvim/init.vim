"
" PLUGIN START
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'

" Language-specific
Plug 'pangloss/vim-javascript'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Colors
Plug 'EdenEast/nightfox.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'dracula/vim', { 'name': 'dracula' }

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
let ayucolor='mirage'

" nightfly
let g:nightflyCursorColor = 1
let g:nightflyItalics = 0
let g:nightflyUnderlineMatchParen = 1

" semshi
let g:semshi#simplify_markup = v:false
let g:semshi#error_sign_delay = 2
let g:semshi#update_delay_factor = 0.0001

" vim-javascript
let g:javascript_plugin_jsdoc = 1


" Set the chosen color scheme (any configuration of comes before this).
" Use a simpler color scheme with termguicolors OFF if using without a GUI
" (over putty for example).
colorscheme duskfox

"
" General options
"

" Turn on mouse
set mouse=a

" Open new vertical splits on the right instead of the left
set splitright

" Incremental highlight for commands
set inccommand=split

" Syntax highlighting
syntax on
filetype plugin indent on

" Highlight current line
set cursorline
hi CursorLine cterm=none ctermbg=238

" Width of gutter
set numberwidth=5

" Automatically set absolute numbers on unfocused buffers.
" From https://jeffkreeftmeijer.com/vim-number/
augroup autonumberstyle
    autocmd!
    autocmd BufEnter,FocusGained,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Specify a color for the line numbers.
highlight LineNr ctermfg=Grey guifg=Grey

" Color in the column at the specified width.
set colorcolumn=80,100
highlight ColorColumn ctermbg=238

" Display tabs and trailing whitespace.
set list listchars=tab:\›\ ,trail:·,extends:>,precedes:<

" Function for trimming trailing whitespace.
function TrimWhitespace()
  %s/\(^--\)\@<!\s*$//g
  ''
endfunction
" Bound to a key combination instead of a command, since that seems to mess up
" the undo history:
" autocmd BufWritePre * if !&binary | call TrimWhitespace() | endif

" Tab/space insertion. By default, insert 4 spaces instead of a TAB character.
set softtabstop=0  " Don't do fancy conversion from spaces -> tab
set expandtab      " Use spaces instead of tabs
set shiftwidth=4   " How many spaces should be inserted when pressing tab
set smarttab

" Turn off automatic formatting, except for removal of comment leaders when
" appropriate. Do this for all languages by default.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=j formatoptions+=q

" Use smartcase search by default (case-sensitive if pattern contains
" upper-case letters, case-insensitive otherwise.  Include the '\C' escape
" sequence anywhere in the pattern to override and use case-sensitive search.
" Note that smartcase only activates if ignorecase is already active.
set ignorecase
set smartcase

"
" Language-specific options
"

" Indent by 2 in vue
autocmd Filetype vue setlocal shiftwidth=2

" Indent by 2 in HTML files
autocmd Filetype html setlocal shiftwidth=2

"
" Bindings
"

" Remap leader key to space.
nnoremap <space> <Nop>
let mapleader = ' '

" Use primary clipboard for stuff
noremap <Leader>y "+y
noremap <Leader>p "+p

" Switching between windows
nnoremap <A-l> <C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-k> <C-w>k
nnoremap <A-j> <C-w>j

" Reload this init.vim file.
" nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<CR>

" Remember the last used position.
autocmd BufReadPost *
    \ if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif

" Bind Escape to clear current highlighting
nnoremap <silent> <esc> :noh<CR>

" Binding for trimming trailing whitespace.
nnoremap <silent> <Leader>w :call TrimWhitespace()<CR>

" Toggle between relative and absolute number lines; useful when sharing screen.
" `number` is always set, the function then toggles between 'hybrid' and
" absolute line numbers
set number relativenumber
function! ToggleNumberStyle()
    if (&relativenumber == 0)
        set relativenumber
    else
        set norelativenumber
    endif
endfunction
nnoremap <silent> <C-l> :call ToggleNumberStyle()<CR>

"
" Plugin-dependent
"

" neoterm
let g:neoterm_default_mod = 'botright'

let g:vim_vue_plugin_config = {
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}

" Set lightline configuration
let g:lightline = {
      \ 'colorscheme': 'nightfox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified'] ]
      \ },
      \ }
" don't show duplicate -- INSERT -- text (lightline covers this)
set noshowmode

" Toggle NERDTree panel
nnoremap <C-n> :NERDTreeToggle<CR>

" Run fzf
nnoremap <C-p> :FZF<CR>

" Open tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" Open tab to the left/right
nnoremap <leader>h gT
nnoremap <leader>l gt

" Open last active tab
" https://superuser.com/a/675119
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader>k :exe "tabn ".g:lasttab<cr>
