vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local cwd = vim.fn.getcwd():lower()
        if cwd:match("towerrpg") then --CrimsonTower
        elseif cwd:match("somethingelse") then
            --set some other config
        else
            require("config.lazy")
            vim.cmd("color vscode")
        end
    end
})
