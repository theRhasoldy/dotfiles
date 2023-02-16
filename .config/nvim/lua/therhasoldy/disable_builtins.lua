local api = vim.api

-- Disable netrw autostart
local Builtins = api.nvim_create_augroup("Builtins", { clear = true })
api.nvim_clear_autocmds({ group = Builtins })
api.nvim_create_autocmd("VimEnter", {
  command = "silent! au! FileExplorer *",
  group = Builtins,
})

local g = vim.g

g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.did_load_filetypes = 1
