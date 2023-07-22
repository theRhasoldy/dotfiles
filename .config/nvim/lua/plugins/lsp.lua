local path = vim.split(package.path, ";")

return {
	{
		"williamboman/mason.nvim",
		name = "mason",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ui = {
				check_outdated_packages_on_open = true,
				border = "single",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			-- disable lsp watcher. Too slow on linux
			local ok, wf = pcall(require, "vim.lsp._watchfiles")
			if ok then
				wf._watchfunc = function()
					return function() end
				end
			end
		end,
		config = function()
			-- Set Custom Icons
			local signs = { Error = " ", Warn = " ", Hint = "?", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl })
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local attach_settings = function(client, bufnr)
				-- Disabled built-in lsp formatting, handled by null-ls
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end

			local defaults = {
				capabilities = capabilities,
				on_attach = attach_settings,
			}

			-- Language server configs
			local lsp = require("lspconfig")

			lsp["lua_ls"].setup({
				defaults,
				inlay_hints = { enabled = true },
				single_file_support = true,
				settings = {
					workspace = {
						runtime = {
							version = "luajit",
							-- Setup your lua path
							path = path,
						},
						library = {
							vim.api.nvim_get_runtime_file("", true),
							-- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
							-- [vim.fn.stdpath("config") .. "/lua"] = true,
						},
						-- maxPreload = 2000,
						-- preloadFileSize = 50000,
						checkThirdParty = true,
					},
					completion = {
						workspaceWord = true,
						callSnippet = "Both",
					},
					format = {
						enable = false,
					},
					telemetry = {
						enable = false,
					},
				},
			})

			lsp["bashls"].setup({
				single_file_support = true,
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh" },
			})

			lsp["tsserver"].setup(defaults)

			lsp["astro"].setup({
				defaults,
				format = {
					indentFrontmatter = true,
				},
			})

			lsp["html"].setup(defaults)

			lsp["emmet_ls"].setup(defaults)

			lsp["yamlls"].setup(defaults)

			lsp["jsonls"].setup(defaults)

			lsp["cssls"].setup(defaults)

			vim.diagnostic.config({
				virtual_text = true, -- Disable virtual text
				severity_sort = true, -- sorts diagnostics by severity (errors first)
				autoformat = false,
			})
		end,
		keys = {
			{
				mode = "n",
				"gtd",
				function()
					vim.lsp.buf.definition()
				end,
			},
			{
				mode = "n",
				"gd",
				function()
					vim.lsp.buf.hover()
				end,
			},
			{
				mode = "n",
				"gn",
				function()
					vim.diagnostic.goto_next()
				end,
			},
			{
				mode = "n",
				"gN",
				function()
					vim.diagnostic.goto_prev()
				end,
			},
			{
				mode = "n",
				"ga",
				function()
					vim.lsp.buf.code_action()
				end,
			},
			{
				mode = "n",
				"gR",
				function()
					vim.lsp.buf.references()
				end,
			},
			{
				mode = "n",
				"gr",
				function()
					vim.lsp.buf.rename()
				end,
			},
			{
				mode = "i",
				"<C-k>",
				function()
					vim.lsp.buf.signature_help()
				end,
			},
		},
	},
}
