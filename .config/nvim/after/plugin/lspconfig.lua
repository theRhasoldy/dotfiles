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

-- Servers Setup {{{
lspconfig["sumneko_lua"].setup({
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
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["bashls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["cssls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["cssmodules_ls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["eslint"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["marksman"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["html"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["intelephense"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["jsonls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["lemminx"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["pyright"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["dartls"].setup({
	autostart = true,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["sqls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["vimls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["yamlls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig["emmet_ls"].setup({
	flags = lsp_flags,
	capabilities = capabilities,
})
-- }}}
