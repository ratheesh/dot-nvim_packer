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
		enable = true,
		prev_selection = ',', -- (Optional) keymap to select the previous selection
		keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = 'textsubjects-container-outer',
			['i;'] = 'textsubjects-container-inner',
		},
	},
	rainbow   = {
		enable         = true,
		extended_mode  = true,
		max_file_lines = 1000,
		colors         = {
			"#e79498",
			"#ebcb8b",
			"#6B717C",
			"#FA2C77",
			"#1DAA89",
			"#698BB8",
			"#bd93f9"
		}
	},
})
-- End of File
