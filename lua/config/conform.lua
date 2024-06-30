require("conform").setup({
  async = true,
  lsp_fallback = false,
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    ruby = { "rubocop" },
  },
})
