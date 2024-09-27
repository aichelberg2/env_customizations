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
	},
	{ "nvim-neotest/nvim-nio" },
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependecies = { "nvim-neotest/nvim-nio" },
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = true,
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "coreclr", "node2", "js", "chrome" },
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		dependecies = { "tpope/start.nvim" },
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"ggandor/flit.nvim",
		dependecies = { "ggandor/leap.nvim" },
		config = function()
			require("flit").setup()
		end,
	},
	{
		"eoh-bse/minintro.nvim",
		opts = { color = "#88A9B3" },
		config = true,
		lazy = false,
	},
})
