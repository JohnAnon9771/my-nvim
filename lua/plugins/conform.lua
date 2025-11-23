return {
  "stevearc/conform.nvim",
  async = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      ruby = { "rubocop" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
