return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	config = function()
		local status, null = pcall(require, "null-ls")
		if not status then
			return
		end

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local formatting = null.builtins.formatting

		null.setup({
			sources = {
				formatting.stylua,
				formatting.prettier.with({
					extra_args = { "--double-quote", "--jsx-double-quote", "--tab-width 2", "--use-tabs" },
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
