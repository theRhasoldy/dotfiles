local api = vim.api
vim.opt.termguicolors = true

vim.cmd("colorscheme nisha")
api.nvim_set_hl(0, "Normal", { bg=nil })
api.nvim_set_hl(0, "NonText", { bg=nil })
api.nvim_set_hl(0, "EndOfBuffer", { bg=nil, fg="#3d3d3d" })
-- api.nvim_set_hl(0, "MatchParen", { bg="#bebebe" })
api.nvim_set_hl(0, "Pmenu", { bg="#121418" })
api.nvim_set_hl(0, "PmenuSbar", { bg=nil })
api.nvim_set_hl(0, "PmenuThumb", { bg=nil })
