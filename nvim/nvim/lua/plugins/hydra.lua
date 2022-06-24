-- hydra plugin settings
--
-- Copyright (c) 2022 Ratheesh
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.

			local Hydra = require('hydra')
			local gitsigns = require('gitsigns')
			local hint = [[
		_j_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line				^
		_k_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full  ^
		^ ^              _S_: stage buffer      ^ ^                 _/_: show base file   ^
		^
		^ ^              _q_/<Esc>: exit
		]]
			Hydra({
				hint = hint,
				config = {
					color = 'pink',
					invoke_on_body = true,
					hint = {
						position = 'bottom',
						border = 'rounded'
					},
					on_enter = function()
						vim.bo.modifiable = false
						gitsigns.toggle_signs(true)
						gitsigns.toggle_linehl(true)
					end,
					on_exit = function()
						gitsigns.toggle_signs(false)
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
					{ 's', ':Gitsigns stage_hunk<CR>', { silent = true } },
					{ 'u', gitsigns.undo_stage_hunk },
					{ 'S', gitsigns.stage_buffer },
					{ 'p', gitsigns.preview_hunk },
					{ 'd', gitsigns.toggle_deleted, { nowait = true } },
					{ 'b', gitsigns.blame_line },
					{ 'B', function() gitsigns.blame_line { full = true } end },
					{ '/', gitsigns.show, { exit = true } }, -- show the base of the file
					{ '<Esc>', nil, { exit = true, nowait = true } },
					{ 'q', nil, { exit = true, nowait = true } },
				}
			})

-- End of File
