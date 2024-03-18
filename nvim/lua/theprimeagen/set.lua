-- vim.opt.guicursor = ""
vim.opt.guicursor = "n-v-i-c:block-Cursor"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.showmode = false

-- REQUIRES lightline.vim
vim.g.lightline = {
    colorscheme = 'one',
    background = 'dark',
    active = {
        left = { { 'mode', 'paste' },
            { 'gitbranch', 'readonly', 'filename', 'modified' } },
    },
    component_function = {
        gitbranch = 'FugitiveHead',
    },
}
