-- License: MIT
-- wilder.nvim plugin settings

local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
wilder.set_option('pipeline', {
	wilder.debounce(100),
	wilder.branch(
	{
		wilder.check(function(_, x) return x == '' end),
		wilder.history(100),
	},
	wilder.python_file_finder_pipeline({
		file_command = function(_, arg)
			if string.find(arg, '.') ~= nil then
				return { 'fd', '-tf', '-H' }
			else
				return { 'fd', '-tf' }
			end
		end,
		dir_command = { 'fd', '-td' },
		filters = { 'cpsm_filter' },
	}),
	wilder.substitute_pipeline({
		pipeline = wilder.python_search_pipeline({
			skip_cmdtype_check = 1,
			pattern = wilder.python_fuzzy_pattern({
				start_at_boundary = 0,
			}),
		}),
	}),
	wilder.cmdline_pipeline({
		fuzzy = 2,
	}),
	wilder.search_pipeline({
		pattern = wilder.python_fuzzy_pattern({
			start_at_boundary = 0,
		}),
	})
	),
})
wilder.set_option('renderer', wilder.wildmenu_renderer({
	highlighter = wilder.basic_highlighter(),
	-- highlighter = highlighters,
	separator = ' · ',
	left = { ' Wilder', wilder.wildmenu_spinner(), ' ' },
	right = { '', 'Idx', wilder.wildmenu_index(), ' ' },
})
)
-- End of File
