local api = vim.api

-- Auto reload files to detect changes
local AutoReload = api.nvim_create_augroup("AutoReload", { clear = true })
api.nvim_clear_autocmds({ group = AutoReload })
api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = ":checktime",
  group = AutoReload,
})

-- Format Options
local FormatOptions = api.nvim_create_augroup("FormatOptions", { clear = true })
api.nvim_clear_autocmds({ group = FormatOptions })
api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- Telescope on startup
local HarpoonStartup = api.nvim_create_augroup("HarpoonStartup", { clear = true })
api.nvim_clear_autocmds({ group = HarpoonStartup })
api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("telescope").extensions.harpoon.marks({
      initial_mode = "normal",
    })
  end,
})

-- Lazy load clipboard
local LoadClipboard = api.nvim_create_augroup("LoadClipboard", { clear = true })
api.nvim_clear_autocmds({ group = LoadClipboard })
api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.clipboard = "unnamedplus"
  end,
})
