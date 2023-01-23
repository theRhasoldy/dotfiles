local symbols = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

return {
	{
		"neovim/nvim-lspconfig",
		name = "lspconfig",
		lazy = true,
		event = "BufReadPre",
		opts = {
			-- Global settings
			diagnostics = {
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			},
			autoformat = true,

			-- Server specific settings
			servers = {
				tsserver = {},
				sumneko_lua = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			},
			setup = {},
		},
		config = function(_, opts)
			-- Custom sign column diagnostics icon
			local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl })
			end

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = servers[server] or {}

				server_opts.capabilities = capabilities

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local present, mason = pcall(require, "mason-lspconfig")
			if not present then
				return
			end

			mason.setup({ ensure_installed = vim.tbl_keys(servers) }) -- Get all servers installed by Mason
			mason.setup_handlers({
				function(server)
					if servers[server] == false then
						return
					end
					local server_opts = servers[server] or {}
					local exist, lsp = pcall(require, "lspconfig")
					if not exist then
						return
					end
					lsp[server].setup(server_opts) -- Apply opts to all installed servers and initialize them
				end,
			})

			require("mason-lspconfig").setup_handlers({ setup })

			-- Disable virtual text
			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		name = "lspsaga",
		lazy = true,
		event = "BufRead",
		opts = {
			diagnostic = {
				keys = {
					quit = "<Esc>",
				},
			},
			lightbulb = {
				virtual_text = true,
				sign = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
			rename = {
				quit = "q",
			},
			ui = {
				border = "single",
				theme = "none",
				code_action = "",
				diagnostic = " ",
				colors = {
					normal_bg = "#141313",
				},
			},
			kind = { symbols },
		},
		keys = {
			{
				"j",
				"j<cmd>Lspsaga show_line_diagnostics<CR>",
			},
			{
				"gr",
				"<cmd>Lspsaga rename<CR>",
			},
			{
				"ga",
				"<cmd>Lspsaga code_action<CR>",
			},
			{
				"gd",
				"<cmd>Lspsaga peek_definition<CR>",
			},
			{
				"gtd",
				"<cmd>Lspsaga goto_definition<CR>",
			},
		},
		config = function(_, opts)
			local present, saga = pcall(require, "lspsaga")
			if not present then
				return
			end
			saga.setup(opts)
		end,
	},

	{
		"onsails/lspkind.nvim",
		name = "lspkind",
		lazy = true,
		event = "BufReadPre",
		config = function()
			local present, kind = pcall(require, "kind")
			if not present then
				return
			end
			kind.init({
				mode = "symbol",
				symbol_map = { symbols },
			})
		end,
	},
}
