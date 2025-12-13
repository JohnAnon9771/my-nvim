return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "ms-jpq/coq_nvim", branch = "coq" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = true,
      -- keymap = { recommended = false },
    }
  end,
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "ruby_lsp", "lua_ls", "tailwindcss", "rust-analyzer" },
    })

    local coq = require("coq")
    local function make_opts(opts)
      return coq.lsp_ensure_capabilities(opts or {})
    end

    local function get_ruby_opts()
      local status_ok, ruby_util = pcall(require, "util.ruby-lsp")
      if not status_ok then return {} end
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
        end
      }
    end

    vim.lsp.config("ruby_lsp", make_opts(get_ruby_opts()))
    vim.lsp.enable("ruby_lsp")

    vim.lsp.config("lua_ls", make_opts({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    }))
    vim.lsp.enable("lua_ls")

    vim.lsp.config("tailwindcss", make_opts({}))
    vim.lsp.enable("tailwindcss")
  end,
}
