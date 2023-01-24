return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    run = ":TSUpdate",
    lazy = true,
    event = "BufRead",
    config = function()
      local present, treesitter_config = pcall(require, "nvim-treesitter.configs")
      if not present then
        return
      end
      treesitter_config.setup({
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
      })
    end,
  },
}
