return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup {
                sources = {
                    { name = "nvim_lsp" }
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'})
                }),
                preselect = "item",
                completion = {
                    completeopt = "menu,menuone,noinsert"
                },
            }
        end,
    },
}
