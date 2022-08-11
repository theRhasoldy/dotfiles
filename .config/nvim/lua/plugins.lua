local cmd = vim.cmd
local api = vim.api

cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

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
	use({
		"wbthomason/packer.nvim",
		"lewis6991/impatient.nvim",
		"nathom/filetype.nvim",
		"nvim-lua/plenary.nvim",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- Tmux
	use("christoomey/vim-tmux-navigator")

	-- Theme
	use("heraldofsolace/nisha-vim")
	use("~/Projects/lua/nvim-dahlia/")
	use("B4mbus/oxocarbon-lua.nvim")
	-- use("theRhasoldy/nvim-dahlia")
	use("ntk148v/vim-horizon")

	use("kyazdani42/nvim-web-devicons")

	use("kyazdani42/nvim-tree.lua")

	use("feline-nvim/feline.nvim")

	use("phaazon/hop.nvim")
	use("bkad/CamelCaseMotion")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-live-grep-args.nvim")

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- LSP (Oh boy)
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
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
	use({
		"folke/todo-comments.nvim",
		event = { "BufRead", "BufNewFile" },
	})

	use("vimwiki/vimwiki")
end)
