-- Author        : swytch
-- Created       : Friday Oct. 22, 2021 22:07:41 CET
-- License       : GPLv3
-- Description   : colorscheme config file


local utils = require("utils")
local file = os.getenv("XDG_STATE_HOME") .. "/nvim_colorscheme"
local colorscheme = utils.lines_from(file)[0]

require("astronomy").setup {
        variant = colorscheme,
}
