-- Author        : swytch
-- Created       : Friday Mar 12, 2021 20:17:19 CET
-- License       : GPLv3
-- Description   : neovim mappings file

utils.map("n", "<space>", "<leader>")
utils.map("n", "<leader>j", "<cmd>bn<CR>")
utils.map("n", "<leader>k", "<cmd>bp<CR>")
utils.map("n", "<leader>y", "\"+y")
utils.map("v", "<leader>p", "\"+P")
utils.map("n", "<leader><enter>", "<cmd>w! | !compiler %<CR>")
utils.map("n", "<leader>s", "<cmd>PackerSync<CR>")
utils.map("n", "<leader>c", "<cmd>ColorizerToggle<CR>")
