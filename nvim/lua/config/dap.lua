local status, dap = pcall(require, 'dap')
if (not status) then
	print("dap not loaded")
	return
end

local dap_status, dapui = pcall(require, 'dapui')
if (not dap_status) then
	print("dapui not loaded")
	return
end

local ph_status, dotnet_ph = pcall(require, 'utilities.path_finder')
if (not ph_status) then
	print("path_finder not loaded")
	return
end

-- used by nvim-dap
dap.adapters.coreclr = {
	type = 'executable',
	command = dotnet_ph.GetNetCoreDbgPath(),
	args = { '--interpreter=vscode' },
	options = {
		detached = false, -- Will put the output in the REPL. #CloseEnough
		cwd = dotnet_ph.GetDebugCwd(),
	}
}

-- Neotest Test runner looks at this table
dap.adapters.netcoredbg = vim.deepcopy(dap.adapters.coreclr)

-- useful for debugging issues with dap
-- Logs are written to :lua print(vim.fn.stdpath('cache'))
-- dap.set_log_level('DEBUG')  -- or `TRACE` for more logs

-- Used by nvim-dap
dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = dotnet_ph.GetDllPath,
		-- stopAtentry = true,
		console = "integratedTerminal"
	},
}

local status_ui, dap_ui = pcall(require, 'dapui')
if (not status_ui) then
	print("dapui not loaded")
	return
end

dap_ui.setup({
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = ""
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = ""
	},
	layouts = { {
		elements = { {
			id = "console",
			size = 0.2
		}, {
			id = "breakpoints",
			size = 0.2
		}, {
			id = "stacks",
			size = 0.2
		}, {
			id = "repl",
			size = 0.2
		}, {
			id = "watches",
			size = 0.2
		} },
		position = "left",
		size = 50
	}, {
		elements = {  {
			id = "scopes",
			size = 1
		} },
		position = "bottom",
		size = 10
	} },
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
})
------------
-- Dap UI --
------------

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
