local cmd = vim.cmd
cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  name = "neo-tree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
    },
    buffers = {
      follow_current_file = true,
      show_unloaded = true,
    },
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "󰧮",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = " ",
        highlight = "NeoTreeModified",
      },
      indent = {
        with_markers = false,
        with_expanders = true,
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
  config = function(_, opts)
    local present, tree = pcall(require, "neo-tree")
    if not present then
      return
    end
    tree.setup(opts)
    vim.keymap.set("n", "<Leader>n", "<cmd>:Neotree float<CR>")
  end,
}
