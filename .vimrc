"enable numbers on left side of the screen
set number
set relativenumber

"tab size in number of spaces
set tabstop=4 
set shiftwidth=4

"navigating among splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"set autoindent
set smartindent

"enable search while typing
set incsearch

"map <C-L> to accept the word from copilot
imap <C-L> <Plug>(copilot-accept-word)

"enable matchpair for <>
set mps+=<:>

"enable mouse
set mouse=a

"Plugin manager
call plug#begin('~/.vim/plugged')
	"LaTeX Plugin
	Plug 'lervag/vimtex'
	"Tree of files
	Plug 'preservim/nerdtree'
	"Improve highlighting and indentation for javascript files
	"Plug 'pangloss/vim-javascript'
	Plug 'maxmellon/vim-jsx-pretty'
	"Improve highlighting and indentation for typescript files
	"Plug 'leafgarland/typescript-vim'
"End of plugin manager
call plug#end()

"VimTeX settings
let g:vimtex_view_method = 'zathura'

