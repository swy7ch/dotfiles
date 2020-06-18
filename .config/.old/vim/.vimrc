" Swy7ch' config file for vim

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""

"Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Necessary to do cool stuff
set nocompatible

"Pluggins will be downloaded under the specified directory
call plug#begin('~/.vim/plugins')

""""""""""""""""""""""""""""""""""""""""""""""""""

" List of plugins :


" Custom status bar
Plug 'itchyny/lightline.vim'

" Language hilighting packages
Plug 'sheerun/vim-polyglot'

" Shows indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

" All Plugins must be added before the following line
call plug#end()

" Brief help
" :PlugInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PlugUpdate		- updates plugins
" :PlugUpgrade		- upgrades vim-plug
" :PlugClean		- confirms removal of unused plugins; append `!` to auto-approve removal
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"						 "
"		Non-plugin stuff :		 "
"						 "
""""""""""""""""""""""""""""""""""""""""""""""""""
"-> General
""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines VIM has to remember
set history=500

" Set vim update time (milliseconds)
set updatetime=250

" Detect plugins filetypes
filetype plugin on

" To recognize groff filetype
au BufNewFile,BufRead *.mom set filetype=groff

" Defining the <leader>
let mapleader = " "

" Remove the pause when leaving insert mode
set ttimeoutlen=10

" Autocomplete settings
set wildmode=longest,list,full

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VIM User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets the font
set guifont=FuraCode\ Nerd\ Font\ Mono\ 12

" Shows the current position
set ruler

" Shows line numbers
set number

" Shows line numbers relative to the cursor
set relativenumber

" A buffer becomes hidden when abandonned
set hid

" Highlights search results
set hlsearch

" Searches before hitting ENTER
set incsearch

" Shows matching brackets when cursor is over them
set showmatch

" Shows the command that's being typed
set showcmd

" Splits to the right
set splitright

" Shows the current line
set cursorline

" Prevents nvim from being customized by text files commands
set nomodeline

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Colors and font
""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI colors
syntax enable

" Set utf8 as standard encoding
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Text, tab and indent related stuff
""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not use spaces instead of tabs
set noexpandtab

" But be smart with tabs
set smarttab

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4 "for indent operations

" Indent and wrap rules
set si "smart indent
set wrap "wrap lines

" Stops the auto-commenting new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable autocompletion
set wildmode=longest,list,full

" Automatically removes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Plugins stuff
""""""""""""""""""""""""""""""""""""""""""""""""""

" Correct colors with dark background
set background=dark

" Gruvbox setup
let g:gruvbox_contrast_dark='hard'

" Colorscheme
colorscheme gruvbox

" Airline already shows the mode -> get rid of vim's default
set noshowmode

" Lightline customization
let g:lightline = {
			\ 'colorscheme': 'gruvbox',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\ },
			\ }

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Macros
""""""""""""""""""""""""""""""""""""""""""""""""""
" Source files
noremap <leader>s :source ~/.vimrc <CR>
noremap <leader>r :source %<CR>

" Reset the search buffer
noremap <leader>h :let @/ = ""<CR>

" Plugin management
noremap <leader>i :PlugInstall
noremap <leader>c :PlugClean
noremap <leader>u :PlugUpdate \| PlugUpgrade

" Make use of xclipboard
inoremap <C-v> <Esc>"+pA
vnoremap <C-c> "+y
