-- Configure lazy if not installed {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- }}}

local present, lazy = pcall(require, "lazy")
if not present then
  return
end

lazy.setup({
  spec = "plugins",
  install = { colorscheme = { "dahlia" } },
  -- checker = { enabled = true }, -- automatically check for plugin updates
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
  },
  ui = {
    border = "single",
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrw",
        "netrwSettings",
        "netrwPlugin",
        "netrwFileHandlers",
        "tar",
        "tarPlugin",
        "tohtml",
        "2html_plugin",
        "tutor",
        "tutor_mode_plugin",
        "zip",
        "zipPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "logiPat",
        "rrhelper",
        "filetype",
        "rplugin",
      },
    },
  },
})
