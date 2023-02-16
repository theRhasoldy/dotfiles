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
        -- override markdown rendering so that **cmp** and other plugins use Treesitter
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = true,
          -- Lsp Progress is formatted using the builtins for lsp_progress
          throttle = 2000 / 30, -- frequency to update lsp progress message
          format = "lsp_progress",
          format_done = "lsp_progress_done",
          view = "notify",
        },
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
    event = "VeryLazy",
    opts = {
      top_down = false,
      fps = 60,
      render = "compact",
    },
  },
}
