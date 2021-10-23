-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : neovim lsp config file

local M = {}

vim.fn.sign_define(
        "DiagnosticSignError",
        {
		texthl = "DiagnosticVirtualTextError",
		text = globals.sign_error,
		numhl = "DiagnosticSignError"
	}
)
vim.fn.sign_define(
        "DiagnosticSignWarn",
        {
		texthl = "DiagnosticVirtualTextWarn",
		text = globals.sign_warning,
		numhl = "DiagnosticSignWarn"
        }
)
vim.fn.sign_define(
        "DiagnosticSignHint",
        {
		texthl = "DiagnosticVirtualTextHint",
		text = globals.sign_hint,
		numhl = "DiagnosticSignHint"
	}
)
vim.fn.sign_define(
        "DiagnosticSignInfo",
        {
		texthl = "DiagnosticVirtualTextInfo",
		text = globals.sign_info,
		numhl = "DiagnosticSignInfo"
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
