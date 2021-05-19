-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : neovim lsp mappings file

utils = require("utils")

utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
utils.map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
utils.map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
utils.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
