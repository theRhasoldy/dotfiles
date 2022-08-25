local status, feline = pcall(require, "feline")
if not status then
	return
end

local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local force_inactive = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}

local winbar_components = {
	active = { {}, {}, {} },
	inactive = { {}, {}, {} },
}

local components = {
	active = { {}, {}, {} },
	inactive = { {}, {}, {} },
}

local colors = {
	bg = "#15171C",
	black = "#0F1115",
	grey = "#707070",
	yellow = "#fbb45e",
	turqoise = "#3dc3ad",
	blue = "#2b9cc1",
	green = "#4dcb8f",
	orange = "#f38337",
	magenta = "#da7893",
	purple = "#c77cd1",
	white = "#eeeeee",
	fg = "#eeeeee",
	red = "#dd4e6d",
}

local vi_mode_colors = {
	NORMAL = "purple",
	OP = "green",
	INSERT = "blue",
	CONFIRM = "red",
	VISUAL = "red",
	LINES = "red",
	BLOCK = "red",
	REPLACE = "yellow",
	["V-REPLACE"] = "yellow",
	ENTER = "turqoise",
	MORE = "turqoise",
	SELECT = "orange",
	COMMAND = "green",
	SHELL = "green",
	TERM = "green",
	NONE = "yellow",
}

local vi_mode_text = {
	NORMAL = "",
	OP = "",
	INSERT = "",
	VISUAL = "",
	LINES = "",
	BLOCK = "",
	REPLACE = "",
	["V-REPLACE"] = "",
	ENTER = "",
	MORE = "",
	SELECT = "",
	COMMAND = "",
	SHELL = "",
	TERM = "",
	NONE = "",
	CONFIRM = "",
}

local buffer_not_empty = function()
	if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
		return true
	end
	return false
end

local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end

force_inactive.filetypes = {
	"NvimTree",
	"TelescopePrompt",
	"packer",
}

force_inactive.buftypes = {
	"terminal",
}

-- STATUSLINE {{{
-- LEFT
components.active[1][1] = {
	provider = " Rhasoldy ",
	hl = function()
		local val = {}

		val.bg = vi_mode_utils.get_mode_color()
		val.fg = "black"
		-- val.style = "bold"

		return val
	end,
	right_sep = "  ",
}
-- vi-symbol
components.active[1][2] = {
	provider = function()
		return vi_mode_text[vi_mode_utils.get_vim_mode()]
	end,
	hl = function()
		local val = {}
		val.fg = vi_mode_utils.get_mode_color()
		val.bg = "bg"
		-- val.style = "bold"
		return val
	end,
	right_sep = "  ",
}
-- filename
components.active[1][3] = {
	provider = function()
		return vim.fn.expand("%:F")
	end,
	hl = {
		fg = "grey",
		bg = "bg",
		-- style = "bold",
	},
}
-- MID
-- }}}

-- RIGHT {{{

-- gitBranch
components.active[3][1] = {
	provider = "git_branch",
	hl = {
		fg = "yellow",
		bg = "bg",
		left_sep = "  ",
		-- style = "bold",
	},
}
-- diffAdd
components.active[3][2] = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		bg = "bg",
		left_sep = "  ",
		-- style = "bold",
	},
}
-- diffModfified
components.active[3][3] = {
	provider = "git_diff_changed",
	hl = {
		fg = "orange",
		bg = "bg",
		left_sep = "  ",
		-- style = "bold",
	},
}
-- diffRemove
components.active[3][4] = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		bg = "bg",
		left_sep = "  ",
		-- style = "bold",
	},
}

-- fileIcon
components.active[3][5] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon
	end,
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		-- val.style = "bold"
		return val
	end,
	left_sep = "   ",
	right_sep = "   ",
}

-- fileSize
components.active[3][6] = {
	provider = "file_size",
	enabled = function()
		return vim.fn.getfsize(vim.fn.expand("%:t")) > 0
	end,
	hl = {
		fg = "skyblue",
		bg = "bg",
		-- style = "bold",
	},
	right_sep = "   ",
}

-- fileEncode
components.active[3][7] = {
	provider = "file_encoding",
	hl = {
		fg = "grey",
		bg = "bg",
		-- style = "bold",
	},
	right_sep = "   ",
}

-- Position
components.active[3][8] = {
	provider = "position",
	hl = {
		fg = "grey",
		bg = "bg",
		-- style = "bold",
	},
	right_sep = " ",
}

-- scrollBar
components.active[3][9] = {
	provider = "scroll_bar",
	hl = {
		fg = "grey",
		bg = "bg",
	},
}
-- }}}

-- INACTIVE

-- fileType
components.inactive[1][1] = {
	provider = "file_type",
	hl = {
		fg = "black",
		bg = "magenta",
		-- style = "bold",
	},
	left_sep = {
		str = " ",
		hl = {
			fg = "NONE",
			bg = "magenta",
		},
	},
	right_sep = {
		{
			str = " ",
			hl = {
				fg = "NONE",
				bg = "magenta",
			},
		},
		" ",
	},
}

-- Winbar {{{
-- LspName
winbar_components.active[1][1] = {
	provider = "lsp_client_names",
	hl = {
		fg = "grey",
		-- style = "bold",
	},
}

-- diagnosticErrors
winbar_components.active[3][1] = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
	end,
	hl = {
		fg = "red",
		style = "bold",
	},
}
-- diagnosticWarn
winbar_components.active[3][2] = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
	end,
	hl = {
		fg = "yellow",
		style = "bold",
	},
}
-- diagnosticHint
winbar_components.active[3][3] = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
	end,
	hl = {
		fg = "turqoise",
		style = "bold",
	},
}
-- diagnosticInfo
winbar_components.active[3][4] = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
	end,
	hl = {
		fg = "grey",
		style = "bold",
	},
}
-- }}}

feline.setup({
	theme = colors,
	default_bg = bg,
	default_fg = fg,
	vi_mode_colors = vi_mode_colors,
	components = components,
	force_inactive = force_inactive,
})

feline.winbar.setup({
	components = winbar_components,
	force_inactive = force_inactive,
})