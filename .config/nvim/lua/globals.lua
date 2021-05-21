-- Author        : swytch
-- Created       : Friday May 21, 2021 22:26:24 CET
-- License       : GPLv3
-- Description   : neovim global variables file

local M = {} -- The module to export

M = {
	lsp_path = vim.fn.stdpath("data").. "/lsp",

        -- misc
	sign_error = "",
	sign_warning = "",
	sign_hint = "",
	sign_info = "",
}

-- Make it accessible everywhere
_G.globals = M
-- Export the module
return M
