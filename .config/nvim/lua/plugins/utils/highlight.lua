return {
	--[[ "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure()
  end, ]]
	"tzachar/local-highlight.nvim",
	config = function()
		require("local-highlight").setup({
			hlgroup = "Visual",
		})
	end,
}
