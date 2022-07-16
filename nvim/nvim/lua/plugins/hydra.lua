-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Hydra Plugin Configuration

local Hydra = require('hydra')
local gitsigns = require('gitsigns')
local hint = [[
	_j_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line				^ ^
	_k_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full  ^ ^
	_R_: reset hunk  _S_: stage buffer      _/_: show base file   ^ ^
^
^ ^              _<Enter>_: Neogit      _q_/<Esc>: exit
]]
Hydra({
	name = "Git",
	hint = hint,
	config = {
		color = 'pink',
		invoke_on_body = true,
		hint = {
			position = 'bottom',
			border   = 'rounded'
		},
		on_enter = function()
			vim.bo.modifiable = true
			gitsigns.toggle_signs(true)
			gitsigns.toggle_linehl(true)
		end,
		on_exit = function()
			gitsigns.toggle_signs(true)
			gitsigns.toggle_linehl(false)
			gitsigns.toggle_deleted(false)
			vim.cmd 'echo' -- clear the echo area
		end
	},
	mode = { 'n', 'x' },
	body = '<leader>g',
	heads = {
		{ 'j', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gitsigns.next_hunk() end)
			return '<Ignore>'
		end, { expr = true } },
		{ 'k', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gitsigns.prev_hunk() end)
			return '<Ignore>'
		end, { expr = true } },
		{ 's',       '<cmd>Gitsigns stage_hunk<CR>', { silent = true } },
		{ 'u',       gitsigns.undo_stage_hunk, { desc = 'undo staged hunk' }},
		{ 'S',       gitsigns.stage_buffer, { desc = 'stage buffer' }},
		{ 'R',       gitsigns.reset_hunk      },
		{ 'p',       gitsigns.preview_hunk    },
		{ 'd',       gitsigns.toggle_deleted, { nowait = true } },
		{ 'b',       gitsigns.blame_line },
		{ 'B',       function() gitsigns.blame_line { full = true } end },
		{ '/',       gitsigns.show, { exit = true }     },
		{ '<Enter>', '<cmd>Neogit<CR>', { exit = true } },
		{ '<Esc>',   nil, { exit = true, nowait = true }},
		{ 'q',       nil, { exit = true, nowait = true }},
	}
})

-- End of File
