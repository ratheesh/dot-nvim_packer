
require("bufferline").setup({
	options = {
		mode = 'buffers',
		indicator_icon = '▌',
		left_trunc_marker = ' ',
		right_trunc_marker = ' ',
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = {'', ''},
		numbers = 'ordinal',
		custom_filter = function(buf)

			local ignored = { "dap-repl" }
			if not vim.tbl_contains(ignored, vim.api.nvim_buf_get_option(buf, "filetype")) then return true end
		end,
	},
	highlights = {
		background = { guifg = colors.grey_fg, guibg = colors.black2 },
		buffer_visible = { guifg = colors.white, guibg = colors.black },
		buffer_selected = { guifg = "#99c794", guibg = "#383a4c" },
		numbers = { guifg = colors.white, guibg = colors.black },
		numbers_visible = { guifg = colors.white, guibg = colors.black },
		numbers_selected = { guifg = "#eeeeee", guibg = "#383a4c" },
		error = { guifg = colors.light_grey, guibg = colors.black2 },
		error_diagnostic = { guifg = colors.light_grey, guibg = colors.black2 },
		close_button = { guifg = colors.light_grey, guibg = colors.black2 },
		close_button_visible = { guifg = colors.light_grey, guibg = colors.black2 },
		close_button_selected = { guifg = colors.red, guibg = colors.black },
		fill = { guifg = "#cccccc", guibg = colors.black2 },
		indicator_selected = { guifg = "#ec7279", guibg = colors.black },
		modified = { guifg = colors.red, guibg = colors.black2 },
		modified_visible = { guifg = colors.red, guibg = colors.black2 },
		modified_selected = { guifg = colors.green, guibg = colors.black },
		separator = { guifg = "#909090", guibg = colors.black2 },
		separator_visible = { guifg = "#eeee00", guibg = "#ee0000" },
		separator_selected = { guifg = "#00ee00", guibg = colors.black },
		tab = { guifg = colors.light_grey, guibg = colors.one_bg3 },
		tab_selected = { guifg = colors.black2, guibg = colors.blue },
		tab_close = { guifg = colors.red, guibg = colors.black },
	},
})
