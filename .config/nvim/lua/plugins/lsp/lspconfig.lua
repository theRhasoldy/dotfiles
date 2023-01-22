return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    event = "BufReadPre",
    opts = {
      -- Global settings
      diagnostics = {
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      },
      autoformat = true,

      -- Server specific settings
      servers = {
        tsserver = {},
        sumneko_lua = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false, -- Turn off work enviroment prompt (for now)
                library = vim.api.nvim_get_runtime_file("", true),
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    },

    config = function(_, opts)
      -- Custom sign column diagnostics icon
      local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end

      local servers = opts.servers
      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) }) -- Get all servers installed by Mason
      require("mason-lspconfig").setup_handlers({
        function(server)
          if servers[server] == false then
            return
          end
          local server_opts = servers[server] or {}
          --server_opts.capabilities = capabilities -- nvim-cmp
          require("lspconfig")[server].setup(server_opts) -- Apply opts to all installed servers and initialize them
        end,
      })

      -- Disable virtual text
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    name = "lspsaga",
    event = "BufReadPre",
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          virtual_text = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
        ui = {
          border = 'rounded',
          title = true,
          code_action = 'A',
        },
      })
    end,
  },
  {
    "onsails/lspkind.nvim",
    name = "lspkind",
    event = "BufReadPre",
    config = function()
      require('lspkind').init({
        mode = 'symbol',
        symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = ""
        },
      })
    end,
  }
}
