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
local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
	execute "packadd packer.nvim"
end

cmd("packadd packer.nvim")

local packer = require"packer"
local util = require"packer.util"

packer.init({
	package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
})

--Plugins
packer.startup(function()
	local use = require("packer").use

	-- Core plugins, run at startup
	use({
		"wbthomason/packer.nvim",
		"lewis6991/impatient.nvim",
		"nathom/filetype.nvim",
		"nvim-lua/plenary.nvim",
	})

	-- Treesitter {{{
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- }}}

	-- Theme
	use "Matsuuu/pinkmare"
	use "heraldofsolace/nisha-vim"

	use "kyazdani42/nvim-web-devicons"

	use "kyazdani42/nvim-tree.lua"

	use {
		"nvim-lualine/lualine.nvim",
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use ({
		"nvim-telescope/telescope.nvim",
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	use "windwp/nvim-autopairs"

	use "windwp/nvim-ts-autotag"

	-- LSP {{{ (Oh boy)
	use "neovim/nvim-lspconfig"

	use ({ 
		"williamboman/mason.nvim", 
		"williamboman/mason-lspconfig.nvim" 
	})

	use ({
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path"
	})

	use "glepnir/lspsaga.nvim"

	use "onsails/lspkind.nvim"

	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"
	use "saadparwaiz1/cmp_luasnip"
	-- }}}

	-- File Manipulation
	use "tpope/vim-surround"
	use "b3nj5m1n/kommentary"

	-- Flutter
	use "akinsho/flutter-tools.nvim"
	use "dart-lang/dart-vim-plugin"
	use "thosakwe/vim-flutter"
	use "natebosch/vim-lsc"
	use "natebosch/vim-lsc-dart"

	-- Aesthetics
	use "RRethy/vim-illuminate"

	use "ziontee113/color-picker.nvim"

	use "vimwiki/vimwiki"
	use "nvim-treesitter/playground"

	end
)
