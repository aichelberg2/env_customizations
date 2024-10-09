local dap = require("dap")

require("mason-nvim-dap").setup({
	ensure_installed = { "coreclr", "node2", "js", "chrome" },
})

dap.adapters.coreclr = {
	type = "executable",
	command = "C:\\Users\\ChristianGappel\\netcoredbg\\netcoredbg.exe",
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - WebApi",
		request = "launch",
		program = "C:/dev/CustomerPortal.WebAPI/Repower.CustomerPortal.WebAPI/bin/Debug/net8.0/Repower.CustomerPortal.WebAPI.dll",
		cwd = "C:/dev/CustomerPortal.WebAPI/Repower.CustomerPortal.WebAPI",
		console = "integratedTerminal",
		env = {
			ASPNETCORE_ENVIRONMENT = "christiangappel",
			ASPNETCORE_URLS = "http://localhost:44356",
		},
		args = { "--launch-profile", "Christian Gappel" },
		serverReadyAction = {
			action = "openExternally",
			pattern = "Now listening on:\\s+(https?://\\S+)",
			uriFormat = "%s",
		},
		ports = { 44356 },
	},
}

-- Bind F6 to run the build command
vim.api.nvim_set_keymap("n", "<F6>", [[:lua RunDetachedBuildCommand()<CR>]], { noremap = true, silent = true })

-- Function to run the build command
function RunDetachedBuildCommand()
	local build_command = 'start cmd.exe /c "dotnet build C:/dev/CustomerPortal.WebAPI/ & pause"'
	os.execute(build_command)
	print("Build started in a new command window")
end

vim.api.nvim_set_keymap("n", "<leader>b", '<cmd>lua require"dap".toggle_breakpoint()<CR>', {})
vim.api.nvim_set_keymap("n", "<F5>", '<cmd>lua require"dap".continue()<CR>', {})
vim.api.nvim_set_keymap("n", "<s-F5>", '<cmd>lua require"dap".terminate()<CR>', {})
vim.api.nvim_set_keymap("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>', {})
vim.api.nvim_set_keymap("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>', {})
vim.api.nvim_set_keymap("n", "<s-F11>", '<cmd>lua require"dap".step_out()<CR>', {})
vim.api.nvim_set_keymap("n", "repl", '<cmd>lua require"dap.repl".toggle()<CR>', {})

-- debugging UI
local dapui = require("dapui")

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	element_mappings = {},
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	layouts = {
		{
			elements = {
				{ id = "stacks", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "scopes", size = 0.5 },
			},
			size = 85,
			position = "right",
		},
		{
			elements = {
				{ id = "repl", size = 1 },
			},
			size = 10,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
		max_value_lines = 100,
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.api.nvim_set_keymap("n", "<leader>dh", '<Cmd>lua require"dapui".eval()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dg", '<cmd>lua require"dapui".toggle()<CR>', { noremap = true, silent = true })
