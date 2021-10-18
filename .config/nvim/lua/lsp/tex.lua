-- Author        : swytch
-- Created       : Saturday May 23, 2021 10:34:53 CET
-- License       : GPLv3
-- Description   : LaTeX config file for lsp

require("lspconfig").texlab.setup {
        cmd = { vim.fn.stdpath("data") .. "/lsp_servers/latex/texlab" },
        settings = {
                build = {
                        executable = "pdflatex"
                }
        }
}
