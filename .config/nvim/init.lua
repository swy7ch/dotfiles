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

require("polyjuice")    -- ~/.local/src/polyjuice/lua/polyjuice.lua

-- auto complete
require("plugin.compe") -- ./lua/plugin/compe.lua

-- treesitter
require("plugin.treesitter")    -- ./lua/plugin/treesitter.lua
