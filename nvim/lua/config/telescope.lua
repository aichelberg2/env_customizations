local border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		borderchars = border_chars,
		mappings = {
			n = {
				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,
			},
		},
		path_display = {
			"shorten",
		},
		layout_config = {
			prompt_position = "top",
			horizontal = {
				width = 0.95,
				height = 0.95,
				preview_width = 0.6,
			},
		},
		sorting_strategy = "ascending",
	},
})
require("telescope").load_extension("ui-select")

