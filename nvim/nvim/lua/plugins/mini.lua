-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- mini.nvim plugin config

local M = {}

function M.setup()
	-- require("mini.ai").setup({})
	require("mini.indentscope").setup({
		symbol = '╎',
	})
	-- require("mini.jump").setup({
	-- 	{
	-- 		-- Module mappings. Use `''` (empty string) to disable one.
	-- 		mappings = {
	-- 			forward       = 'f',
	-- 			backward      = 'F',
	-- 			forward_till  = 't',
	-- 			backward_till = 'T',
	-- 			repeat_jump   = ';',
	-- 		},
	-- 		delay = {
	-- 			highlight = 250,
	-- 			idle_stop = 10000000,
	-- 		},
	-- 	}
	-- })
	-- require('mini.surround').setup({
	-- 	custom_surroundings = {
	-- 		['('] = { output = { left = '( ', right = ' )' } },
	-- 		['['] = { output = { left = '[ ', right = ' ]' } },
	-- 		['{'] = { output = { left = '{ ', right = ' }' } },
	-- 		['<'] = { output = { left = '< ', right = ' >' } },
	-- 	},
	-- 	mappings = {
	-- 		add            = 'ys',
	-- 		delete         = 'ds',
	-- 		find           = '',
	-- 		find_left      = '',
	-- 		highlight      = '',
	-- 		replace        = 'cs',
	-- 		update_n_lines = '',
	-- 	},
	-- 	search_method = 'cover_or_next',
	-- 	vim.api.nvim_set_keymap('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true }),
	-- 	-- vim.api.nvim_set_keymap('n', 'yss', 'ys_', { noremap = false }) -- line
	-- })
	-- require('mini.trailspace').setup({
	-- })
end

return M

-- End of File
