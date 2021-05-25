-- Author        : swytch
-- Created       : Friday Mar 12, 2021 20:17:19 CET
-- License       : GPLv3
-- Description   : neovim mappings file

utils.map("n", "<space>", "<leader>")
utils.map("n", "<leader>j", "<cmd>bn<CR>")
utils.map("n", "<leader>k", "<cmd>bp<CR>")
utils.map("v", "<leader>y", "\"+y")
utils.map("n", "<leader>p", "\"+P")
utils.map("n", "<leader><enter>", "<cmd>w! | !compiler %<CR>")
utils.map("n", "<leader>s", "<cmd>PackerSync<CR>")
utils.map("n", "<leader>c", "<cmd>ColorizerToggle<CR>")

-- LSP
utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
utils.map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
utils.map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
utils.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
utils.map("n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
utils.map("n", "<leader>lp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
utils.map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- telescope
utils.map("n", "<leader>tf", "<cmd>Telescope find_files<CR>")
utils.map("n", "<leader>tb", "<cmd>Telescope file_browser<CR>")
