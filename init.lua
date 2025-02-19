vim.g.mapleader = " "

--check the directory for a .noplug file
local function checkForNoPlug()
    for file in io.popen([[dir /b]]):lines()
    do
        if file == ".noplug" then
            require("plugless")
            vim.cmd("color retrobox")
            return
        end
    end

    require("config.lazy")
    vim.cmd("color vscode")
end

checkForNoPlug()

require("options")
require("terminal")

--remaps
vim.keymap.set("n", "<leader><tab>", ":ls<cr>:b ")
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>v", "<C-w>v<c-w>l")
vim.keymap.set("n", "<leader>w", ":wa<CR>")
vim.keymap.set("n", "<leader>e", ":e<CR>")
vim.keymap.set("n", "<leader>cd", ":e $MYVIMRC<cr>")
vim.keymap.set("n", "-", ":Ex<cr>")

--search for files
vim.keymap.set("n", "<leader>ff", ":edit **/*<left>")
vim.keymap.set("n", "<leader>fp", ":find **/Program.cs<cr>")
vim.keymap.set("n", "<c-f>", ":vimgrep // **/*<left><left><left><left><left><left>")

--quickfix navigation
vim.keymap.set("n", "]q", ":cn<CR>")
vim.keymap.set("n", "[q", ":cp<CR>")

--buffer navigation
vim.keymap.set("n", "]b", ":bn<CR>")
vim.keymap.set("n", "[b", ":bp<CR>")

--split pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

--double tap for different behavior
vim.keymap.set("i", ";'", "<Right><Right><Right><Right><Right>;")
vim.keymap.set("i", "{{", "<Esc>A<cr>{<cr>}<Esc>O")
vim.keymap.set("n", "<leader>cc", ":cclose<cr>")

--abbreviations
vim.cmd [[
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
]]

vim.cmd([[iab fr for (int i = 0; i <; i++)<esc>F;i]])
vim.cmd([[iab fe foreach (var item in items)<esc>Frl]])
vim.cmd([[iab iff if ()<left><c-r>=Eatchar('\s')<cr>]])

--autocmd

--C#
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs" },
    callback = function()
        vim.keymap.set("n", "<leader>b", ":hor term dotnet build<cr>", { buffer = true })
        vim.keymap.set("n", "<leader>r", ":hor term dotnet run<cr>", { buffer = true })

        vim.cmd([[iab <buffer> cw Console.WriteLine();<left><left><c-r>=Eatchar('\s')<cr>]])
        vim.cmd([[iab <buffer> prop public  { get; set; }<esc>F{i<left><c-r>=Eatchar('\s')<cr>]])
    end
})

--C++
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp", "h" },
    callback = function()
        vim.keymap.set("n", "<leader>b", ":hor term ./build.bat<cr>", { buffer = true })
        vim.keymap.set("n", "<leader>r", ":hor term ./a.exe<cr>", { buffer = true })
    end
})

--Lsp Attach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
})
