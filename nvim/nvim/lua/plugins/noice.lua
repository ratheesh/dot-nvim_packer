-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Noice plugin config

local M = {}

function M.setup()
	require("noice").setup({
		cmdline = {
			enabled = true,
			format = {
				cmdline     = { icon = ">_" },
				--[[ search_down = { icon = "⌄" },
				search_up   = { icon = "⌃" }, ]]
				--[[ filter      = { icon = "$" },
				lua         = { icon = ""  },
				help        = { icon = "?" }, ]]
			},
		},
		messages = {
			enabled      = true,
			view         = "mini",
			view_error   = "notify",
			view_warn    = "notify",
			view_history = "messages",
			view_search  = "virtualtext",
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
			},
			notify = {
				enabled = true,
				view = "notify",
			},
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 10,
				view = "mini",
			},
		},
		notify = {
			enabled = true,
		},
		health = {
			checker = true,
		},
		presets = {
			bottom_search = true,
			-- command_palette = true,
			-- long_message_to_split = false,
			inc_rename = true,
		},
		views = {
			popupmenu = {
				relative = "editor",
				position = {
					row = -2,
					col = "50%",
				},
				size = {
					width = 60,
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
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
		format = {
			spinner = {
				name = "moon",
				hl_group = nil,
			},
		},
	})
end

return M
