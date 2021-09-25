-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : neovim lsp config file

local lsp = {}

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

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
        "   ",       -- Text
        "   ",       -- Method
        "   ",       -- Function
        "   ",       -- Constructor
        " ﴲ  ",       -- Field
        "   ",       -- Variable
        "   ",       -- Class
        " ﰮ  ",       -- Interface
        "   ",       -- Module
        " 襁 ",       -- Property
        "   ",       -- Unit
        "   ",       -- Value
        " 練 ",       -- Enum
        "   ",       -- Keyword
        "   ",       -- Snippet
        "   ",       -- Color
        "   ",       -- File
        "   ",       -- Reference
        "   ",       -- Folder
        "   ",       -- EnumMember
        " ﲀ  ",       -- Constant
        " ﳤ  ",       -- Struct
        "   ",       -- Event
        "   ",       -- Operator
        "   ",       -- TypeParameter
}

function lsp.setup()
        local ft = vim.bo.filetype
        if ft == "cpp" then ft = "c" end
        require("lsp." .. ft)           -- ./<ft>.lua
end

return lsp
