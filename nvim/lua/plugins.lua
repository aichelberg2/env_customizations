return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'ThePrimeagen/harpoon',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'mbbill/undotree'
	use 'neovim/nvim-lspconfig'

	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate"
	}

	use "williamboman/mason-lspconfig.nvim"

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use {
		'slugbyte/lackluster.nvim',
		config = function()
			require('config.lackluster').colormy()
		end
	}

	use 'mg979/vim-visual-multi'
	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'
	use 'smolck/command-completion.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

end)
