vim.g.mapleader = " "

require("options")
require("terminal")

--remaps
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>v", ":vsplit<cr>")
vim.keymap.set("n", "<leader>w", ":wa<CR>")
vim.keymap.set("n", "<leader>e", ":e<CR>")
vim.keymap.set("n", "<leader>cd", ":e $MYVIMRC<cr>")
vim.keymap.set("n", "<leader><tab>", ":ls<cr>:b ")
vim.keymap.set("n", "-", ":Ex<cr>")
vim.keymap.set("n", "<esc>", ":noh<cr>", { silent = true })

--search for files
vim.keymap.set("n", "<leader>ff", ":edit **/*<left>")
vim.keymap.set("n", "<leader>fp", ":find **/Program.cs<cr>")
vim.keymap.set("n", "<c-f>", ":vimgrep // **/*<left><left><left><left><left><left>")

--quickfix navigation
vim.keymap.set("n", "]q", ":cn<CR>zz")
vim.keymap.set("n", "[q", ":cp<CR>zz")

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

--Lsp Attach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)

        --disables lsp highlights
        --local client = vim.lsp.get_client_by_id(event.data.client_id)
        --client.server_capabilities.semanticTokensProvider = nil

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

require("project")
vim.keymap.set("n", "gf", ":vimgrep /[^ =] <c-r><c-w>(/ */*<cr>ll", { buffer = true }) --go to function
