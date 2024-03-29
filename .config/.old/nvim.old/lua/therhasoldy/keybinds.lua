local key = vim.keymap.set

key("n", " ", "")
vim.g.mapleader = " "

-- Reload
key("n", "<Leader>r", "<cmd>source<CR>")

-- Fast horizontal movement
key("", "H", "^")
key("", "L", "$")

key("n", "<C-a>", "gg<S-v>G") -- Select all

-- Splits
key("n", "<Leader>-", "<cmd>split<CR>")
key("n", "<Leader>=", "<cmd>vsplit<CR>")
key("n", "<C-q>", "<cmd>q<CR>")
key("n", "<Space>+", "<C-w>=")

key("n", "<C-w>", "<C-W>W") -- Focus window

-- Resize splits
key("n", "<Leader>h", "<C-W>H")
key("n", "<Leader>j", "<C-W>J")
key("n", "<Leader>k", "<C-W>K")
key("n", "<Leader>l", "<C-W>L")

-- Switch lines
key("n", "<A-j>", ":m .+1<CR>==", { silent = true })
key("n", "<A-k>", ":m .-2<CR>==", { silent = true })
key("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
key("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- Add newline
key("n", "<CR>", "o<Esc>")
key("n", "<S-CR>", "O<Esc>")

key("n", "<Leader>zz", "<cmd>autocmd! StayCentered<CR>")

key("i", "<C-BS>", "<ESC>cvb") -- No BS ctrl-backspace

-- Yanking
key("x", "<leader>p", [["_dP]])
key({ "n", "v" }, "<leader>y", [["+y]])
key("n", "<leader>Y", [["+Y]])
