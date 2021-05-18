-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : neovim lsp config file

vim.fn.sign_define(
        "LspDiagnosticsSignError",
        {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
        "LspDiagnosticsSignWarning",
        {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
        "LspDiagnosticsSignHint",
        {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
        "LspDiagnosticsSignInformation",
        {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)
