-- Author        : swytch
-- Created       : Monday May 24, 2021 20:02:19 CET
-- License       : GPLv3
-- Description   : treesitter config file

require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "lua", "python", "bash", "latex", "verilog" },
        ignore_install = { "javascript" },
        highlight = {
                enable = true,
        },
        indent = {
                enable = true,
        },
}
