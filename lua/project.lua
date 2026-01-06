vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local cwd = vim.fn.getcwd():lower()
        if cwd:match("towerrpg") then --CrimsonTower
            vim.keymap.set("n", "<c-f>", ":vimgrep // src/*<left><left><left><left><left><left><left>")
            vim.keymap.set("n", "<leader>ff", ":find ")

            vim.opt.path = {"src/", "shaders/"}
            vim.opt.suffixesadd = {".cpp", ".h", ".shader"}

            require("config.lazy")
            vim.cmd("color vscode")

            --require("plugless")
            --vim.cmd("color sorbet")
        elseif cwd:match("somethingelse") then
            --set some other config
        else
            require("config.lazy")
            vim.cmd("color vscode")
        end
    end
})
