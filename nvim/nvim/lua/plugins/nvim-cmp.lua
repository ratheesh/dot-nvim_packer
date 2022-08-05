-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- nvim-cmp plugin configuration

local cmp     = require("cmp")
local types   = require("cmp.types")
local luasnip = require("luasnip")

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
			-- { name = 'nvim_lsp_signature_help' },
			{ name = "path",             		keyword_length = 2 },
			{ name = "luasnip",             keyword_length = 2 },
			{ name = "nvim_lsp",            keyword_length = 2 },
			{ name = "buffer",           		keyword_length = 2 },
			{ name = "nvim_lua",            keyword_length = 2 },
			-- { name = "conventionalcommits", keyword_length = 2 },
			-- { name = "treesitter",          keyword_length = 2 },
			-- { name = "tmux",                keyword_length = 2 },
			-- { name = "latex_symbols", keyword_length = 2 },
		},
		experimental = {
			ghost_text = { hl_group = 'CmpGhostText' }
		},
		performance = {
			trigger_debounce_time = 100
		},
		snippet = {
			expand = function(args) require("luasnip").lsp_expand(args.body) end,
		},
		-- sorting = {
		-- 	comparators = {
		-- 		-- function(entry1, entry2)
		-- 			--   local score1 = entry1.completion_item.score
		-- 			--   local score2 = entry2.completion_item.score
		-- 			--   if score1 and score2 then
		-- 			--     return (score1 - score2) < 0
		-- 			--   end
		-- 			-- end,
  --
		-- 			-- The built-in comparators:
		-- 			cmp.config.compare.offset,
		-- 			cmp.config.compare.exact,
		-- 			cmp.config.compare.score,
		-- 			require('cmp-under-comparator').under,
		-- 			cmp.config.compare.kind,
		-- 			cmp.config.compare.sort_text,
		-- 			cmp.config.compare.length,
		-- 			cmp.config.compare.order,
		-- 		},
		-- 	},
		formatting = {
			format = require('lspkind').cmp_format({
				preset     = 'codicons',
				mode       = 'symbol',
				symbol_map = icons,
				maxwidth   = 50,
				before = function (entry, vim_item)
					vim_item.menu = ({
						luasnip  = "[Snippet]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[Neovim]",
						buffer   = "[Buffer]",
						path     = "[Path]",
					})[entry.source.name]
					return vim_item
				end
			})
		},
		mapping = {
			['<C-n>']     = mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
			['<C-p>']     = mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
			["<C-u>"]     = mapping(mapping.scroll_docs(-4), { "i" }),
			["<C-d>"]     = mapping(mapping.scroll_docs(4),  { "i" }),
			['<C-Space>'] = mapping.complete(),
			["<C-e>"]     = mapping.abort(),
			['<C-y>']     = mapping.confirm({ select = true }),
			["<CR>"]      = mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
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
			end, { "i", "s" }),

			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					feedkeys(snippet_prev_keys, '')
				else
					fallback()
				end
			end, { "i", "s" }),
		}
	})
end

return M

-- End of File 
