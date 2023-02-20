return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- Macros message
      routes = {
        {
          view = "cmdline",
          filter = { event = "msg_showmode" },
        },
      },
      lsp = {
        progress = {
          enabled = false,
        },
        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = true,
        },
        -- defaults for hover and signature help
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    dependencies = {
      {
        "mrded/nvim-lsp-notify",
        config = function()
          require("lsp-notify").setup({
            notify = require("notify"),
          })
        end,
      },
    },
    event = "VeryLazy",
    opts = {
      top_down = false,
      fps = 60,
      render = "compact",
    },
  },
}
