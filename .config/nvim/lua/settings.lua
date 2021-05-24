-- Author        : swytch
-- Created       : Friday Mar 12, 2021 17:43:21 CET
-- License       : GPLv3
-- Description   : neovim settings file

local g = vim.g

local o = vim.o
local w = vim.wo
local b = vim.bo

-- general
o.wildignore            = [[
        .git
        *.o,*.class
        *.jpg,*.jpeg,*.png
        *.avi,*.mp4,*.mkv
        *.mp3,*.ogg,*.flac
        *.eot,*.otf,*.ttf,*.woff
        *.pdf
        *.zip,*.gz,*.rar,*.tar.xz
]]
o.wildmode              = "longest,full"
o.wildoptions           = "pum"
o.clipboard             = "unnamedplus"
g.netrw_dirhistmax      = 0

-- editor
o.splitright            = true
o.splitbelow            = true
o.scrolloff             = 4
o.termguicolors         = true
o.background            = "dark"
o.shortmess             = o.shortmess .. "c"
w.number                = true
w.relativenumber        = true
w.signcolumn            = "yes"
o.listchars             = "tab:<->,nbsp:␣,trail:·,extends:>,precedes:<"
o.showmatch             = true
o.ignorecase            = true
o.smartcase             = true
o.inccommand            = "split"
o.completeopt           = "menuone,noselect"

-- statusline
o.laststatus            = 2
o.showmode              = false

-- text, tabs, indents
b.textwidth             = 79
b.shiftwidth            = 8
b.softtabstop          = -1
b.expandtab             = true
b.shiftwidth            = 0
o.backspace             = "indent,eol,start"

-- augroups
utils.create_augroup({
        {"BufWritePre", "*", "%s/\\s\\+$//e"}
}, "remove_trailing_whitespaces")
utils.create_augroup({
        {"BufNewFile,BufRead", "*.mom", "set filetype=groff"},
        {"BufNewFile,BufRead", "*.tex", "set filetype=tex"},
}, "enforce_filetypes")
