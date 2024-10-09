local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.del("n", "<C-k>", { buffer = bufnr })
end

-- NvimTree configuration
require("nvim-tree").setup({
	update_focused_file = { enable = true },
	view = {
		width = 85,
		side = "right",
		float = {
			enable = false,
			open_win_config = {
				border = "rounded",
			},
		},
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	on_attach = my_on_attach,
})

-- Keybindings
vim.api.nvim_set_keymap("n", "<leader>pf", ":NvimTreeToggle<CR>", {
	noremap = true,
	silent = true,
})
