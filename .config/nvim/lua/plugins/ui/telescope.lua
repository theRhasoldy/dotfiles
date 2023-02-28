return {
  "nvim-telescope/telescope.nvim",
  name = "telescope",
  event = "UIEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = {
    defaults = {
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
      layout_strategy = "vertical",
      vimgrep_arguments = {
        "rg",
        "--with-filename",
        "--line-number",
        "--smart-case",
        "--column",
      },
      sorting_strategy = "ascending",
      dynamic_preview_title = true,
      wrap_results = true,
      selection_caret = "  ",
      prompt_prefix = "   ",
      preview = {
        treesitter = true,
      },
    },
    pickers = {
      find_files = {
        file_ignore_patterns = { "node_modules", "git" },
        no_ignore = false,
        hidden = true,
      },
      diagnostics = {
        theme = "cursor",
        layout_config = {
          width = 0.9,
        },
      },
    },
    extensions = {
      extensions_list = { "themes", "terms", "live_grep_args", "noice", "file_browser", "harpoon" },
      live_grep_args = {
        auto_quoting = true,
      },
      file_browser = {
        hijack_netrw = true,
        path = "%:p:h",
        cwd_to_path = true,
        hidden = true,
        dir_icon = "",
        use_fd = true,
        grouped = true,
        theme = "ivy",
        initial_mode = "normal",
      },
    },
  },
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
        require("telescope").extensions.live_grep_args.live_grep_args()
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
          previewer = false,
          initial_mode = "normal",
        })
      end,
      desc = "Show notifications",
    },
  },
}
