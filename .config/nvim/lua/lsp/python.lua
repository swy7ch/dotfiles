-- Author        : swytch
-- Created       : Tuesday May 18, 2021 15:03:43 CET
-- License       : GPLv3
-- Description   : jedi (python) config file for lsp

require("lspconfig").jedi_language_server.setup{
    cmd = { vim.fn.stdpath("data") .. "/lsp_servers/jedi_language_server/venv/bin/jedi-language-server" }
}
