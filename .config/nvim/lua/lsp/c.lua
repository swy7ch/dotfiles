-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : clangd config file for lsp

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


require("lspconfig").clangd.setup {
        cmd = { "clangd",
                "--background-index",
                "--suggest-missing-includes",
                "--clang-tidy",
                "--header-insertion=iwyu"
        },
        -- The following example advertise capabilities to `clangd`.
        capabilities = capabilities,
}
