local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
	debounce_text_changes = 150,
}

local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
		vim.api.nvim_command([[augroup END]])
		vim.api.nvim_command([[autocmd FileType dart setlocal shiftwidth=2 tabstop=2]])
	end
end

-- Servers Setup {{{
lspconfig["sumneko_lua"].setup({
	on_attach = on_attach,
	autostart = true,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
		workspace = {
			-- Make server aware of neovim runtime files
			library = vim.api.nvim_get_runtime_file("", true),
		},
	},
})

lspconfig["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["bashls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["cssls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["cssmodules_ls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["eslint"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["marksman"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["html"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["intelephense"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["jsonls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["lemminx"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["dartls"].setup({
	on_attach = on_attach,
	autostart = true,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["sqls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["vimls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["yamlls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["emmet_ls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
-- }}}
