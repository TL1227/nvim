vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs" },
    callback = function()
        vim.keymap.set("n", "gd", ":vimgrep /class <c-r><c-w>/ **/*.cs<cr>llllll", { buffer = true })
        vim.keymap.set("n", "gf", ":vimgrep /[a-z] <c-r><c-w>(/ **/*.cs<cr>ll", { buffer = true })
    end
})
