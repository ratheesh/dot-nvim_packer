-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- nvim-treesitter Plugin Configuration

require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	ensure_installed = {
		"bash", "c", "cpp", "css", "html", "java", "javascript", "json",
		"lua","python", "regex", "vim", "yaml",
	},
	-- indent    = { enable = true },
	matchup   = { enable = true },
	autopairs = { enable = true },
	endwise   = {
		enable  = true,
	},
	textsubjects = {
		enable         = true,
		prev_selection = ',',
		keymaps  = {
			['.']  = 'textsubjects-smart',
			[';']  = 'textsubjects-container-outer',
			['i;'] = 'textsubjects-container-inner',
		},
	},
	rainbow   = {
		enable         = true,
		extended_mode  = true,
		max_file_lines = nil,
		-- colors         = {
		-- 	"#e79498",
		-- 	"#4682B4",
		-- 	"#e7b898",
		-- 	"#AA4499",
		-- 	"#FA2CA7",
		-- 	"#B3C1A9",
		-- 	"#81A1C1"
		-- }
	},
})
-- End of File
