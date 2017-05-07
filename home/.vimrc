set termguicolors

scriptencoding utf-8

"Disable arrow keys to navigate
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"Create shortcuts for tab commands
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap te :tabedit<Space>
nnoremap tg :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap tq :tabclose<CR>
nnoremap tn :tabnew<CR>

"Pressing enter in normal mode behaves like it would in insert mode
nnoremap <silent> <CR> i<CR><ESC>

"Use same clipboard as system
set clipboard=unnamedplus

"Improved block indentation
vnoremap < <gv
vnoremap > >gv

filetype plugin indent on
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set numberwidth=2
set ruler
set shell=/bin/bash

" disable extraneous redraws
set lazyredraw

" set shortcut key
let mapleader=","

set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>


" Strip trailing whitespace (,ss)
fun! StripTrailingWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
noremap <leader>ss :call StripTrailingWhitespace()<CR>

"Highlight trailing whitespace yellow
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=yellow
highlight TrailingWhitespace ctermbg=yellow
match TrailingWhitespace /\s\+$/

"Set tab to 2 spaces in filetypes...
autocmd Filetype lisp setlocal tabstop=2 softtabstop=2 shiftwidth=2

"Set all scss & less files to have css syntax
au BufRead,BufNewFile *.less setfiletype css
au BufRead,BufNewFile *.scss setfiletype css

"Set theme to gruvbox dark mode
set background=dark
colorscheme gruvbox

