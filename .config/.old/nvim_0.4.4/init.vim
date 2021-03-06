" Author        : swytch
" Created       : 06/05/2020
" License       : GPLv3
" Description   : My own personnal nvim configuration

"" Plugin stuff

" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoinstall Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug"
	silent !curl -fLo '~/.local/share/nvim/site/autoload/plug.vim' --create-dir \
	'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory
call plug#begin('$HOME/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""

" Language highlighting packages
Plug 'sheerun/vim-polyglot'

" Indentation guides
Plug 'nathanaelkane/vim-indent-guides'

" Colorscheme management
Plug 'lifepillar/vim-colortemplate'

" Neovim colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Templates
Plug 'tibabit/vim-templates'

" All Plugins must be added before the following line
call plug#end()

" Brief help
" :PlugInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PlugUpdate		- updates plugins
" :PlugUpgrade		- upgrades vim-plug
" :PlugClean		- confirms removal of unused plugins; append `!` to auto-approve removal

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1

"" General
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set vim update time (milliseconds)
set updatetime=250

" Detect filetypes plugins and indent rules
filetype plugin indent on

" Defining the <leader>
map <Space> <leader>

" Remove the pause when leaving insert mode
set ttimeoutlen=10

" No netrw history
let g:netrw_dirhistmax=0

"" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""
" Shows the current position
set number

" Shows line numbers relative to the cursor
set relativenumber

" A buffer becomes hidden when abandonned
set hid

" Shows matching brackets when cursor is over them
set showmatch

" Splits to the right
set splitright

" Prevents nvim from being customized by text files commands
set nomodeline

" GUI colors
set termguicolors

" Colorscheme
set background=dark
colorscheme polyjuice

" Change cursor behaviour when entering insert mode
let &t_SI.="\e[6 q" "SI = INSERT mode // steady bar
let &t_SR.="\e[4 q" "SR = REPLACE mode // underline

"" Text, tab and indent
""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not use spaces instead of tabs
set noexpandtab

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4

" Indent and wrap rules
set autoindent

" Formatting
set textwidth=80
autocmd FileType * setlocal formatoptions+=jpt
autocmd FileType * setlocal formatoptions-=ro

" Enable autocompletion
set wildmode=longest,full

" Automatically remove all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" To recognize groff filetype
au BufNewFile,BufRead *.mom set filetype=groff

" Always use LaTeX flavor
au BufNewFile,BufRead *.tex set filetype=tex

"" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Don't show editor mode
set noshowmode

source $XDG_CONFIG_HOME/nvim/statusline.vim

augroup statusline
	autocmd!
	autocmd VimEnter *
		\ call UpdateInactiveWindows()
	autocmd VimEnter,WinEnter,BufWinEnter *
		\ call RefreshStatusLine('active')
	autocmd WinLeave *
		\ call RefreshStatusLine('inactive')
augroup END

"" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""
" Templates location
let g:tmpl_search_paths=['$XDG_CONFIG_HOME/nvim/templates']

"" Macros
""""""""""""""""""""""""""""""""""""""""""""""""""
" Source files
noremap <leader>s :source ~/.config/nvim/init.vim <CR>

" Circle through buffers
noremap <leader>n :bn<CR>
noremap <leader>b :bp<CR>

" Clear the search highlight
noremap <leader>h :nohl<CR>

" Make use of xclipboard
nnoremap <leader>v "+p
vnoremap <leader>c "+y

" Compile document
noremap <leader><Enter> :w! \| !compiler %<CR>

" Compile mom folder into pdf
noremap <leader>m :w! \| !mommerge<CR>

" Plugin management
noremap <leader>pi :PlugInstall<CR>
noremap <leader>pc :PlugClean<CR>
noremap <leader>pu :PlugUpdate \| PlugUpgrade<CR>

" Colorize
noremap <leader>cc :ColorizerToggle<CR>

" Template
noremap <leader>ti :TemplateInit<CR>
noremap <leader>te :TemplateExpand<CR>
