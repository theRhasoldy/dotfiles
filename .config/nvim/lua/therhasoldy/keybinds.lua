local key = vim.keymap.set

key("n", " ", "")
vim.g.mapleader = " "

-- Reload
key("n", "<Leader>r", "<cmd>source<CR>")

-- Fast horizontal movement
key("x", "H", "^")
key("x", "L", "$")

key("n", "<C-a>", "gg<S-v>G") -- Select all

-- Splits
key("n", "<Leader>-", "<cmd>split<CR>")
key("n", "<Leader>=", "<cmd>vsplit<CR>")
key("n", "<C-q>", "<cmd>q<CR>")
key("n", "<Space>+", "<C-w>=")

-- Resize splits
key("n", "<Leader>h", "<C-W>H")
key("n", "<Leader>j", "<C-W>J")
key("n", "<Leader>k", "<C-W>K")
key("n", "<Leader>l", "<C-W>L")

-- Switch lines
key("n", "<A-j>", ":m .+1<CR>==")
key("n", "<A-k>", ":m .-2<CR>==")
key("v", "<A-j>", ":m '>+1<CR>gv=gv")
key("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Add newline
key("n", "<CR>", "o<Esc>")
key("n", "<S-CR>", "O<Esc>")
