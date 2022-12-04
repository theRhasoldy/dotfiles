local status, null = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null.builtins.formatting
-- local diagnostics = null.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = { "--double-quote", "--jsx-double-quote", "--tab-width 2", "--use-tabs" },
		}),
		formatting.stylua,
		--[[ diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
			extra_args = { "--no-eslintrc" },
		}), ]]
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
