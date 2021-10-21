-- Author        : swytch
-- Created       : Friday Mar 12, 2021 22:28:34 CET
-- License       : GPLv3
-- Description   : neovim plugins file


local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
        execute "packadd packer.nvim"
end

return require("packer").startup(function()
        -- packer manages itself
        use "wbthomason/packer.nvim"

        -- colorscheme
        use {
                "~/.local/src/astronomy",
                config = function() require("colorscheme") end
        }

        -- tree-sitter
        use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = function() require("plugin.treesitter") end
        }

        -- fuzzy finder
        use {
                "nvim-telescope/telescope.nvim",
                opt = true,
                requires = {
                        {
                                "nvim-lua/popup.nvim",
                                opt = true
                        },
                        {
                                "nvim-lua/plenary.nvim",
                                opt = true
                        }
                },
                cmd = "Telescope"
        }

        -- LSP
        use {
                "williamboman/nvim-lsp-installer",
                cmd = {
                        "LspInstall",
                        "LspInstallInfo"
                },
                config = function() require("plugin.lsp_installer").setup() end
        }

        use {
                "neovim/nvim-lspconfig",
                ft = { "c", "cpp", "lua", "python", "tex"},
                config = function() require("lsp").setup() end
        }

        -- auto completion
        use {
                "hrsh7th/nvim-cmp",
                requires = {
                        "L3MON4D3/LuaSnip",
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-nvim-lua",
                        "hrsh7th/cmp-buffer",
                        "hrsh7th/cmp-path",
                        "hrsh7th/cmp-calc",
                        "ray-x/cmp-treesitter",
                        "f3fora/cmp-spell"
                },
                config = function() require("plugin.cmp") end
        }

        -- commenting, simplified
        use {
                "numToStr/Comment.nvim",
                config = function() require("plugin.comment") end
        }

        -- display colors directly in editor
        use {
                "norcalli/nvim-colorizer.lua",
                cmd = "ColorizerToggle"
        }

        -- ens
        use {
                "whonore/Coqtail",
                ft = { "verilog" },
                config = vim.cmd[[let g:coqtail_nomap = 1]]
        }
end)
