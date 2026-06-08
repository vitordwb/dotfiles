require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local nomap = vim.keymap.del

-- Sobrescreve os atalhos do NvChad para forçar o uso do vim-tmux-navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Window Left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Window Right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Window Down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Window Up" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
