-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- DAP Plugin Configuration

local M = {}

function M.setup()
	local dap = require("dap")
	dap.adapters.lldb = {
		type    = 'executable',
		command = '/usr/bin/lldb-vscode',
		name    = "lldb"
	}
	dap.configurations.c = {
		{
			name          = "Launch",
			type          = "lldb",
			request       = "launch",
			program       = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
			cwd           = '${workspaceFolder}',
			stopOnEntry   = false,
			args          = {},
			runInTerminal = false,
		},
		{
			name    = "Attach",
			type    = "lldb",
			request = "attach",
			pid     = require("dap.utils").pick_process,
			args    = {},
		},
	}
	vim.fn.sign_define("DapBreakpoint",          { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected",  { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint",            { text = "", texthl = "DiagnosticHint", linehl  = "", numhl = "" })
	vim.fn.sign_define("DapStopped",             { text = "", texthl = "DiagnosticInfo", linehl  = "", numhl = "" })

	-- keybindings
	local function map(mode, lhs, rhs, opts)
		local options = { noremap = true, silent = true }
		if opts then options = vim.tbl_extend("force", options, opts) end
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end

	map("n" , "<F5>"       , "<cmd>lua require('dap').continue() require('dapui').open()<CR>")
	map("n" , "<F6>"       , "<cmd>lua require('dap').terminate() require('dapui').close()<CR>")
	map("n" , "<F7>"       , "<cmd>lua require('dap').step_over()<CR>")
	map("n" , "<F8>"       , "<cmd>lua require('dap').step_into()<CR>")
	map("n" , "<F9>"       , "<cmd>lua require('dap').step_out()<CR>")
	map("n" , "<F10>"      , "<cmd>lua require('dap').run_to_cursor()<CR>")
	map("n" , "<leader>dc" , "<cmd>lua require('dap').dap.run_to_cursor()<CR>")
	map("n" , "<leader>b"  , "<cmd>lua require('dap').toggle_breakpoint()<CR>")
	map("n" , "<leader>B"  , "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

-- map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>")
-- map("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
-- map("n", "<leader>lp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
end

return M
