local cmp = require("cmp")
local lspkind = require("lspkind")

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip").filetype_extend("all", { "_)" })

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append("c")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	-- Disable cmp in comments
	enabled = function()
		local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
		if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
			return false
		end
		local context = require("cmp.config.context")
		return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
	end,

	mapping = cmp.mapping.preset.insert({
		["<C-J>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-K>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<c-space>"] = cmp.mapping({
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
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),

	-- Lspkind
	formatting = {
		format = lspkind.cmp_format({

			mode = "symbol",
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})

-- Lspkind
require("lspkind").init({
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "text",

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
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
	},
})
