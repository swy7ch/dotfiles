-- Author        : swytch
-- Created       : Saturday May 23, 2021 10:34:53 CET
-- License       : GPLv3
-- Description   : LaTeX config file for lsp

require("lspconfig").texlab.setup {
        settings = {
                build = {
                        executable = "pdflatex"
                }
        }
}
