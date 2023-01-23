return {
	"hrsh7th/nvim-cmp",
	name = "cmp",
	lazy = true,
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = function()
		local cmp = require("cmp")
		return {
			-- Disable cmp in comments
			enabled = function()
				local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
				if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
					return false
				end
				local context = require("cmp.config.context")
				return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
			end,

			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			window = {
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None,PmenuThumb:BorderBG",
				}),
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
				}),
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-c>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "buffer", keyword_length = 5 },
				{ name = "path" },
			}),

			experimental = {
				ghost_text = {
					hl_group = "Title",
				},
			},
		}
	end,
}
