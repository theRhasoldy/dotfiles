return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
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
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lsp_signature_help" },
          { name = "path" },
          { name = "buffer", keyword_length = 5, max_item_count = 10 },
        }),

        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 100,
            ellipsis_char = "...",
          }),
        },

        experimental = {
          ghost_text = {
            hl_group = "Title",
          },
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- cmp.setup.filetype("html", {
      --   sources = cmp.config.sources({
      --     { name = "nvim_lsp" },
      --     { name = "nvim_lsp_signature_help" },
      --     { name = "path" },
      --     { name = "buffer", keyword_length = 5, max_item_count = 10 },
      --   }),
      -- })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
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
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },
}
