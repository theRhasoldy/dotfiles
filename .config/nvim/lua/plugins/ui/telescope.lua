return {
  "nvim-telescope/telescope.nvim",
  name = "telescope",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = {
    defaults = {
      dynamic_preview_title = true,
      path_display = { "smart" },
      layout_strategy = "vertical",
      prompt_prefix = "    ",
      selection_caret = "  ",

      -- Optimizations
      cache_picker = false,
      file_ignore_patterns = { "node_modules", ".git/" },

      preview = {
        filesize_limit = 2,
        treesitter = true,
      },

      mappings = {
        i = {
          ["<C-q>"] = "close",
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
        n = {
          ["q"] = "close",
        },
      },
    },

    builtin = {
      find_files = {
        find_command = { "rg", "--files" },
        hidden = true,
      },

      diagnostics = {
        theme = "ivy",
      },
    },

    extensions = {
      fzf = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },
      live_grep_args = {
        find_command = { "rg", "--files" },
        auto_quoting = true,
      },

      file_browser = {
        initial_mode = "normal",
        hijack_netrw = true,
        cwd_to_path = true,
        hidden = true,
        path = "%:p:h",
        dir_icon = "",
        grouped = true,
        theme = "ivy",
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Search files",
    },
    {
      "<leader>n",
      function()
        require("telescope").extensions.file_browser.file_browser({})
      end,
      desc = "Open file browser",
    },
    {
      "<leader>fg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args({
          previewer = true,
        })
      end,
      desc = "Search keyword",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Show diagnostics",
    },
    {
      "<leader>fn",
      function()
        require("telescope").extensions.noice.noice({
          initial_mode = "normal",
        })
      end,
      desc = "Show notifications",
    },
  },
}
