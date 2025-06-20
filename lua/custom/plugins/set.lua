vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.cmd 'filetype indent off'
vim.cmd 'filetype plugin off'

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

if vim.fn.has 'win32' == 1 then
  vim.opt.undodir = os.getenv 'UserProfile' .. '/.vim/undodir'
else
  vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.g.mapleader = ' '

return {}
