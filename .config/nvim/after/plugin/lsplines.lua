--[[ local status, lsplines = pcall(require, "lsp_lines")
if not status then
	return
end ]]

-- lsplines.setup()

vim.diagnostic.config({
	virtual_text = false,
})
