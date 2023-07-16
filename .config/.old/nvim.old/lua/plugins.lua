local api = vim.api
local cmd = vim.api.nvim_command

cmd([[augroup packer_user_config]])
cmd([[autocmd!]])
cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
cmd([[augroup end]])

function get_setup(name)
	return string.format("require('setup/%s')", name)
end

local vim = vim

local execute = api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

cmd("packadd packer.nvim")

local packer = require("packer")
local util = require("packer.util")

packer.init({
	package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

-- Plugins {{{
packer.startup(function()
	local use = require("packer").use

	-- Core plugins, run at startup
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")

	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		bufread = true,
	})

	use({
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/playground",
		after = "nvim-treesitter/nvim-treesitter",
		opt = true,
	})

	-- kitty support
	-- use("christoomey/vim-tmux-navigator")
	use({
		"knubie/vim-kitty-navigator",
		opt = true,
		cmd = { "KittyNavigateUp", "KittyNavigateDown", "KittyNavigateLeft", "KittyNavigateRight" },
	})

	-- Theme
	use("~/Projects/Lua/nvim-dahlia/")
	use("catppuccin/nvim")
	-- use("theRhasoldy/nvim-dahlia")

	use({
		"feline-nvim/feline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({ "nvim-neo-tree/neo-tree.nvim" })

	use("gelguy/wilder.nvim")

	use("phaazon/hop.nvim")
	use("arnamak/stay-centered.nvim")
	use("bkad/CamelCaseMotion")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-live-grep-args.nvim")

	use("ThePrimeagen/harpoon")

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- LSP
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use({
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
	})
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind.nvim")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")

	use("jose-elias-alvarez/null-ls.nvim")

	-- File Manipulation
	use("tpope/vim-surround")
	use("b3nj5m1n/kommentary")

	-- Aesthetics
	use("RRethy/vim-illuminate")

	use("ziontee113/color-picker.nvim")
	use("NvChad/nvim-colorizer.lua")

	use("lewis6991/gitsigns.nvim")

	use("monaqa/dial.nvim")
end)
