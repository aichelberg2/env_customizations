require("lualine").setup({
	"harpoon2",
	options = {
		icons_enabled = true,
		theme = "iceberg_dark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			function()
				local path = vim.fn.expand("%:p")
				local max_length = 80
				if #path > max_length then
					return "..." .. path:sub(-max_length)
				else
					return path
				end
			end,
		},
		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
