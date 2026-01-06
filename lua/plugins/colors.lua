return {
    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup {
                transparent = true
            }
        end
    },
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup {
                styles = {
                    comment = { italic = true },
                    keyword = { italic = false }, -- any other keyword
                    type = { italic = false }, -- (preferred) int, long, char, etc
                    storageclass = { italic = false }, -- static, register, volatile, etc
                    structure = { italic = false }, -- struct, union, enum, etc
                    parameter = { italic = false }, -- parameter pass in function
                    annotation = { italic = false },
                    tag_attribute = { italic = false }, -- attribute of tag in reactjs
                },
            }
        end
    },

}
