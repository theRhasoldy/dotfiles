return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      title_pos = "center",
      border = "single",
      select = {
        get_config = function(opts)
          if opts.kind == "codeaction" then
            return {
              backend = "telescope",
            }
          elseif opts.kind == "rename" then
            return {
              backend = "telescope",
            }
          end
        end,
      },
    })
  end,
}
