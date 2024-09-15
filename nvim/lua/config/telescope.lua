local border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
Map("n", "<leader>pr", ":Telescope lsp_references<CR>")

local actions = require("telescope.actions")
require('telescope').setup{
	defaults = {
		borderchars = border_chars,
		mappings = {
			n = {
				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down
			}
		},
		path_display = {
			"shorten"
		},
		layout_config = {
			prompt_position = "top",
			horizontal = {
				width = 0.95,
				height = 0.95,
				preview_width = 0.6,
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
			},
			live_grep = {
				theme = "dropdown",
			},
		},
	}
}
