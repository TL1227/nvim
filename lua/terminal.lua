--I read somewhere you should set these if using powershell :)
vim.o.shell = 'powershell -NoLogo'
vim.o.shellcmdflag =
'-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = { "*" },
    callback = function()
        vim.cmd("setlocal nonumber")
        vim.cmd("setlocal norelativenumber")
        vim.cmd("startinsert")
        vim.opt.signcolumn = "no"
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*" },
    callback = function()
        if vim.opt.buftype:get() == "terminal" then
            vim.cmd("startinsert")
        end
    end
})

--open term in buffer on startup 
vim.cmd("badd term://powershell.exe -NoLogo")
vim.cmd("buffer term:")
vim.cmd("set nobuflisted")
vim.cmd("buffer 1")
vim.cmd("stopinsert")

local function openTerminal()
    local windows = #vim.api.nvim_tabpage_list_wins(0)
    if windows == 1 then
        vim.cmd("vert sbuffer term:")
    else
        vim.cmd("buffer term:")
    end
end

vim.keymap.set("n", "<leader>t", openTerminal)

--toggle term
vim.keymap.set("n", "<c-t>", "<c-\\><c-n>:buffer term:<cr>")
vim.keymap.set("t", "<c-t>", "<c-\\><c-n><c-o>")

vim.keymap.set("t", "<c-n>", "<c-\\><c-n>")
vim.keymap.set("t", "<c-q>", "<c-\\><c-n>:q<cr>")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l")

--git stuff
vim.keymap.set("t", "<c-d>", "git diff<cr>")
vim.keymap.set("t", "<c-s>", "git status<cr>")
vim.keymap.set("t", "<c-x>", "git commit -am \"\"<left>")
