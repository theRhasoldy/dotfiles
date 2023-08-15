require("rhasoldy.map")
require("rhasoldy.options")
require("rhasoldy.autocmds")

-- Init Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local present, lazy = pcall(require, "lazy")
if not present then
	return
end

lazy.setup("plugins", {
	defaults = {
		lazy = true,
		-- default `cond` you can use to globally disable a lot of plugins
		-- when running inside vscode for example
		cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
		-- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	dev = {
		-- Directory for local plugin projects
		path = "~/Projects/Lua",
	},
	install = {
		-- Try to load one of these colorschemes when starting an installation
		colorscheme = { "dahlia" },
	},
	performance = {
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
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
				"filetype",
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
				"rplugin",
			},
		},
	},
	ui = {
		border = "single",
		title = "Lazy Config", ---@type string only works when border is not "none"
		title_pos = "center", ---@type "center" | "left" | "right"
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = "✔ ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
	},
})

-- Plugins (Handled by Lazy Baby)
vim.go.loadplugins = false
