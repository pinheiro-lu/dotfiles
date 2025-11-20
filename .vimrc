" ==============================
" ICPC-READY VIM CONFIGURATION
" ==============================

" Show line numbers
set number
set relativenumber

" Tabs and indentation
set tabstop=4
set shiftwidth=4
set smartindent

" Mouse support
set mouse=a

" Search settings
set incsearch

" Enable matching pairs for <>
set mps+=<:>

" Show column limit
set colorcolumn=80

" Split navigation with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

syntax on
set undofile
set undodir=~/.vim/undodir
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif

nnoremap j gj
nnoremap k gk
