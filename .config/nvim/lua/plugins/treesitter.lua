return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = true,
    event = "BufRead",
    config = function()
      require'nvim-treesitter.configs'.setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "lua",
          "html",
          "css",
          "javascript",
          "scss",
          "tsx",
          "typescript",
          "dart",
          "json",
        },
        highlight = { enable = true, additional_vim_regex_highlighting = false, },
        indent = { enable = true, },
        autotag = { enable = true, },
      })
    end,
  }
}
