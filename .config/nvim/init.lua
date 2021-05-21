-- Author        : swytch
-- Created       : Friday Mar 12, 2021 17:42:34 CET
-- License       : GPLv3
-- Description   : neovim configuration file

require("globals") 	-- ./lua/globals.lua
require("utils")        -- ./lua/utils.lua
require("settings")     -- ./lua/settings.lua
require("plugins")      -- ./lua/plugins.lua
require("maps")         -- ./lua/maps.lua
require("statusline")   -- ./lua/statusline.lua

require("polyjuice")    -- colorscheme

-- LSP
require("lsp")          -- ./lua/lsp/init.lua
require("lsp.c")        -- ./lua/lsp/c.lua
require("lsp.lua")      -- ./lua/lsp/lua.lua
require("lsp.python")   -- ./lua/lsp/python.lua

-- auto complete
require("plugin.compe") -- ./lua/plugin/compe.lua
