-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Bufferline Plugin Configuration

require('bufferline').setup({
	options = {
		mode      = 'buffers',
		numbers   = "ordinal",
		indicator = {
			style   = 'none'
		},
		separator_style = 'slant',
		buffer_close_icon = '',
		-- diagnostics       = 'nvim_lsp',
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end
	},
	highlights = {
		fill = {
			fg = '#EFEAD8',
			bg = '#1E2430',
		},
		background = {
			bg = '#383a4c'
		},
		buffer = {
			fg = '#988C99',
			bg = '#383a4c'
		},
		buffer_visible = {
			fg = '#988C99',
			bg = '#383a4c'
		},
		buffer_selected = {
			fg = '#99c794',
			bg = '#404a5c',
			bold = false,
			italic = true,
		},
		close_button = {
			fg = '#988C99',
			bg = '#383a4c'
		},
		close_button_visible = {
			fg = '#988C99',
			bg = '#383a4c'
		},
		close_button_selected = {
			bg = '#404a5c',
		},
		separator_selected = {
			fg = '#1E2430',
			bg = '#404a5c',
		},
		separator_visible = {
			fg = '#1E2430',
			bg = '#383a4c',
		},
		separator = {
			fg = '#1E2430',
			bg = '#383a4c'
		},
		numbers = {
			bg = '#383a4c'
		},
		numbers_visible = {
			bg = '#383a4c'
		},
		numbers_selected = {
			bg = '#404a5c',
			italic = false,
			bold = false,
		},
		modified = {
			bg = '#383a4c'
		},
		modified_visible = {
			bg = '#383a4c'
		},
		modified_selected = {
			fg = '#E79498',
			bg = '#404a5c',
		},
		duplicate_selected = {
			fg = '#99c794',
			bg = '#404a5c',
			bold = false,
			italic = true,
		},
		duplicate_visible = {
			bg = '#383a4c'
		},
		duplicate = {
			bg = '#383a4c'
		},
		--[[
		tab = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
		tab_selected = {
		fg = tabline_sel_bg,
		bg = '<colour-value-here>'
		},
		tab_close = {
		fg = '<colour-value-here>',
		bg = '<colour-value-here>'
		},
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
		bold = true,
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
	if opts then options = vim.tbl_extend("force", options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move to previous/next
map('n', '<Space>h', '<Cmd>BufferLineCyclePrev<CR>',    { desc = "Goto Previous Buffer" })
map('n', '<Space>l', '<Cmd>BufferLineCycleNext<CR>',    { desc = "Goto Next Buffer" 		})

-- jump to buffer index
map('n', '<Space>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { desc = "Goto Buffer 1"        })
map('n', '<Space>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { desc = "Goto Buffer 2"        })
map('n', '<Space>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { desc = "Goto Buffer 3"        })
map('n', '<Space>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { desc = "Goto Buffer 4"        })
map('n', '<Space>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { desc = "Goto Buffer 5"        })
map('n', '<Space>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { desc = "Goto Buffer 6"        })
map('n', '<Space>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { desc = "Goto Buffer 7"        })
map('n', '<Space>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { desc = "Goto Buffer 8"        })
map('n', '<Space>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { desc = "Goto Buffer 9"        })

map('n', '<A-p>',    '<Cmd>BufferLineTogglePin<CR>',    { desc = "Pin Buffer"           })
map("n", '<A-d>',    '<Cmd>bdelete<CR>',                { desc = 'Delete Current Buf'   })
map('n', '<C-s>',    '<Cmd>BufferLinePick<CR>',         { desc = "Pick Buffer"          })
map('n', '<A->>',    '<Cmd>BufferLineMoveNext<CR>',     { desc = "Move Buffer Right"    })
map('n', '<A-<>',    '<Cmd>BufferLineMovePrev<CR>',     { desc = "Move Buffer Left"     })

-- End of File