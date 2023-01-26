return {
  "NvChad/nvim-colorizer.lua",
  name = "colorizer",
  event = "BufReadPre",
  opts = {
    filetypes = { "*", "!TelescopePrompt", "!cmp_docs", "!cmp_menu" },
    user_default_options = {
      names = false, -- "Name" codes like Blue or blue
      RRGGBBAA = true,
      AARRGGBB = true,
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      mode = "virtualtext",
      tailwind = "lsp",
      sass = { enable = true, parsers = { css } }, -- Enable sass colors
    },
  },
}
