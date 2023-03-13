local symbols = {
  Text = "󰊄",
  Method = "",
  Function = "",
  Constructor = "󱊈",
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
  Snippet = "󰆐",
  Color = "󰌁",
  File = "󰈔",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "󱌣",
  TypeParameter = "",
}

local path = vim.split(package.path, ";")

return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- Global settings
      diagnostics = {
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      },
      autoformat = false,
    },

    config = function(_, opts)
      -- Custom sign column diagnostics icon
      local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end

      local capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local on_attach = function(client)
        -- Disabled lsp formatting, handled by null-ls
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
      end

      local defaults = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      local lsp = require("lspconfig")

      lsp["lua_ls"].setup({
        defaults,
        single_file_support = true,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              -- Setup your lua path
              path = path,
            },
            workspace = {
              library = {
                [vim.fn.expand("$XDG_CONFIG_HOME/awesome")] = true,
                vim.api.nvim_get_runtime_file("", true),
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
              maxPreload = 2000,
              preloadFileSize = 50000,
              checkThirdParty = false,
            },
            completion = {
              workspaceWord = true,
              callSnippet = "Both",
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      lsp["bashls"].setup({
        single_file_support = true,
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
      })

      lsp["pylsp"].setup(defaults)

      lsp["tsserver"].setup(defaults)

      lsp["html"].setup(defaults)

      lsp["emmet_ls"].setup(defaults)

      lsp["yamlls"].setup(defaults)

      lsp["jsonls"].setup(defaults)

      lsp["cssls"].setup(defaults)

      lsp["dartls"].setup({
        capabilities = capabilities,
        on_attach = function(client)
          -- Disable Lsp provided highlighting
          client.server_capabilities.semanticTokensProvider = nil
          -- Formatting
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })

      vim.diagnostic.config({
        virtual_text = false, -- Disable virtual text
        severity_sort = true, -- sorts diagnostics by severity (errors first)
      })
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    name = "lspsaga",
    event = "BufRead",
    opts = {
      diagnostic = {
        keys = {
          quit = "<Esc>",
        },
      },
      lightbulb = {
        virtual_text = true,
        sign = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      rename = {
        quit = "q",
      },
      ui = {
        border = "single",
        theme = "none",
        code_action = "",
        diagnostic = " ",
        colors = {
          normal_bg = "#141313",
        },
      },
      kind = symbols,
    },
    keys = {
      {
        "<Leader><Leader>",
        "<cmd>Lspsaga show_line_diagnostics<CR>",
        { noremap = true },
      },
      {
        "gr",
        "<cmd>Lspsaga rename<CR>",
      },
      {
        "ga",
        "<cmd>Lspsaga code_action<CR>",
      },
      {
        "gd",
        "<cmd>Lspsaga hover_doc<CR>",
      },
      {
        "gtd",
        "<cmd>Lspsaga goto_definition<CR>",
      },
    },
    config = function(_, opts)
      local present, saga = pcall(require, "lspsaga")
      if not present then
        return
      end
      saga.setup(opts)
    end,
  },
  {
    "onsails/lspkind.nvim",
    name = "lspkind",
    event = "BufReadPre",
    config = function()
      local present, kind = pcall(require, "lspkind")
      if not present then
        return
      end
      kind.init({
        mode = "symbol",
        preset = "codicons",
        symbol_map = symbols,
      })
    end,
  },
}
