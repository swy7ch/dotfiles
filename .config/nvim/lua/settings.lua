-- Author        : swytch
-- Created       : Friday Mar 12, 2021 17:43:21 CET
-- License       : GPLv3
-- Description   : neovim settings file

local opt       = vim.opt
local g         = vim.g

-- general
opt.wildignore          = {
        ".git",
        "*.o", "*.class",
        "*.jpg", "*.jpeg", "*.png",
        "*.pdf",
        "*.zip", "*.gz", "*.rar", "*.tar.xz",
}
opt.wildmode            = { "longest", "full" }
opt.wildoptions         = "pum"
g.loaded_netrw          = 1           -- disable netrw

-- editor
opt.splitright          = true
opt.splitbelow          = true
opt.scrolloff           = 4
opt.termguicolors       = true
opt.background          = "dark"
opt.shortmess           = opt.shortmess:append { c = true }
opt.number              = true
opt.relativenumber      = true
opt.signcolumn          = "yes"
opt.listchars           = {
        tab         = "<->",
        nbsp        = "␣",
        trail       = "·",
        extends     = ">",
        precedes    = "<",
}
opt.showmatch           = true
opt.ignorecase          = true
opt.smartcase           = true
opt.inccommand          = "split"
opt.completeopt         = { "menuone", "noselect" }

-- statusline
opt.laststatus          = 2
opt.showmode            = false

-- text, tabs, indents
opt.textwidth           = 79
opt.shiftwidth          = 8
opt.softtabstop         = -1
opt.expandtab           = true
opt.shiftwidth          = 0
opt.backspace           = { "indent", "eol", "start" }

-- augroups
utils.create_augroup({
        {"BufWritePre", "*", "%s/\\s\\+$//e"}
}, "remove_trailing_whitespaces")
utils.create_augroup({
        {"BufNewFile,BufRead", "*.mom", "set filetype=groff"},
        {"BufNewFile,BufRead", "*.tex", "set filetype=tex"},
}, "enforce_filetypes")
