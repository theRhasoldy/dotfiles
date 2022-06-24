local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader
map("n", "<space>", "")
vim.g.mapleader = " "

-- Fast source
map("n", "<leader>r", ":source<CR>")

map("n", "o", "zzo")

-- Splits {{{
-- Make Split
map("n", "<Leader>-", "<C-w>s")
map("n", "<Leader>=", "<C-w>v")

-- Navigate Split
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")
map("n", "<C-x>", "<C-W>p")

-- Manipulate Splits
map("n", "<Leader>h", "<C-W>H")
map("n", "<Leader>j", "<C-W>J")
map("n", "<Leader>k", "<C-W>K")
map("n", "<Leader>l", "<C-W>L")
-- }}}

-- Switch lines
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- Nvim tree
map("n", "<Leader>n", ":NvimTreeToggle<CR>")
map("n", "<C-n>", ":NvimTreeFocus<CR>")

-- Telescope
map("n", "<Leader>f", ":Telescope find_files<CR>")

