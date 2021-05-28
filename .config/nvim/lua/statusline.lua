-- Author        : swytch
-- Created       : Friday Mar 12, 2021 21:45:21 CET
-- License       : GPLv3
-- Description   : neovim statusline file
--                 based on github/nihilistkitten's work


local function gen_section(hl_string, items)
        local out = ""
        for _, item in pairs(items) do
                if item ~= "" then
                        out = out .. " " .. item
                end
        end
        if out ~="" then
                return hl_string .. out .. " "
        else
                return out
        end
end

-- sensible names for vim modes
local function get_mode(m)
        local mode_group = {
                ["n"]           = "Normal",
                ["no"]          = "O-Pending",
                ["nov"]         = "O-Pending",
                ["noV"]         = "O-Pending",
                ["no"]        = "O-Pending",
                ["niI"]         = "Normal",
                ["niR"]         = "Normal",
                ["niV"]         = "Normal",
                ["v"]           = "Visual",
                ["V"]           = "V-Line",
                [""]          = "V-Block",
                ["s"]           = "Select",
                ["S"]           = "S-Line",
                [""]          = "S-Block",
                ["i"]           = "Insert",
                ["ic"]          = "Insert",
                ["ix"]          = "Insert",
                ["R"]           = "Replace",
                ["Rc"]          = "Replace",
                ["Rv"]          = "V-Replace",
                ["Rx"]          = "Replace",
                ["c"]           = "Command",
                ["cv"]          = "Ex",
                ["ce"]          = "Ex",
                ["r"]           = "Prompt",
                ["rm"]          = "Prompt",
                ["r?"]          = "Prompt",
                ["!"]           = "Shell",
                ["t"]           = "Terminal",
        }
        return mode_group[m] or "None"
end

local function get_mode_display_name(m)
        local mode = {
                ["Normal"]      = "[ NRM ]",
                ["O-Pending"]   = "[ OTR ]",
                ["Visual"]      = "[ VSL ]",
                ["V-Line"]      = "[ V·L ]",
                ["V-Block"]     = "[ V·B ]",
                ["Select"]      = "[ SEL ]",
                ["S-Line"]      = "[ S·L ]",
                ["S-Block"]     = "[ S·B ]",
                ["Insert"]      = "[ INS ]",
                ["Replace"]     = "[ RPL ]",
                ["Command"]     = "[ CMD ]",
                ["Prompt"]      = "[ PMT ]",
                ["Shell"]       = "[ SHL ]",
                ["Terminal"]    = "[ TRM ]",
                ["None"]        = "[ --- ]"
        }
        return mode[m]
end

-- get the highlight group for a mode group
local function get_mode_color(m)
        local color = {
                ["Normal"]      = "%#NormalMode#",
                ["O-Pending"]   = "%#NormalMode#",
                ["Visual"]      = "%#VisualMode#",
                ["V-Line"]      = "%#VisualMode#",
                ["V-Block"]     = "%#VisualMode#",
                ["Select"]      = "%#NormalMode#",
                ["S-Line"]      = "%#NormalMode#",
                ["S-Block"]     = "%#NormalMode#",
                ["Insert"]      = "%#InsertMode#",
                ["Replace"]     = "%#ReplaceMode#",
                ["Command"]     = "%#CommandMode#",
                ["Prompt"]      = "%#NormalMode#",
                ["Shell"]       = "%#NormalMode#",
                ["Terminal"]    = "%#NormalMode#",
                ["None"]        = "%#NormalMode#"
        }
        return color[m]
end

-- don't return a filename that's too long
local function filename()
        if vim.api.nvim_win_get_width(0) > 80 then
                return "%F"
        else
                return "%t"
        end
end

-- from https://github.com/nvim-lua/lsp-status.nvim/blob/master/lua/lsp-status/diagnostics.lua
local function get_lsp_diagnostics(bufnr)
        local result = {}
        local levels = {
                errors = "Error",
                warnings = "Warning",
                info = "Information",
                hints = "Hint"
        }

        for k, level in pairs(levels) do
                result[k] = vim.lsp.diagnostic.get_count(bufnr, level)
        end

        return result
end

local function process_diagnostics(prefix, n, hl)
        if n > 0 then
                return hl .. prefix .. n
        else
                return ""
        end
end

local function spell_check()
        if vim.wo.spell then
                local lang = vim.o.spelllang
                return "[SPELL=" .. lang .. "]"
        else
                return ""
        end
end

local function statusline_focused()
        local diagnostics = get_lsp_diagnostics()
        local mode = vim.fn.mode()
        local mg = get_mode(mode)
        local accent_color = get_mode_color(mg)

        local left = table.concat {
                gen_section(accent_color, {get_mode_display_name(mg)}),
                gen_section("%#Middle#", {filename()}),
                gen_section("%#Bottom#", {"%m", "%r"}),
                gen_section(
                        "%#Alert#",
                        {
                                process_diagnostics(
                                        globals.sign_error .. " ",
                                        diagnostics.errors,
                                        "%#LspDiagnosticsDefaultError#"
                                ),
                                process_diagnostics(
                                        globals.sign_warning .. " ",
                                        diagnostics.warnings,
                                        "%#LspDiagnosticsDefaultWarning#"
                                ),
                                process_diagnostics(
                                        globals.sign_info .. " ",
                                        diagnostics.info,
                                        "%#LspDiagnosticsDefaultInformation#"
                                )
                        }
                )
        }
        local right = table.concat {
                gen_section(
                        "%#Bottom#",
                        {
                                spell_check(),
                                vim.bo.filetype
                        }
                ),
                gen_section("%#Middle#", {"%03.p%%"}),
                gen_section("%#Top#", {"-%03.c-"})
        }

        return table.concat {
                left,
                "%#Statusline#",
                "%=",
                right
        }

end

local function statusline_not_focused()
        return table.concat {
                gen_section("%#StatuslineNF#", {filename(), "%m"}),
                "%=",
                gen_section("%#StatuslineNF#", {"%03.p%%"}),
                gen_section("%#StatuslineNF#", {"-%03.c-"})
        }
end

function _G.gen_statusline()
        if vim.g.statusline_winid == vim.fn.win_getid() then
                return statusline_focused()
        else
                return statusline_not_focused()
        end
end

vim.o.statusline = "%!luaeval(\"gen_statusline()\")"
