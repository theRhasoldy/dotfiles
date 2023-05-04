local path = vim.split(package.path, ";")

return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Custom sign column diagnostics icon
      local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end

      local capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- Folding
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local on_attach = function(client)
        -- Disabled built-in lsp formatting, handled by null-ls
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- client.server_capabilities.semanticTokensProvider = nil
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
              version = "luajit",
              -- Setup your lua path
              path = path,
            },
            workspace = {
              library = {
                vim.api.nvim_get_runtime_file("", true),
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
              -- maxPreload = 2000,
              -- preloadFileSize = 50000,
              checkThirdParty = true,
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

      lsp["tsserver"].setup(defaults)

      lsp["html"].setup(defaults)

      lsp["emmet_ls"].setup(defaults)

      lsp["yamlls"].setup(defaults)

      lsp["jsonls"].setup(defaults)

      lsp["cssls"].setup(defaults)

      lsp["dartls"].setup({
        capabilities = capabilities,
        on_attach = function(client)
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
        autoformat = false,
      })
    end,
  },
}
