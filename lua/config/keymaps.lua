-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Better escape
map("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Remove highlight
map("n", "<esc>", ":noh<CR>", { silent = true })

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle position=right<cr>", { silent = true })

-- Movements
map("n", "<leader>l", "$", { silent = true })
map("n", "<leader>h", "_", { silent = true })

-- Move lines up and down
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Utils
map("n", "<C-p>", ":let @+ = expand('%')<CR>", { desc = "Copy relative path" })

-- Harpoon
map("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon Add" })
map("n", "<leader>qm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon Menu" })

for i = 1, 4 do
  map("n", "<leader>" .. i, function() require("harpoon"):list():select(i) end, { desc = "Harpoon " .. i })
end

map("n", "<Tab>", function() require("harpoon"):list():prev() end)
map("n", "<S-Tab>", function() require("harpoon"):list():next() end)

-- LSP e Formatting (Usando comandos nativos ou LazyVim utils)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- LazyVim usa Snacks ou Conform nativamente, mas se quiser forçar:
map("n", "gf", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Format Document" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
