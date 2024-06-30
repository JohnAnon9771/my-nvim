-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lsp_configs")
require("config.conform")
require("config.telescope")

vim.o.relativenumber = true
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = ";"
