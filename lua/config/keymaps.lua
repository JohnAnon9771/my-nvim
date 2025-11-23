-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Better escape
map("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Remove highlight
map("n", "<esc>", ":noh<CR>", { silent = true })

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

-- LSP e Formatting (Usando comandos nativos ou LazyVim utils)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
