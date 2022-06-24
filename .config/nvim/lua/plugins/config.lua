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
		'wbthomason/packer.nvim',
		'lewis6991/impatient.nvim',
		'nathom/filetype.nvim',
		'nvim-lua/plenary.nvim',
	})

	-- Treesitter {{{
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require "plugins.setup.treesitter"
			end
		})
		-- }}}

		-- Theme
		use "Matsuuu/pinkmare"

		use "kyazdani42/nvim-web-devicons"

		use ({
			"kyazdani42/nvim-tree.lua",
			config = function()
				require "plugins.setup.nvim-tree"
			end
		})

		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require "plugins.setup.lualine"
			end
		}

		use ({
			'nvim-telescope/telescope.nvim',
			requires = { {'nvim-lua/plenary.nvim'} },
			config = function()
				require "plugins.setup.telescope"
			end
		})

		use ({
			"windwp/nvim-autopairs",
			config = function()
				require "plugins.setup.nvim-autopairs"
			end
		})

		use "windwp/nvim-ts-autotag"

		-- LSP {{{ (Oh boy)
		use ({
			"neovim/nvim-lspconfig",
			config = function()
				require "plugins.setup.lsp-config"
			end
		})

		use "williamboman/nvim-lsp-installer"

		use ({
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path"
		})

		use "L3MON4D3/LuaSnip"
		use "rafamadriz/friendly-snippets"
		use { 'saadparwaiz1/cmp_luasnip' }
		-- }}}

	end
	)

