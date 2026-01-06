vim.keymap.set("n", "<leader>b", ":hor term dotnet build<cr>", { buffer = true })
--vim.keymap.set("n", "<leader>b", ":make<cr>", { buffer = true }) --build
vim.keymap.set("n", "<leader>r", ":hor term dotnet run<cr>", { buffer = true })
vim.keymap.set("n", "<leader>do", ":vimgrep /todo:/ **/*.cs*<cr>:copen<cr>") --show todos

vim.cmd([[iab <buffer> cw Console.WriteLine();<left><left><c-r>=Eatchar('\s')<cr>]])
vim.cmd([[iab <buffer> prop public  { get; set; }<esc>F{i<left><c-r>=Eatchar('\s')<cr>]])
vim.cmd([[iab <buffer> ty try<cr>{<cr>}<cr>catch<cr>{<cr>}<esc>kkkko]])

--these are so gf works
--vim.cmd([[set isfname-=.]])
--vim.cmd([[set suffixesadd+=.cs]])

vim.cmd("compiler dotnet")
