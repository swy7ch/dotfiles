-- Author        : swytch
-- Created       : Friday Mar 12, 2021 20:07:39 CET
-- License       : GPLv3
-- Description   : neovim utils file

local M = {} -- The module to export
local cmd = vim.cmd

-- augroup helper
function M.create_augroup(autocmds, name)
        cmd("augroup " .. name)
        cmd("autocmd!")
        for _, autocmd in ipairs(autocmds) do
                cmd("autocmd " .. table.concat(autocmd, " "))
        end
        cmd("augroup END")
end

-- add a path to the rtp
function M.add_rtp(path)
        local rtp = vim.o.rtp
        rtp = rtp .. "," .. path
end

-- map a key with optional options
function M.map(mode, keys, action, options)
        options = options or {}
        vim.api.nvim_set_keymap(mode, keys, action, options)
end

-- Make it accessible everywhere
_G.utils = M
-- Export the module
return M
