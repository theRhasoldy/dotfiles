return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    -- run = ":TSUpdate",
    event = "BufReadPre",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
          separator = "",
        },
      },
      -- Highlight related blocks
      {
        "nvim-treesitter/nvim-treesitter-refactor",
      },
      {
        "tzachar/local-highlight.nvim",
        config = function()
          require("local-highlight").setup({
            hlgroup = "Visual",
          })
        end,
      },
    },
    opts = {
      auto_install = true,
      ensure_installed = {
        -- Lua
        "lua",
        -- Shell
        "bash",
        -- Web
        "html",
        "css",
        "javascript",
        "scss",
        "tsx",
        "typescript",
        -- Other
        "json",
        "yaml",
        "rasi",
        "markdown",
      },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
      autotag = { enable = true },
      refactor = {
        highlight_current_scope = { enable = true },
        clear_on_cursor_move = false,
        highlight_definitions = { enable = true },
      },
      pairs = {
        enable = true,
      },
      playground = {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      },
    },
    config = function(_, opts)
      local present, treesitter_config = pcall(require, "nvim-treesitter.configs")
      if not present then
        return
      end
      treesitter_config.setup(opts)
    end,
  },
  {
    "nvim-treesitter/playground",
    cmd = { "TSHighlightCapturesUnderCursor" },
  },
}
