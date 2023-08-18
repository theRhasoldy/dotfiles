local symbols = {
	Text = "󰚞",
	Method = "󰆩",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "󱉸",
	Value = "󱢏",
	Enum = "",
	Keyword = "",
	Snippet = "󰆐",
	Color = "󰌁",
	File = "󰈔",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "󱌣",
	TypeParameter = "󰉺",
}

return {
	"hrsh7th/nvim-cmp",
	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		{
			"onsails/lspkind.nvim",
			event = "BufReadPre",
			config = function()
				require("lspkind").init({
					mode = "symbol",
					preset = "codicons",
					symbol_map = symbols,
				})
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			opts = {
				history = true,
			},
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip").filetype_extend("javascript", { "javascript" })
				end,
			},
			keys = {
				{
					"<Tab>",
					mode = { "i", "s" },
					function()
						if require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump()
						else
							return "<Tab>"
						end
					end,
					expr = true,
					silent = true,
				},
				{
					"<s-Tab>",
					mode = { "i", "s" },
					function()
						if require("luasnip").jumpable(-1) then
							require("luasnip").jump(-1)
						end
					end,
					expr = true,
					silent = true,
				},
			},
		},
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
				}),
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-J>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-K>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-c>"] = cmp.mapping({
					i = cmp.mapping.complete(),
					c = function(
						_ --[[fallback]]
					)
						if cmp.visible() then
							if not cmp.confirm({ select = true }) then
								return
							end
						else
							cmp.complete()
						end
					end,
				}),
				["<C-s>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
				{ name = "buffer", keyword_length = 5, max_item_count = 10 },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol",
				}),
			},
		})

		cmp.setup.filetype("lua", {
			sources = cmp.config.sources({
				{ name = "nvim_lua" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
				{ name = "buffer", keyword_length = 5, max_item_count = 10 },
			}),
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})
	end,
}
