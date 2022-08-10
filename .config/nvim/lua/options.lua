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

	au FocusGained,BufEnter * :checktime

	set nocompatible
	set signcolumn=yes
]])

--Show relative numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = true

--Indentation
opt.ai = true
opt.si = true
opt.smarttab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftround = true

--Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.path:append({ "**" }) -- Finding Files

--Text Rendering
opt.linebreak = true
opt.scrolljump = 1
opt.wrap = false

--User Interface
opt.wildmenu = true
opt.wildignore:append({ "*/node_modules/*" })
-- opt.winbar = "%f" --New in neovim 0.8
opt.showmode = false

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

opt.completeopt = "menu,menuone,noselect,noinsert"
opt.shortmess:append("c")

opt.laststatus = 3

vim.g.did_load_filetypes = 1

vim.g.vimwiki_list = { { path = "~/Universe", syntax = "markdown", ext = ".md" } }
