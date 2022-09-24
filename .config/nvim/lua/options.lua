local opt = vim.opt
local cmd = vim.cmd

-- Format Options
cmd([[
	augroup FormatOptions
		autocmd!
		autocmd FileType * set fo=tj wrap
	augroup end

	au FocusGained,BufEnter * :checktime

	set nocompatible
	set signcolumn=yes

	syntax on
	filetype plugin on
]])

--Show relative numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = true

--Indentation
opt.ai = true
opt.si = true
opt.smarttab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftround = true

--Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.path:append({ "**" }) -- Finding Files

--Text Rendering
opt.display = "lastline"
opt.scrolljump = 1
vim.wo.wrap = true
vim.wo.linebreak = true
opt.showbreak = "﬌"

--User Interface
opt.wildmenu = false -- Handeled by wilder plugin
opt.wildignore:append({ "*/node_modules/*" })
-- opt.winbar = "%f" --New in neovim 0.8
opt.showmode = false
opt.cmdheight = 1

--Files
opt.confirm = true
opt.autoread = true
opt.dir = "~/.cache/nvim"
opt.swapfile = false

--Misc
opt.termguicolors = true
opt.hidden = true
opt.history = 10000
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.backspace = "start,eol,indent"
opt.timeoutlen = 1000

opt.completeopt = "menu,menuone,noselect,noinsert"
opt.shortmess:append("c")
opt.laststatus = 3

vim.g.did_load_filetypes = 1
