return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            require("lspconfig").clangd.setup {
                cmd = { "clangd.cmd", "--compile-commands-dir=." }
            }

            require("lspconfig").lua_ls.setup {
                cmd = { "lua-language-server.cmd" },
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }

            require("lspconfig").omnisharp.setup {
                cmd = { "omnisharp.cmd" },
                settings = {
                    FormattingOptions = {
                        EnableEditorConfigSupport = true
                    },
                    Sdk = {
                        IncludePrereleases = true
                    },
                },
            }
        end
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end,
    },
}
