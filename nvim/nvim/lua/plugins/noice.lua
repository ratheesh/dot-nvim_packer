-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Noice plugin config

local M = {}
function M.setup()
	-- local noice = require('noice')
	require('noice').setup({
		cmdline = {
			enabled = true,
			view = 'cmdline_popup',
			format = {
				cmdline     = { icon = '>_' },
			},
		},
		messages = {
			enabled = true,
			view = 'mini',
			view_warn = 'mini',
			view_error = 'mini',
			view_history = 'messages',
			view_search  = 'virtualtext',
		},
		popupmenu = {
			enabled = true,
			backend = 'nui'
		},
		lsp = {
			signature = {
				enabled = false,
				auto_open = false,
				view = nil,
				opts = {skip = true},

				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			notify = {
				enabled = false,
				view = 'notify',
			},
			progress = {
				enabled = true,
				format = 'lsp_progress',
				format_done = 'lsp_progress_done',
				throttle = 1000 / 10,
				view = 'mini',
			},
			documentation = {
				view = "hover",
				---@type NoiceViewOptions
				opts = {
					-- lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
		notify = {
			enabled = true,
		},
		health = {
			checker = true,
		},
		smart_move = {
			enabled = true,
			excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
		},
		presets = {
			bottom_search = true,
			-- command_palette = true,
			-- long_message_to_split = false,
			inc_rename = true,
		},
		views = {
			mini = {
				position = {
					row = '95%',
					col = '98%',
				},
			},
			cmdline_popup = {
				position = {
					row = '30%',
					col = '50%',
				},
				size = {
					width = '40%',
					height = 'auto',
				},
			},
			popupmenu = {
				relative = 'editor',
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width  = '40%',
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		routes = {
			filter = {
				event = 'msg_show',
				kind = '',
				find = '%d+B written',
			},
			opts = { skip = true },
			{
				filter = {
					event = 'msg_show',
					kind = '',
					find = 'before #%d+',
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = 'msg_show',
					kind = '',
					find = 'written',
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = 'msg_show',
					kind = '',
					find = 'more lines?',
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = 'msg_show',
					kind = '',
					find = 'lines? yank',
				},
				opts = { skip = true },

			},
		},
		format = {
			spinner = {
				name = 'aesthetic',
				hl_group = nil,
			},
		},
	})
end

return M
