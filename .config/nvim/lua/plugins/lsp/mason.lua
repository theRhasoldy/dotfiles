return {
  {
    "williamboman/mason.nvim",
    name = "mason",
    event = "BufReadPre",
    opts = {
      ui = {
        check_outdated_packages_on_open = false,
        border = "solid",
      },
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",
        -- Web
        "typescript-language-server",
        "emmet-ls",
        "html-lsp",
        "css-lsp",
        "cssmodules-language-server",
        -- "prettier",
        "prettierd", -- Faster
        -- Shell
        "bash-language-server",
        -- Others
        "json-lsp",
        "fixjson",
        "jsonlint",
        "yaml-language-server",
        "xmlformatter",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- Auto install "ensure_installed" servers
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  "williamboman/mason-lspconfig.nvim",
}
