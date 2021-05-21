-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : neovim lsp config file

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
