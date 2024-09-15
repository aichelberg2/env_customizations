-- NvimTree configuration
require("nvim-tree").setup({
	view = {
		width = 30,
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
	}
})

-- Function to open NvimTree in full screen
local function open_nvim_tree_fullscreen()
	require("nvim-tree.api").tree.open()
	vim.cmd("wincmd o") -- Make it full screen
end

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>pe', '', {
	noremap = true,
	silent = true,
	callback = open_nvim_tree_fullscreen
})

vim.api.nvim_set_keymap('n', '<leader>pf', ':NvimTreeToggle<CR>', {
	noremap = true,
	silent = true
})
