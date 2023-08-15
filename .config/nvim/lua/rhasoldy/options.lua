local opt = vim.opt

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- General
opt.termguicolors = true
opt.shell = "zsh"
opt.hidden = true
opt.updatetime = 50

opt.confirm = true
opt.autoread = true

-- Line Numbers
opt.rnu = true
opt.nu = true

-- Statusline
opt.signcolumn = "yes"
opt.laststatus = 3 -- Global Statusline
opt.showmode = false

-- Tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = false -- Tabs not spaces!
opt.shiftround = true

opt.smartindent = true
opt.autoindent = true

opt.backspace = { "start", "eol", "indent" }

-- Useless files
opt.swapfile = false
opt.backup = false
vim.g.did_load_filetypes = 1 -- Disable built-in filetype detection and use plugin instead

-- Undo
opt.history = 1000
opt.undofile = true
opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undo"

-- Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Editing
opt.wrap = false
opt.equalalways = true

vim.g.markdown_fenced_languages = { "javascript", "typescript", "scss", "css", "html" }
