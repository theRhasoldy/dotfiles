local status, zk = pcall(require, "zk")
if not status then
	return
end

zk.setup({
	picker = "telescope",

	lsp = {
		-- `config` is passed to `vim.lsp.start_client(config)`
		auto_attach = {
			enabled = true,
			filetypes = { "md", "markdown" },
		},
	},
})
