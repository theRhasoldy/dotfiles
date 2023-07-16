local status, tscontext = pcall(require, "treesitter-context")
if not status then
	return
end

tscontext.setup({
	patterns = {
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
	},
	separator = "",
})
