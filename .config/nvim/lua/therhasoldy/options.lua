local opt = vim.opt

opt.termguicolors = true
opt.shell = "zsh"
opt.clipboard = "unnamedplus" -- System clipboard
opt.hidden = true
opt.updatetime = 50

--  Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.autoindent = true
opt.smartindent = true

-- Tab width & indent
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true
opt.si = true -- Smart indent
opt.ai = true -- Auto indent

opt.backspace = { "start", "eol", "indent" }

-- Relative line numbers
opt.number = true
opt.rnu = true

-- Nvim files
opt.swapfile = false
opt.backup = false

-- Undo
opt.history = 10000
opt.undofile = true -- Undo history
opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undo"

-- Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Files
opt.confirm = true
opt.autoread = true

opt.signcolumn = "yes"
opt.laststatus = 3 -- Global Statusline
opt.showmode = false

opt.wrap = false
-- opt.showbreak = "﬌ "

opt.equalalways = true

vim.g.did_load_filetypes = 1

vim.g.perl_host_prog = "$XDG_DATA_HOME/perl5/"
