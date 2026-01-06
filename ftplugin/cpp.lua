local function Hswitch ()
    local file = vim.fn.expand("%")

    if string.match(file, ".cpp") then
        file = file:gsub(".cpp", ".h")
    elseif string.match(file, ".h") then
        file = file:gsub(".h", ".cpp")
    else
        return
    end

    local windows = #vim.api.nvim_tabpage_list_wins(0)
    if windows == 1 then
        vim.cmd("vs " .. file)
    else
        vim.cmd("edit " .. file)
    end
end

vim.keymap.set("n", "<leader>h", Hswitch) --switch h and cpp files

vim.keymap.set("n", "<leader>b", ":hor term ./build.bat<cr>", { buffer = true })
vim.keymap.set("n", "<leader>r", ":hor term ./run.bat<cr>", { buffer = true })
vim.keymap.set("n", "gf", ":vimgrep /[^ =][: ]<c-r><c-w>(/ */*<cr>ll", { buffer = true }) --go to function
vim.cmd([[iab <buffer> cw std::cout << << std::endl;<left><left><left><left><left><left><left><left><left><left><left><left><left><left><space><c-r>=Eatchar('\s')<cr>]])
