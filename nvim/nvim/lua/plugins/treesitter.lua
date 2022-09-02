-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- nvim-treesitter Plugin Configuration

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	ensure_installed = {
		"bash", "c", "cpp", "css", "html", "java", "javascript", "json",
		"lua","python", "regex", "vim", "yaml", "norg",
	},
	-- indent    = { enable = true },
	matchup   = { enable = true },
	autopairs = { enable = true },
	autotag   = { enable = true },
	endwise   = {
		enable  = true,
	},
	textsubjects = {
		enable         = false,
		prev_selection = ',',
		keymaps  = {
			['.']  = 'textsubjects-smart',
			[';']  = 'textsubjects-container-outer',
			['i;'] = 'textsubjects-container-inner',
		},
	},
	textobjects = {
		select = {
			enable    = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
			selection_modes = {
				['@function.outer']   = 'V', -- linewise
				['@sparameter.outer'] = 'v', -- charwise
				['@class.outer']      = '<c-v>', -- blockwise
			},
		},
		swap = {
			enable = false,
			swap_next = {
				["ap"] = "@parameter.inner",
			},
			swap_previous = {
				-- ["an"] = "@parameter.inner",
			},
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
