local null = require("null-ls")

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--double-quote", "--jsx-double-quote" } }),
		formatting.stylua,
		diagnostics.eslint,
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
