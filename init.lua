-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lsp_configs")

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    ruby = { "rubocop" },
  },
})

vim.o.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = ";"
