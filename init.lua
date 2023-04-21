
--remaps

--leader commands
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>b", vim.cmd.Ex) 
vim.keymap.set("n", "<leader>te", vim.cmd.Tex)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)

--numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--indent
vim.opt.smartindent = true

--swapfile
vim.opt.swapfile = false


--plugins

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fe', builtin.git_files, {})


--colours

--vs code colours
local c = require('vscode.colors').get_colors()
require('vscode').setup({
    style = 'dark',

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
})
require('vscode').load()


--treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c","c_sharp", "cpp", "gdscript", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


--LSP
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
