vim.o.relativenumber = true
vim.o.so = 999
vim.o.colorcolumn = 120
vim.o.cursorline = true
vim.o.ruler = true
vim.o.number = true
vim.o.cmdheight = 2
vim.o.smartcase = true
vim.o.swapfile = false

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftround = true

vim.o.lbr = true
vim.o.tw = 500

vim.o.ai = true
vim.o.si = true
vim.o.wrap = true
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes"

vim.cmd [[set t_Co=256]]
vim.cmd [[filetype plugin on]]
vim.cmd [[filetype indent on]]

require("zemzale")
