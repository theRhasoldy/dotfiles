local opt = vim.opt
local cmd = vim.cmd

-- Format Options
cmd([[
	augroup FormatOptions
		autocmd!
		autocmd FileType * set fo=tj
	augroup end

	augroup CenterCursorNormal
		autocmd!
		autocmd CursorMoved * normal! zz
	augroup END

	set nocompatible
	filetype plugin on
	syntax on
]])

--Show relative numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = true

--Indetation
opt.autoindent = true
opt.smarttab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftround = true

--Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

--Text Rendering
opt.linebreak = true
opt.scrolljump = 1

--User Interface
opt.wildmenu = true
opt.winbar = "%f" --New in neovim 0.8
vim.opt.showmode = false
--Files
opt.confirm = true
opt.autoread = true
opt.dir = "~/.cache/nvim"
opt.swapfile = false

--Misc
vim.opt.termguicolors = true
opt.hidden = true
opt.history = 10000
opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.laststatus = 3

vim.g.did_load_filetypes = 1

vim.g.vimwiki_list = { { path = "~/Universe", syntax = "markdown", ext = ".md" } }
