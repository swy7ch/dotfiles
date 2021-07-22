-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : neovim lsp config file

local lsp = {}

vim.fn.sign_define(
        "LspDiagnosticsSignError",
        {
		texthl = "LspDiagnosticsSignError",
		text = globals.sign_error,
		numhl = "LspDiagnosticsSignError"
	}
)
vim.fn.sign_define(
        "LspDiagnosticsSignWarning",
        {
		texthl = "LspDiagnosticsSignWarning",
		text = globals.sign_warning,
		numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
        "LspDiagnosticsSignHint",
        {
		texthl = "LspDiagnosticsSignHint",
		text = globals.sign_hint,
		numhl = "LspDiagnosticsSignHint"
	}
)
vim.fn.sign_define(
        "LspDiagnosticsSignInformation",
        {
		texthl = "LspDiagnosticsSignInformation",
		text = globals.sign_info,
		numhl = "LspDiagnosticsSignInformation"
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
