opt = vim.opt

opt.termguicolors = true

vim.cmd("colorscheme pinkmare")
vim.api.nvim_set_hl(0, "Normal", { bg=nil })
vim.api.nvim_set_hl(0, "NonText", { bg=nil })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg=nil, fg="#202020" })
vim.api.nvim_set_hl(0, "MatchParen", { bg="#b75566" })

