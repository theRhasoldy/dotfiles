require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'pinkmare',
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {
		{
			'filetype',
			colored = true,   -- Displays filetype icon in color if set to true
			icon_only = true, -- Display only an icon for filetype
		}
	},
	lualine_c = {'filename'},
	lualine_x = {'branch', 'diff', 'diagnostics', 'encoding'},
	lualine_y = {'location'},
	lualine_z = {}
},
inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {}
},
tabline = {},
extensions = {}
}
