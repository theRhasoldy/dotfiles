return {
  "nvim-telescope/telescope.nvim",
  name = "telescope",
  event = "UIEnter",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git/" },
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
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--smart-case",
        "--column",
      },
      sorting_strategy = "ascending",
      dynamic_preview_title = true,
      wrap_results = true,
      selection_caret = "  ",
      prompt_prefix = "    ",
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files" },
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
      live_grep_args = {
        find_command = { "rg", "--files" },
        auto_quoting = true,
      },
      file_browser = {
        initial_mode = "normal",
        hijack_netrw = true,
        path = "%:p:h",
        cwd_to_path = true,
        hidden = true,
        dir_icon = "",
        use_fd = true,
        grouped = true,
        theme = "ivy",
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
          previewer = true,
          initial_mode = "normal",
        })
      end,
      desc = "Show notifications",
    },
  },
  config = function(_, opts)
    local present, telescope = pcall(require, "telescope")
    if not present then
      return
    end
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("notify")
    telescope.load_extension("harpoon")
    telescope.load_extension("live_grep_args")
  end,
}
