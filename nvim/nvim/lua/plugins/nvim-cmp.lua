local cmp     = require('cmp')
local types   = require('cmp.types')

local luasnip = require("luasnip")


local M = {}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local icons = {
	Text     = "",  Method = "", Function  = "", Constructor = "", Field         = "ﰠ",
	Variable = "",  Class  = "ﴯ", Interface = "", Module      = "", Property      = "ﰠ",
	Unit     = "塞", Value  = "", Enum      = "", Keyword     = "", Snippet       = "",
	Color    = "",  File   = "", Reference = "", Folder      = "", EnumMember    = "",
	Constant = "",  Struct = "פּ", Event     = "", Operator    = "", TypeParameter = "",
}

function M.setup()
	cmp.setup({
		window = {
			completion    = cmp.config.window.bordered({ winhighlight = "" }),
			documentation = cmp.config.window.bordered({ winhighlight = "" }),
		},
		sources = {
			{
				name = 'nvim_lsp_signature_help',
				priority = 100,
				group_index = 1,
			},
			{
				name = 'nvim_lsp',
				priority = 100,
				group_index = 1,
			},
			{
				name = 'nvim_lua',
				priority = 100,
				group_index = 1,
			},
			{
				name = 'luasnip',
				priority = 90,
				group_index = 2,
			},
			{
				name = 'buffer',
				priority = 80,
				autocomplete = false,
				group_index = 3,
			},
			{
				name = 'path',
				priority = 80,
				group_index = 3,
			},
			{
				name = 'spell',
				priority = 50,
				group_index = 3,
			},
			{
				name = 'calc',
				priority = 50,
				group_index = 3,
			},
		},
		experimental = { ghost_text = true },
		snippet = {
			expand = function(args) require("luasnip").lsp_expand(args.body) end,
		},
		formatting = {
			format = function(_, item)
				item.kind = icons[item.kind]
				return item
			end,
			fields = { 'kind', 'abbr' }
		},
		mapping = {
			['<C-n>']     = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
			['<C-p>']     = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
			["<C-d>"]     = cmp.mapping.scroll_docs(-4),
			["<C-f>"]     = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			["<C-e>"]     = cmp.mapping.abort(),
			['<C-y>']     = cmp.mapping.confirm({ select = true }),
			["<CR>"]      = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}
	})
end

return M
