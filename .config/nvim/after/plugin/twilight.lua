local status, twilight = pcall(require, "twilight")
if not status then
	return
end

twilight.setup({
	dimming = {
		alpha = 0.5,
		color = { "Normal", "#ffffff" },
		inactive = true,
	},
	context = 10,
	treesitter = true,
	expand = { "function", "method", "class", "if_statement" },
	exclude = {},
})
