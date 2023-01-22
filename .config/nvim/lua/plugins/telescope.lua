return {
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = {
      defaults = {
        layout_strategy = 'vertical',
      },
      pickers = {
        find_files = {
          no_ignore = false,
          hidden = true,
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
        },
        file_browser = {
          theme = "ivy",
        },
      },
    },
    config = function(_, opts)
      local present, telescope = pcall(require, "telescope")
      if not present then
        return
      end
      telescope.setup(opts)
    end,
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<leader>fg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
      },
    },
  },
}
