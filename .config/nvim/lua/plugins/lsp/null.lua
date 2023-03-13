return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  config = function()
    local status, null = pcall(require, "null-ls")
    if not status then
      return
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local formatting = null.builtins.formatting

    null.setup({
      debounce = 150,
      sources = {
        formatting.prettierd,
        formatting.stylua,
        formatting.fixjson,
        formatting.black,
        null.builtins.code_actions.gitsigns,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
