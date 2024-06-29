-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local harpoon = require("harpoon")

-- Harpoon keymaps
-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<Tab>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<S-Tab>", function() harpoon:list():next() end)

-- Better escape
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Remove highlight
vim.keymap.set("n", "<esc>", ":noh<CR>", { silent = true })

-- Lexplore
vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<cr>", { silent = true })
--vim.keymap.set("n", "<leader>ta", "<cmd>

-- Movements
vim.keymap.set("n", "<leader>l", "$", { silent = true })
-- Move lines up and down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- LSP and formatting
local conform = require("conform")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gf", conform.format, { desc = "Format Document" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- Utils
vim.keymap.set("n", "<C-p>", ":let @+ = expand('%')<CR>", { desc = "Copy relative path of file opened" })

