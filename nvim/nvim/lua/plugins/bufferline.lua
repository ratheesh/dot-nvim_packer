-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Bufferline Plugin Configuration

local bufferline = require('bufferline')

bufferline.setup({
	options = {
		mode      = 'buffers',
		numbers   = 'ordinal',
		indicator = {
			-- icon = '▌',
			style   = 'underline'
		},
		separator_style = 'none',
		buffer_close_icon = '',
		-- diagnostics       = 'nvim_lsp',
		diagnostics_indicator = function(count, level)
			local icon = level:match('error') and ' ' or ''
			return ' ' .. icon .. count
		end,
		hover = {
			enabled = true,
			delay   = 0,
			reveal  = { 'close' }
		},
	},
	highlights = {
		fill = {
			fg = '#EFEAD8',
			bg = '#1E2430',
		},
		background = {
			bg = '#1E2430'
		},
		buffer = {
			fg = '#988C99',
			bg = '#1E2430'
		},
		buffer_visible = {
			fg = '#988C99',
			bg = '#1E2430'
		},
		buffer_selected = {
			fg = '#99c794',
			bg = '#1E2430',
			bold = true,
			italic = true,
		},
		close_button = {
			fg = '#988C99',
			bg = '#1E2430'
		},
		close_button_visible = {
			fg = '#988C99',
			bg = '#1E2430'
		},
		close_button_selected = {
			fg = '#988C99',
			bg = '#1E2430',
		},
		separator_selected = {
			fg = '#1E2430',
			bg = '#1E2430',
		},
		separator_visible = {
			fg = '#1E2430',
			bg = '#1E2430',
		},
		separator = {
			fg = '#1E2430',
			bg = '#1E2430'
		},
		indicator_visible = {
			fg = '#F7CAB8',
			bg = '#1E2430',
			bold = true,
		},
		indicator_selected = {
			fg = '#F7CAB8',
			bg = '#1E2430',
			sp = '#FF80A0',
			bold = true,
			underdouble = true,
			underline = true,
		},
		pick_selected = {
			fg = '#cf314a',
			bg = '#1E2430',
			bold = true,
			italic = true,
		},
		pick_visible = {
			fg = '#cf314a',
			bg = '#1E2430',
			bold = true,
			italic = true,
		},
		pick = {
			fg = '#cf314a',
			bg = '#1E2430',
			bold = true,
			italic = true,
		},
		tab = {
			fg = '#988C99',
			bg = '#1E2430'
		},
		tab_selected = {
			fg = '#A3BE8C',
			bg = '#1E2430',
			sp = 'red',
			bold = true,
			-- underline = true,
			-- undercurl = true,
		},
		numbers = {
			bg = '#1E2430'
		},
		numbers_visible = {
			bg = '#1E2430'
		},
		numbers_selected = {
			fg = '#AA8ED6',
			bg = '#1E2430',
			italic = false,
			bold = true,
		},
		modified = {
			bg = '#1E2430'
		},
		modified_visible = {
			bg = '#1E2430'
		},
		modified_selected = {
			fg = '#E23D75',
			bg = '#1E2430',
		},
		duplicate_selected = {
			fg = '#99c794',
			bg = '#1E2430',
			bold = false,
			italic = true,
		},
		duplicate_visible = {
			bg = '#1E2430'
		},
		duplicate = {
			bg = '#1E2430'
		},
		--[[
		diagnostic = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		},
		diagnostic_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		},
		diagnostic_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		bold = true,
		italic = true,
		},
		hint = {
		fg = '<colour-value-here>',
		sp = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		hint_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		hint_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
		bold = true,
		italic = true,
		},
		hint_diagnostic = {
		fg = '<colour-value-here>',
		sp = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		hint_diagnostic_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		hint_diagnostic_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
		bowld = true,
		italic = true,
		},
		info = {
		fg = '<colour-value-here>',
		sp = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		info_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		info_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
		bold = true,
		italic = true,
		},
		info_diagnostic = {
		fg = '<colour-value-here>',
		sp = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		info_diagnostic_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		info_diagnostic_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
		bold = true,
		italic = true,
		},
		warning = {
		fg = '<colour-value-here>',
		sp = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		warning_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		warning_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
		bold = true,
		italic = true,
		},
		warning_diagnostic = {
		fg = '<colour-value-here>',
		sp = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		warning_diagnostic_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
	},
	warning_diagnostic_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = warning_diagnostic_fg
		bold = true,
		italic = true,
	},
	error = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
	},
	error_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
	},
	error_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
		bold = true,
		italic = true,
	},
	error_diagnostic = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
	},
	error_diagnostic_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
	},
	error_diagnostic_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		sp = '<colour-value-here>'
		bold = true,
		italic = true,
	},
	indicator_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
	},
	pick_selected = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	pick_visible = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	pick = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	offset_separator = {
		fg = win_separator_fg,
		bg = separator_background_color,
	},
        }; ]]
    }
})

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move to previous/next
map('n', '<Leader>h', '<Cmd>BufferLineCyclePrev<CR>',    { desc = 'Goto Previous Buffer' })
map('n', '<Leader>l', '<Cmd>BufferLineCycleNext<CR>',    { desc = 'Goto Next Buffer'     })

-- jump to buffer index
map('n', '<Leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Goto Buffer 1' })
map('n', '<Leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Goto Buffer 2' })
map('n', '<Leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Goto Buffer 3' })
map('n', '<Leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Goto Buffer 4' })
map('n', '<Leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Goto Buffer 5' })
map('n', '<Leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Goto Buffer 6' })
map('n', '<Leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Goto Buffer 7' })
map('n', '<Leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Goto Buffer 8' })
map('n', '<Leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Goto Buffer 9' })

map('n', '<A-p>',    '<Cmd>BufferLineTogglePin<CR>',    { desc = 'Pin Buffer'         })
map('n', '<A-d>',    '<Cmd>bdelete<CR>',                { desc = 'Delete Current Buf' })
map('n', '<C-s>',    '<Cmd>BufferLinePick<CR>',         { desc = 'Pick Buffer'        })
map('n', '<A->>',    '<Cmd>BufferLineMoveNext<CR>',     { desc = 'Move Buffer Right'  })
map('n', '<A-<>',    '<Cmd>BufferLineMovePrev<CR>',     { desc = 'Move Buffer Left'   })
map('n' , '<C-j>',   '<Cmd>BufferLast<CR>',             { desc = "Previous Buffer"    })

-- End of File
