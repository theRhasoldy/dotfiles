local api = vim.api

-- Disable netrw autostart
local Builtins = api.nvim_create_augroup("Builtins", {clear = true}) 
api.nvim_clear_autocmds({ group = Builtins })
api.nvim_create_autocmd("VimEnter", {
  command = "silent! au! FileExplorer *", 
  group = Builtins
})

local g = vim.g
g.loaded_gzip = 0
g.loaded_zip = 0
g.loaded_zipPlugin = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0

g.loaded_getscript = 0
g.loaded_getscriptPlugin = 0
g.loaded_vimball = 0
g.loaded_vimballPlugin = 0
g.loaded_2html_plugin = 0

g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_logiPat = 0
g.loaded_rrhelper = 0

g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
g.loaded_netrwSettings = 0
