-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Hydra Plugin Configuration

local Hydra = require('hydra')
local gitsigns = require('gitsigns')
local hint = [[
 _j_: next hunk       _k_: prev hunk       ^ ^
 _d_: show deleted    _D_: Word diff       ^ ^
 _u_: undo stage hunk _r_: reset hunk      ^ ^
 _b_: blame line      _B_: blame show full ^ ^
 _s_: stage hunk      _S_: stage buffer    ^ ^
 _/_: show base file  _p_: preview hunk    ^ ^
^
^_<Enter>_: Neogit    q_/<Esc>: exit
]]
Hydra({
	name = "Git",
	hint = hint,
	config = {
		color = 'pink',
		invoke_on_body = true,
		hint = {
			offset   = 1,
			position = 'middle-right',
			border   = 'rounded'
		},
		on_enter = function()
			vim.bo.modifiable = true
			gitsigns.toggle_signs(true)
			gitsigns.toggle_linehl(true)
			gitsigns.toggle_word_diff(true)
			vim.cmd([[ColorClear]])
		end,
		on_exit = function()
			gitsigns.toggle_signs(true)
			gitsigns.toggle_linehl(false)
			gitsigns.toggle_deleted(false)
			gitsigns.toggle_word_diff(false)
			vim.cmd([[ColorHighlight]])
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
		{ 's', gitsigns.stage_hunk, { silent = true } },
		{ 'u', gitsigns.undo_stage_hunk, { desc = 'Undo Staged Hunk' } },
		{ 'S', gitsigns.stage_buffer, { desc = 'Stage buffer' } },
		{ 'r', gitsigns.reset_hunk, { desc = 'Reset Hunk' } },
		{ 'p', gitsigns.preview_hunk, { desc = 'Preview Hunk' } },
		{ 'd', gitsigns.toggle_deleted, { nowait = true } },
		{ 'D', gitsigns.toggle_word_diff, { nowait = true } },
		{ 'b', gitsigns.blame_line, {desc = "Blame Line"} },
		{ 'B', function() gitsigns.blame_line { full = true } end },
		{ '/', gitsigns.show, { exit = true } },
		{ '<Enter>', '<cmd>Neogit<CR>', { exit = true } },
		{ '<Esc>',   nil, { exit = true, nowait = true } },
		{ 'q',       nil, { exit = true, nowait = true } },
	}
})

-- End of File
