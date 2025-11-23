return {
  "stevearc/conform.nvim",
  async = true,
  keys = {
    {
      "gf",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "Format Document",
    },
  },
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
