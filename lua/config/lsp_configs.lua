require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_lspconfig = require("mason-lspconfig")
local ruby_lsp_config = require("util.ruby-lsp")
local coq = require("coq")

vim.cmd("COQnow -s")

local servers = {
  lua_ls = {},
  ruby_lsp = {
    settings = {
      formatter = "rubocop",
    },
  },
}

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = function(client, buffer)
        ruby_lsp_config.on_attach(client, buffer)
      end,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    })
    require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities())
  end,
})
