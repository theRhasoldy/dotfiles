local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = vim.opts

-- leader
map("n", "<Space>", "")
vim.g.mapleader = " "

map("n", "<C-b>", "")
map("n", "<C-n>", "")

map("n", "<Leader>r", ":luafile $MYVIMRC<CR>")

map("i", "<C-j>", "")
map("i", "<C-k>", "")
map("i", "<C-l>", "<Right>")
map("i", "<C-h>", "<Left>")

-- Faster jump to beginning and end of line
map("", "H", "^")
map("", "L", "$")

map("i", "<Esc>", "<Esc><Esc>") -- Exit cmp and insert mode

map("n", "<Leader>rn", ":set rnu!<CR>") -- Switch between line number modes

map("", "gg", "G")
map("", "G", "gg")

map("n", "x", '"_x') -- Don't yank with x
map("n", "s", '"_s') -- Don't yank with x

map("n", "<C-a>", "gg<S-v>G") -- Select all

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- CamelCase Movement
map("", "w", "<Plug>CamelCaseMotion_w")
map("", "b", "<Plug>CamelCaseMotion_b")
map("", "e", "<Plug>CamelCaseMotion_e")

-- Splits {{{
-- Make Split
map("n", "<Leader>-", "<C-w>s")
map("n", "<Leader>=", "<C-w>v")
map("n", "<Space>+", "<C-w>=")

map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

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

-- Line Manipulation {{{
-- Switch lines
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Add newline
map("n", "<A-o>", "o<Esc>")
map("n", "<A-S-o>", "O<Esc>")
-- }}}

-- Nvim tree
map("n", "<Leader>n", "<cmd>NeoTreeFloatToggle<CR>")

-- Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>fn", "<cmd>Telescope zk notes<CR>")
map("n", "<Leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Colorpicker
map("n", "<C-c>", "<cmd>PickColor<cr>", opts)
map("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- Hop
map("", "<Space><Space>", "<cmd>HopWord<CR>", {})
-- Hop to different parentheses
map("", "<Leader>(", "<cmd>HopChar1<CR>(", {})
map("", "<Leader>{", "<cmd>HopChar1<CR>{", {})
map("", "<Leader>[", "<cmd>HopChar1<CR>[", {})
map("", "<Leader>)", "<cmd>HopChar1<CR>)", {})
map("", "<Leader>}", "<cmd>HopChar1<CR>}", {})
map("", "<Leader>]", "<cmd>HopChar1<CR>]", {})

-- Lsp
map("n", "gD", "<cmd>Lspsaga preview_definition<CR>")
map("n", "gs", "<cmd>Telescope lsp_references<CR>")

map("n", "gd", "<cmd>Telescope diagnostics<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

map("n", "k", "k<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "j", "j<cmd>Lspsaga show_line_diagnostics<CR>")

map("n", "ga", "<cmd>Lspsaga code_action<CR>")
map("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Twilight
map("n", ";", "<cmd>Twilight<CR>")

-- Harpoon
map("n", "m", "")
map("n", "m", "<cmd>lua require('harpoon.mark').add_file()<CR>")
map("n", "<Leader>m", "<cmd>Telescope harpoon marks<CR>")
