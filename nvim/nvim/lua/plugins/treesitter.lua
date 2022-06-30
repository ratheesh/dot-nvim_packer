-- License: MiT
-- nvim-treesitter plugin settings
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	ensure_installed = {
		"bash", "c", "cpp", "css", "html", "java", "javascript", "json",
		"lua","python", "regex", "vim", "yaml",
	},
	-- indent    = { enable = true },
	matchup   = { enable = true },
	autopairs = { enable = true },
	rainbow   = {
		enable         = true,
		extended_mode  = true,
		max_file_lines = 1000,
		colors         = {
			"#bf616a",
			"#d08770",
			"#ebcb8b",
			"#a3be8c",
			"#88c0d0",
			"#5e81ac",
			"#b48ead"
		}
	},
})
-- End of File
