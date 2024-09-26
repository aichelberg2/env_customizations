local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

<<<<<<< HEAD
require("lazy").setup({
  "wbthomason/packer.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  "mbbill/undotree",
  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  "williamboman/mason-lspconfig.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "slugbyte/lackluster.nvim",
    config = function()
      require("config.lackluster").colormy()
    end,
  },
  "mg979/vim-visual-multi",
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  "smolck/command-completion.nvim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  "folke/trouble.nvim",
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("config.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = true,
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "coreclr", "node2", "js", "chrome" }
      })
    end,
  },
})
=======
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
>>>>>>> 262a040372da20795372f3db31710a6564a7ed0c
