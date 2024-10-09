require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript", "html", "css", "c_sharp", "dockerfile" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})

require("treesitter-context").setup({
	multiline_threshold = 2,
})
