-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : neovim lsp config file

local M = {}

vim.fn.sign_define(
        "DiagnosticSignError",
        {
		texthl = "DiagnosticError",
		text = globals.sign_error,
		numhl = "DiagnosticError"
	}
)
vim.fn.sign_define(
        "DiagnosticSignWarn",
        {
		texthl = "DiagnosticWarn",
		text = globals.sign_warning,
		numhl = "DiagnosticWarn"
        }
)
vim.fn.sign_define(
        "DiagnosticSignHint",
        {
		texthl = "DiagnosticHint",
		text = globals.sign_hint,
		numhl = "DiagnosticHint"
	}
)
vim.fn.sign_define(
        "DiagnosticSignInfo",
        {
		texthl = "DiagnosticInfo",
		text = globals.sign_info,
		numhl = "DiagnosticInfo"
	}
)

M.icons = {
        Class           = "   ",
        Color           = "   ",
        Constant        = " µ  ",
        Constructor     = "   ",
        Enum            = "   ",
        EnumMember      = "   ",
        Event           = "   ",
        Field           = "   ",
        File            = "   ",
        Folder          = "   ",
        Function        = "   ",
        Keyword         = "   ",
        Interface       = "   ",
        Method          = "   ",
        Module          = "   ",
        Operator        = "   ",
        Property        = "   ",
        Reference       = "   ",
        Snippet         = "   ",
        Struct          = "   ",
        Text            = "   ",
        TypeParameter   = "   ",
        Unit            = "   ",
        Value           = "   ",
        Variable        = "   ",
}

function M.setup()
        local kinds = vim.lsp.protocol.CompletionItemKind
        for i, kind in ipairs(kinds) do
                kinds[i] = M.icons[kind] or kind
        end

        local ft = vim.bo.filetype
        if ft == "cpp" then ft = "c" end
        require("lsp." .. ft)           -- ./<ft>.lua
end

return M
