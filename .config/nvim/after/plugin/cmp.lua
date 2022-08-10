local status, cmp = pcall(require, "cmp")
if not status then
	return
end
local lspkind = require("lspkind")

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip").filetype_extend("all", { "_)" })

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
	window = {
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None,PmenuThumb:BorderBG",
		}),
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-J>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-K>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-a>"] = cmp.mapping({
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
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	}),
	formatting = {
		format = lspkind.cmp_format({ wirth_text = true, maxwidth = 50 }),
	},
})
