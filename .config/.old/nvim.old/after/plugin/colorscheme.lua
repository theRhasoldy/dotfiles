function Colorscheme(color)
	color = color or "dahlia"
	vim.cmd.colorscheme(color)
end

Colorscheme()

-- vim.api.nvim_set_hl(0, "Normal", { ctermfg = White, ctermbg = nil })
