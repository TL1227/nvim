vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs" },
    callback = function()
        vim.keymap.set("n", "gd", ":vimgrep /class <c-r><c-w>/ **/*cs<cr>llllll", { buffer = true }) --go to class
        vim.keymap.set("n", "gf", ":vimgrep /[^ =] <c-r><c-w>(/ **/*cs<cr>ll", { buffer = true }) --go to function
        vim.keymap.set("n", "gr", ":vimgrep /<c-r><c-w>/ **/*cs<cr>:copen<cr>", { buffer = true }) --get reference
    end
})
