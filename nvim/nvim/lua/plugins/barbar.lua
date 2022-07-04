-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- barbar Plugin Configuration

require'bufferline'.setup ({
	animation               = true,
	auto_hide               = false,
	tabpages                = true,
	closable                = true,
	clickable               = true,
	-- exclude_ft              = {'javascript'},
	exclude_name            = {'package.json', "COMMIT_EDITMSG"},
	icons                   = 'both',
	icon_custom_colors      = false,
	icon_separator_active   = '▌',
	icon_separator_inactive = '',
	icon_close_tab          = '',
	icon_close_tab_modified = '●',
	icon_pinned             = '車',
	insert_at_end           = false,
	insert_at_start         = false,
	maximum_padding         = 1,
	maximum_length          = 20,
	semantic_letters        = true,
	letters                 = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
	no_name_title           = nil,
})

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then options = vim.tbl_extend("force", options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move to previous/next
map('n' , '<Leader>h' , '<Cmd>BufferPrevious<CR>'     )
map('n' , '<Leader>l' , '<Cmd>BufferNext<CR>'         )
map('n' , '<Leader>1' , '<Cmd>BufferGoto 1<CR>'       )
map('n' , '<Leader>2' , '<Cmd>BufferGoto 2<CR>'       )
map('n' , '<Leader>3' , '<Cmd>BufferGoto 3<CR>'       )
map('n' , '<Leader>4' , '<Cmd>BufferGoto 4<CR>'       )
map('n' , '<Leader>5' , '<Cmd>BufferGoto 5<CR>'       )
map('n' , '<Leader>6' , '<Cmd>BufferGoto 6<CR>'       )
map('n' , '<Leader>7' , '<Cmd>BufferGoto 7<CR>'       )
map('n' , '<Leader>8' , '<Cmd>BufferGoto 8<CR>'       )
map('n' , '<Leader>9' , '<Cmd>BufferGoto 9<CR>'       )
map('n' , '<Leader>0' , '<Cmd>BufferLast 9<CR>' 		  )
map('n' , '<C-j>'     , '<Cmd>BufferLast<CR>'         )
map('n' , '<A-p>'     , '<Cmd>BufferPin<CR>'          )
map('n' , '<A-d>'     , '<Cmd>BufferClose<CR>'        )
map('n' , '<C-s>'     , '<Cmd>BufferPick<CR>'         )
map('n' , '<A->>'     , '<Cmd>BufferMoveNext<CR>'     )
map('n' , '<A-<>'     , '<Cmd>BufferMovePrevious<CR>' )


-- barbar.nvim
local hl = vim.api.nvim_set_hl
hl(0, "BufferCurrent"           ,{ fg = "#99c794", bg = "#383a4c", italic = true,  bold = false, underline = false })
hl(0, "BufferCurrentMod"        ,{ fg = "#99c794", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferCurrentTarget"     ,{ fg = "#FA2C77", bg = "#383a4c", italic = true , bold = true , underline = true  })
hl(0, "BufferVisible"           ,{ fg = "#988C99", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleMod"        ,{ fg = "#EFEAD8", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleSign"       ,{ fg = "#988C99", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleTarget"     ,{ fg = "#EFEAD8", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactive"          ,{ fg = "#988C99", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveMod"       ,{ fg = "#988C99", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveSign"      ,{ fg = "#988C99", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveTarget"    ,{ fg = "#FA2C77", bg = "#383a4c", italic = true , bold = true , underline = true  })
hl(0, "BufferTabLineSel"        ,{ fg = "#EFEAD8", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferTabLineFill"       ,{ fg = "#EFEAD8", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferCurrentIndex"      ,{ fg = "#e7b898", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferCurrentSign"       ,{ fg = "#ec7279", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleIndex"      ,{ fg = "#988C99", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveIndex"     ,{ fg = "#988C99", bg = "#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferCurrentIcon"       ,{ fg = nil      , bg = "#383a4c", italic = false, bold = false, underline = false })

-- End of File
