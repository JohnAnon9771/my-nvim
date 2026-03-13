return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "tailwindcss", "rust_analyzer" },
    })

    local function get_ruby_opts()
      local status_ok, ruby_util = pcall(require, "util.ruby-lsp")
      if not status_ok then
        return {}
      end
      return {
        cmd = { "ruby-lsp" },
        filetypes = { "ruby" },
        root_markers = { "Gemfile", ".git" },
        init_options = {
          formatter = "rubocop",
          linters = { "rubocop" },
        },
        on_attach = function(client, buffer)
          ruby_util.on_attach(client, buffer)
        end,
      }
    end

    vim.lsp.config("ruby_lsp", get_ruby_opts())
    vim.lsp.enable("ruby_lsp")

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    vim.lsp.config("tailwindcss", {})
    vim.lsp.enable("tailwindcss")
  end,
}
