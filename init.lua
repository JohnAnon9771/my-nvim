-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.options")
require("config.lazy")
require("config.keymaps")

-- Note: opções, keymaps e autocmds são carregados automaticamente pelo LazyVim
-- ou pelo require("config.lazy") que importa os specs.
