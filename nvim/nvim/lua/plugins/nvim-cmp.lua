-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- nvim-cmp plugin configuration

local cmp     = require('cmp')
local types   = require('cmp.types')
local luasnip = require('luasnip')

local function check_backspace()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local feedkeys = vim.fn.feedkeys
local replace_termcodes = vim.api.nvim_replace_termcodes
local backspace_keys = replace_termcodes('<tab>', true, true, true)
local snippet_next_keys = replace_termcodes('<plug>luasnip-expand-or-jump', true, true, true)
local snippet_prev_keys = replace_termcodes('<plug>luasnip-jump-prev', true, true, true)
local mapping = cmp.mapping

local M = {}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local icons = {
	Text     = '',  Method = '', Function  = '', Constructor = '', Field         = 'ﰠ',
	Variable = '',  Class  = 'ﴯ', Interface = '', Module      = '', Property      = 'ﰠ',
	Unit     = '塞', Value  = '', Enum      = '', Keyword     = '', Snippet       = '',
	Color    = '',  File   = '', Reference = '', Folder      = '', EnumMember    = '',
	Constant = '',  Struct = 'פּ', Event     = '', Operator    = '', TypeParameter = '',
}

function M.setup()
	cmp.setup({
		window = {
			completion    = cmp.config.window.bordered({
				winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
				scrollbar = false,
			}),
			documentation = cmp.config.window.bordered({ winhighlight = 'Normal:CmpDocNormal' }),
		},
		sources = {
			-- { name = 'nvim_lsp_signature_help' },
			{ name = 'path'     },
			{ name = 'nvim_lsp' },
			{
				name = 'buffer',
				option = {
					get_bufnrs = function()
						local bufs = {}
						for _, win in ipairs(vim.api.nvim_list_wins()) do
							bufs[vim.api.nvim_win_get_buf(win)] = true
						end
						return vim.tbl_keys(bufs)
					end
				},
			},
			{ name = 'luasnip'  },
			{ name = 'nvim_lua' },
			{ name = 'conventionalcommits' },
		},
		experimental = {
			ghost_text = { hl_group = 'CmpGhostText' }
		},
		performance = {
			trigger_debounce_time = 100
		},
		snippet = {
			expand = function(args) require('luasnip').lsp_expand(args.body) end,
		},
		--[[ sorting = {
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.recently_used,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		}, ]]
		formatting = {
			format = require('lspkind').cmp_format({
				preset        = 'codicons',
				ellipsis_char = '...',
				mode          = 'symbol',
				symbol_map    = icons,
				maxwidth      = 60,
				before = function (entry, vim_item)
					vim_item.menu = ({
						luasnip  = '[Snippet]',
						nvim_lsp = '[LSP]',
						nvim_lua = '[Neovim]',
						buffer   = '[Buffer]',
						path     = '[Path]',
						cmp_tabnine = '[T9]',
					})[entry.source.name]
					return vim_item
				end
			})
		},
		mapping = {
			['<C-n>']     = mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
			['<C-p>']     = mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
			['<C-u>']     = mapping(mapping.scroll_docs(-4), { 'i' }),
			['<C-d>']     = mapping(mapping.scroll_docs(4),  { 'i' }),
			['<C-Space>'] = mapping.complete(),
			-- ['<C-e>']     = mapping.abort(),
			['<C-y>']     = mapping.confirm({ select = true }),
			['<CR>']      = mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
			['<Tab>'] 		= mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					feedkeys(snippet_next_keys, '')
				elseif check_backspace() then
					feedkeys(backspace_keys, 'n')
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { 'i', 's' }),

			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					feedkeys(snippet_prev_keys, '')
				else
					fallback()
				end
			end, { 'i', 's' }),
		}
	})
end

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })

return M

-- End of File
