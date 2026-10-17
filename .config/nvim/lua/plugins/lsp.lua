return {
  "neovim/nvim-lspconfig",
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        if vim.lsp.document_color then
          vim.lsp.document_color.enable(false, { bufnr = args.buf })
        end
      end,
    })
  end,
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = true,
      float = {
        source = "if_many",
        border = "rounded",
      },
      virtual_text = {
        spacing = 10,
        source = "if_many",
        prefix = "󰊠",
        hl_mode = "combine",
      },
      severity_sort = true,
    },
    inlay_hints = { enabled = false },
    servers = {
      ["*"] = {
        on_attach = function(_, bufnr)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "<leader><leader>", vim.diagnostic.open_float, "Floating Diagnostics")
          map("n", "gs", vim.lsp.buf.signature_help, "Signature Help")
          map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
          map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
        end,
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = { callSnippet = "Replace" },
          },
        },
      },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cx\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              },
            },
          },
        },
      },
      emmet_language_server = {},
      astro = {},
      mdx_analyzer = {},
      marksman = {},
      html = {},
      cssls = {
        settings = {
          css = { lint = { unknownAtRules = "ignore" } },
          scss = { lint = { unknownAtRules = "ignore" } },
        },
      },
      yamlls = {},
      jsonls = {},
      eslint = {
        settings = {
          -- help eslint find the eslintrc when it's placed in a subdirectory
          workingDirectories = { mode = "auto" },
        },
      },
    },
    setup = {
      eslint = function()
        if not vim.g.autoformat then
          return
        end

        local formatter = LazyVim.lsp.formatter({
          name = "eslint: lsp",
          primary = false,
          priority = 200,
          filter = "eslint",
        })

        -- register the formatter with LazyVim
        LazyVim.format.register(formatter)
      end,
    },
  },
}
