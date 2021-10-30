-- Author        : swytch
-- Created       : Saturday Sept. 11, 2021 22:12:33 CET
-- License       : GPLv3
-- Description   : cmp plugin config file

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_backspace = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and
                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:
                        sub(col, col):match('%s') == nil
end

-- If you want insert `(` after select function or method item
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

cmp.setup {
        completion = {
                autocomplete = false
        },
        sources = {
                { name = "path" },
                { name = "buffer" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "treesitter" },
                { name = "calc" },
                { name = "spell" },
        },
        formatting = {
                format = function(entry, vim_item)
                        vim_item.menu = ({
                                nvim_lsp        = "[lsp]",
                                nvim_lua        = "[nvim]",
                                path            = "[path]",
                                buffer          = "[buff]",
                                calc            = "[calc]",
                                spell           = "[spel]",
                                treesitter      = "[tree]",
                        })[entry.source.name]
                        return vim_item
                end,
        },
        snippet = {
                expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                end,
        },
        mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                        elseif check_backspace() then
                                cmp.complete()
                        else
                                fallback()
                        end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                        else
                                fallback()
                        end
                end, { "i", "s" }),
        }
}
