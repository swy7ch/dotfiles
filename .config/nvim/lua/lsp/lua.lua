-- Author        : swytch
-- Created       : Tuesday May 18, 2021 12:08:51 CET
-- License       : GPLv3
-- Description   : sumneko (lua) config file for lsp

local system_name = "Linux"

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = globals.lsp_path .. "/sumneko_lua"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
        settings = {
                Lua = {
                        runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                                -- Setup your lua path
                                path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = {'vim'},
                        },
                        workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                                },
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                                enable = false,
                        },
                },
        },
}
