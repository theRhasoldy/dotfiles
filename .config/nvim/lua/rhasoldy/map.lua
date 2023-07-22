local map = vim.keymap.set

map("n", " ", "<Nop>", { noremap = true, silent = true })
map("n", ",", "<Nop>", { noremap = true, silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map("n", "<Leader>r", "<cmd>source<CR>")

-- Switch lines
map("n", "J", ":m .+1<CR>==", { silent = true })
map("n", "K", ":m .-2<CR>==", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Add Newline
map("n", "<CR>", "o<Esc>")
map("n", "<S-CR>", "O<Esc>")

map("i", "<C-BS>", "<ESC>cvb") -- No BS ctrl-backspace

-- Splits
map("n", "<LocalLeader>-", "<cmd>split<CR>")
map("n", "<LocalLeader>=", "<cmd>vsplit<CR>")

-- Switch Splits (Now using LocalLeader!)
map("n", "<LocalLeader>h", "<C-W>H")
map("n", "<LocalLeader>j", "<C-W>J")
map("n", "<LocalLeader>k", "<C-W>K")
map("n", "<LocalLeader>l", "<C-W>L")

-- Resize Splits
map("n", "<LocalLeader>H", "<C-W><")
map("n", "<LocalLeader>J", "<C-W>+")
map("n", "<LocalLeader>K", "<C-W>-")
map("n", "<LocalLeader>L", "<C-W>>")

-- Yanking
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
