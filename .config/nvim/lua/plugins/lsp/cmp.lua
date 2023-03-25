return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
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
        window = {
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
          }),
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
          }),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-J>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-K>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-d>"] = cmp.mapping.scroll_docs( -4),
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
        }),
        -- General soucres
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer",                 keyword_length = 5, max_item_count = 10 },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
          }),
        },
        experimental = {
          ghost_text = {
            hl_group = "NonText",
          },
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- Lua specific
      cmp.setup.filetype("lua", {
        sources = cmp.config.sources({
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "path" },
          { name = "buffer",                 keyword_length = 5, max_item_count = 10 },
        }),
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    opts = {
      history = false,
      delete_check_events = "TextChanged,TextChangedI",
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
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
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
        end,
        expr = true,
        silent = true,

        mode = { "i", "s" },
      },
      {
        "<s-Tab>",
        function()
          require("luasnip").jump( -1)
        end,
        mode = { "i", "s" },
      },
    },
  },
}
