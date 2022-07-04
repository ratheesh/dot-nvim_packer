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
		-- filters = { 'cpsm_filter' },
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
wilder.set_option('renderer', wilder.wildmenu_renderer(
	wilder.wildmenu_airline_theme({
		highlights = {
			default         = wilder.make_hl('WilderStatus',         'WildStatus'),
			accent          = wilder.make_hl('WilderAccent',         'WildAccent'),
			index           = wilder.make_hl('WilderIndex',          'WildIndex'),
			mode            = wilder.make_hl('WilderMode',           'WildMode'),
			selected        = wilder.make_hl('WilderSelected',       'WildSelected'),
			selected_accent = wilder.make_hl('WilderSelectedAccent', 'WildSelectedAccent'),
			separator       = wilder.make_hl('WilderSeparator',      'WildSeparator'),
			left_arrow      = wilder.make_hl('Left',                 'WildSepLeft'),
			right_arrow     = wilder.make_hl('Right',                'WildSepRight'),
			left_arrow2     = wilder.make_hl('Left2',                'WildSepLeft2'),
			right_arrow2    = wilder.make_hl('Right2',               'WildSepRight2'),
		},
		highlighter = wilder.basic_highlighter(),
		separator = ' • ',
		use_powerline_symbols = true,
		-- powerline_symbols = {'', ''},
	})
))
-- End of File
