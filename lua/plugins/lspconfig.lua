return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "ms-jpq/coq_nvim", branch = "coq" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = true,
    }
  end,
  config = function()
    local lsp = require("lspconfig")
    local ruby_lspconfig = require("util.ruby-lsp")

    lsp.ruby_lsp.setup({
      on_attach = function(client, buffer)
        ruby_lspconfig.on_attach(client, buffer)
      end,
    })
    lsp.lua_ls.setup({})
    lsp.tailwindcss.setup({})
  end,
}
