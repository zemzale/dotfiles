local dap = require("dap")
local ui = require("dapui")

ui.setup({
	layouts = {
		{
			-- Left sidebar: Scopes, Breakpoints, Stacks, and Watches
			elements = {
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 30, -- Width of the sidebar
			position = "left", -- Can be "left" or "right"
		},
		{
			-- Bottom panel: Remove console and REPL, keep only the logs or other elements you want
			elements = {
				{ id = "scopes", size = 1 }, -- Example: You can duplicate scopes here if needed
			},
			size = 10, -- Height of the bottom panel
			position = "bottom", -- Can be "bottom" or "top"
		},
	},
	floating = {
		max_height = 0.8, -- Max height of floating windows
		max_width = 0.8, -- Max width of floating windows
		border = "rounded", -- Border style: "single", "double", "rounded", etc.
		mappings = {
			close = { "q", "<Esc>" }, -- Keybindings to close floating windows
		},
	},
	windows = { indent = 1 }, -- Indentation for tree elements
	render = {
		max_type_length = 5, -- Can limit the length of variable types
	},
})

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<leader>?", function()
	require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F2>", dap.continue)
vim.keymap.set("n", "<F3>", dap.step_into)
vim.keymap.set("n", "<F4>", dap.step_over)
vim.keymap.set("n", "<F5>", dap.step_out)

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

dap.adapters.delve = {
	type = "server",
	host = "127.0.0.1",
	port = 2345,
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Connect to remote",
		request = "attach",
		mode = "remote",
	},
}

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = true,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach to gdbserver :1234",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = true,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach to gdbserver :1234",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}
