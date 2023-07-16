local g = vim.g

require("impatient")

local builtin_plugs = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"matchit",
	"matchparen",
	"logiPat",
	"rrhelper",
}

for i = 1, #builtin_plugs do
	g["loaded_" .. builtin_plugs[i]] = true
end

g.did_load_filetypes = 1

require("options")
require("keybinds")

-- impatient.enable_profile()
require("plugins")
