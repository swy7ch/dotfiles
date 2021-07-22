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
                "~/.local/src/polyjuice/",
                requires = "tjdevries/colorbuddy.nvim"
        }

        -- tree-sitter
        use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate"
        }

        -- fuzzy finder
        use {
                "nvim-telescope/telescope.nvim",
                requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"},
                opt = true,
                cmd = "Telescope"
        }

        -- LSP
        use "neovim/nvim-lspconfig"

        -- auto completion
        use "hrsh7th/nvim-compe"

        -- display colors directly in editor
        use {
                "norcalli/nvim-colorizer.lua",
                opt = true,
                cmd = "ColorizerToggle"
        }

end)
