require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

local servers = {
  lua_ls = {},
  ruby_lsp = {},
}

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})
