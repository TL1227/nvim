--
vim.opt.shadafile = "NONE"

--line number
vim.opt.number = true
vim.opt.relativenumber = true

--tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

--case
vim.opt.ignorecase = true
vim.opt.smartcase = true

--misc
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.scroll = 10
vim.opt.signcolumn = "yes"

--color
vim.opt.termguicolors = true

--wildmenu
vim.opt.wildignore = {
    --directory
    "obj/*",
    "bin/*",
    "*/obj/*",
    "*/bin/*",

    --files
    "*.exe",
    "*.obj",
    "*.ilk",
    "*.pdb",
}
