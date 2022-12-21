-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Telescope Configuration

local M = {}

function M.setup()
  require('telescope').load_extension('fzf')
	require('telescope').load_extension('project')
	require('telescope').load_extension('rooter')
	require("telescope").load_extension("undo")

	local actions = require('telescope.actions')
	require('telescope').setup{
		path_display = 'truncate=3',
		defaults = {
			mappings = {
				i = {
					['<esc>'] = actions.close,
					['<c-j>'] = actions.move_selection_next,
					['<c-k>'] = actions.move_selection_previous,
					['<C-n>'] = require('telescope.actions').cycle_history_next,
					['<C-p>'] = require('telescope.actions').cycle_history_prev,
				},

				n = {
					['<esc>'] = actions.close,
					-- ['<C-i>'] = my_cool_custom_action,
				},
			},
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case'
			},

			prompt_prefix      = '  ',
			selection_caret    = ' ',
			entry_prefix       = '  ',
			initial_mode       = 'insert',
			selection_strategy = 'reset',
			sorting_strategy   = 'descending',
			layout_strategy    = 'horizontal',
			layout_config = {
				horizontal = {
					mirror = false,
				},
				vertical = {
					mirror          = false,
					width           = 0.5,
					preview_cutoff  = 120,
					results_height  = 1,
					results_width   = 0.8,
					prompt_position = 'bottom',
					shorten_path    = true,
				},
			},

			file_sorter          = require'telescope.sorters'.get_fuzzy_file,
			file_ignore_patterns = {},
			generic_sorter       = require'telescope.sorters'.get_generic_fuzzy_sorter,
			winblend             = 10,
			border               = {},
			borderchars          = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			color_devicons       = true,
			use_less             = true,
			set_env              = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
			file_previewer       = require'telescope.previewers'.vim_buffer_cat.new,
			grep_previewer       = require'telescope.previewers'.vim_buffer_vimgrep.new,
			qflist_previewer     = require'telescope.previewers'.vim_buffer_qflist.new,

			-- Developer configurations: Not meant for general override
			buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
		},
		pickers = {
		},
		extensions = {
			fzf = {
				fuzzy                   = true,
				override_generic_sorter = true,
				override_file_sorter    = true,
				case_mode               = 'smart_case',
			},
			rooter = {
				enable = true,
				patterns = { '.git' },
				debug = false
			},
			undo = {
				side_by_side = true,
				layout_strategy = "vertical",
				layout_config = {
					preview_height = 0.8,
				},
			},
		}
	}

	-- Set keymaps
	--[[ local function map(mode, l, r, opts)
		opts = opts or {}
		-- opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end
	local builtin = require('telescope.builtin')
	map('n', '<leader>fo', builtin.find_files, {})
	map('n', '<leader>fg', builtin.live_grep, {})
	map('n', '<leader>fb', builtin.buffers, {})
	map('n', '<leader>fh', builtin.help_tags, {})
	map('n', '<leader>ft', builtin.oldfiles, {})

	map('n', '<leader>fo', '<cmd>telescope find_files<cr>')
	map('n', '<leader>fg', '<cmd>telescope live_grep<cr>')
	map('n', '<leader>fb', '<cmd>telescope buffers<cr>')
	map('n', '<leader>fh', '<cmd>telescope help_tags<cr>')
	map('n', '<leader>fr', '<cmd>telescope oldfiles<cr>')
	map('n', '<leader>ft', '<cmd>telescope tags<cr>') ]]

	require 'telescope'.load_extension('rooter')
end
return M
-- End of File
