local path = vim.split(package.path, ";")

return {
	{
		"williamboman/mason.nvim",
		event = "BufReadPre",
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
		event = "BufReadPre",
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
			local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl })
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local attach_settings = function(client)
				-- Disabled built-in lsp formatting, handled by null-ls
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end

			local defaults = {
				capabilities = capabilities,
				on_attach = attach_settings,
			}

			local border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			-- To instead override globally
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

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
						},
						-- maxPreload = 2000,
						-- preloadFileSize = 50000,
						checkThirdParty = true,
					},
					completion = {
						workspaceWord = true,
						callSnippet = "Replace",
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

			lsp["marksman"].setup(defaults)

			lsp["tsserver"].setup({
				defaults,
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "literal",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = false,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			})

			lsp["astro"].setup({
				defaults,
				format = {
					indentFrontmatter = true,
				},
			})

			lsp["html"].setup({
				defaults,
				single_file_support = true,
				filetypes = { "html" },
			})

			lsp["emmet_ls"].setup(defaults)

			lsp["yamlls"].setup(defaults)

			lsp["jsonls"].setup(defaults)

			lsp["cssls"].setup(defaults)

			vim.diagnostic.config({
				underline = false,
				update_in_insert = true,
				float = {
					source = "if_many",
				},
				virtual_text = {
					spacing = 4,
					-- source = "if_many",
					prefix = "󰊠 ",
					-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					-- prefix = "icons",
					severity_sort = true,
				},
			})
		end,
		keys = {
			{
				mode = "n",
				"<Leader><Leader>",
				function()
					vim.diagnostic.open_float()
				end,
				desc = "Line Diagnostics",
			},
			{
				mode = "n",
				"gtd",
				function()
					require("telescope.builtin").lsp_definitions({ reuse_win = true })
				end,
				desc = "Go to definition",
			},
			{
				mode = "n",
				"gd",
				function()
					vim.lsp.buf.hover()
				end,
				desc = "Hover details",
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
				mode = { "n", "v" },
				"ga",
				function()
					vim.lsp.buf.code_action()
				end,
				desc = "Code actions provided by LSP",
			},
			{
				mode = "n",
				"gr",
				function()
					vim.lsp.buf.rename()
				end,
				desc = "Rename under cursor",
			},
			{
				mode = "i",
				"<C-k>",
				function()
					vim.lsp.buf.signature_help()
				end,
				desc = "Signature Help",
			},
		},
	},
	{
		"kosayoda/nvim-lightbulb",
		event = "BufReadPre",
		opts = {
			priority = 100,
			sign = {
				enabled = true,
				text = " ",
				hl = "Special",
			},

			-- 5. Number column.
			number = {
				enabled = false,
				hl = "Special",
			},
			autocmd = {
				-- Whether or not to enable autocmd creation.
				enabled = true,
				updatetime = 200,
				events = { "CursorHold", "CursorHoldI" },
				pattern = { "*" },
			},
		},
	},
}
