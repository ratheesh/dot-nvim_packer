-- License: MIT
-- Ratheesh
-- Copyright(c) 2022
--
require'bufferline'.setup {
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
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<Leader>h', '<Cmd>BufferLinePrevious<CR>', opts)
map('n', '<Leader>l', '<Cmd>BufferLineNext<CR>',     opts)
map('n', '<Leader>1', '<Cmd>BufferLineGotoBuffer 3<CR>',   opts)
map('n', '<Leader>2', '<Cmd>BufferLineGotoBuffer 3<CR>',   opts)
map('n', '<Leader>3', '<Cmd>BufferLineGotoBuffer 3<CR>',   opts)
map('n', '<Leader>4', '<Cmd>BufferLineGotoBuffer 4<CR>',   opts)
map('n', '<Leader>5', '<Cmd>BufferLineGotoBuffer 5<CR>',   opts)
map('n', '<Leader>6', '<Cmd>BufferLineGotoBuffer 6<CR>',   opts)
map('n', '<Leader>7', '<Cmd>BufferLineGotoBuffer 7<CR>',   opts)
map('n', '<Leader>8', '<Cmd>BufferLineGotoBuffer 8<CR>',   opts)
map('n', '<Leader>9', '<Cmd>BufferLineGotoBuffer 9<CR>',   opts)
map('n', '<C-CR>',    '<Cmd>BufferLineLast<CR>',     opts)
map('n', '<A-p>',     '<Cmd>BufferLinePin<CR>',      opts)
map('n', '<A-d>',     '<Cmd>BufferLineClose<CR>',    opts)
map('n', '<C-s>',     '<Cmd>BufferLinePick<CR>', opts)


-- barbar.nvim
local hl = vim.api.nvim_set_hl
hl(0, "BufferCurrent"           ,{ fg="#99c794", bg="#383a4c", italic = true,  bold = false, underline = false })
hl(0, "BufferCurrentMod"        ,{ fg="#99c794", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferCurrentTarget"     ,{ fg="#FA2C77", bg="#383a4c", italic = true , bold = true , underline = true  })
hl(0, "BufferVisible"           ,{ fg="#988C99", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleMod"        ,{ fg="#EFEAD8", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleSign"       ,{ fg="#988C99", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleTarget"     ,{ fg="#EFEAD8", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactive"          ,{ fg="#988C99", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveMod"       ,{ fg="#988C99", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveSign"      ,{ fg="#988C99", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveTarget"    ,{ fg="#FA2C77", bg="#383a4c", italic = true , bold = true , underline = true  })
hl(0, "BufferTabLineSel"        ,{ fg="#EFEAD8", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferTabLineFill"       ,{ fg="#EFEAD8", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferCurrentIndex"      ,{ fg="#e7b898", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferCurrentSign"       ,{ fg="#ec7279", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferVisibleIndex"      ,{ fg="#988C99", bg="#383a4c", italic = false, bold = false, underline = false })
hl(0, "BufferInactiveIndex"     ,{ fg="#988C99", bg="#383a4c", italic = false, bold = false, underline = false })

-- End of File
