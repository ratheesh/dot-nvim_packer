-- plugins
--
local fn = vim.fn
pcall(require, "impatient")
pcall(require, "packer_compiled")
require("packer").startup({ function(use)
	use("lewis6991/impatient.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({
		"windwp/windline.nvim",
		config = function()
			require("windline_init")
		end,
	})
	use({ "junegunn/fzf.vim" })
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					-- separator_style = "thin",
					diagnostics = "nvim_lsp",
					custom_filter = function(buf)
						local ignored = { "dap-repl" }
						if not vim.tbl_contains(ignored, vim.api.nvim_buf_get_option(buf, "filetype")) then return true end
					end,
				},
				highlights = {
					background = { guifg = colors.grey_fg, guibg = colors.black2 },
					buffer_selected = { guifg = colors.white, guibg = colors.black },
					buffer_visible = { guifg = colors.light_grey, guibg = colors.black2 },
					error = { guifg = colors.light_grey, guibg = colors.black2 },
					error_diagnostic = { guifg = colors.light_grey, guibg = colors.black2 },
					close_button = { guifg = colors.light_grey, guibg = colors.black2 },
					close_button_visible = { guifg = colors.light_grey, guibg = colors.black2 },
					close_button_selected = { guifg = colors.red, guibg = colors.black },
					fill = { guifg = colors.grey_fg, guibg = colors.black2 },
					indicator_selected = { guifg = colors.black, guibg = colors.black },
					modified = { guifg = colors.red, guibg = colors.black2 },
					modified_visible = { guifg = colors.red, guibg = colors.black2 },
					modified_selected = { guifg = colors.green, guibg = colors.black },
					separator = { guifg = colors.black2, guibg = colors.black2 },
					separator_visible = { guifg = colors.black2, guibg = colors.black2 },
					separator_selected = { guifg = colors.black2, guibg = colors.black2 },
					tab = { guifg = colors.light_grey, guibg = colors.one_bg3 },
					tab_selected = { guifg = colors.black2, guibg = colors.blue },
					tab_close = { guifg = colors.red, guibg = colors.black },
				},
			})
		end,
	})
	use("nvim-lua/plenary.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		config = function() require("gitsigns").setup() end
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				ensure_installed = {
					"bash", "c", "cmake", "cpp", "css", "dockerfile", "go", "html", "java",
					"javascript", "json", "lua", "perl", "python", "r", "regex", "toml", "vim",
					"yaml",
				},
			})
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "▏",
				show_trailing_blankline_indent = false,
				show_first_indent_level = false,
				buftype_exclude = { "terminal" },
				filetype_exclude = { "help", "terminal", "dashboard", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults" }
			})
		end,
	})
	use({
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({
				char = "│"
			})
		end
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function() require("colorizer").setup({ "*" }, { names = false }) end,
	})
	use("wbthomason/packer.nvim")
	use({
		"SmiteshP/nvim-gps",
		event = "CursorHold",
		config = function()
			require("nvim-gps").setup({
				separator = "  ",
				icons = { ["container-name"] = " " }
			})
		end,
	})
	use({ "folke/lua-dev.nvim", after = "nvim-gps" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "lua-dev.nvim" })
	use({
		"neovim/nvim-lspconfig",
		after = "cmp-nvim-lsp",
		config = function()
			vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			vim.lsp.buf.rename = {
				float = function()
					local currName = vim.fn.expand("<cword>")
					local tshl = require("nvim-treesitter-playground.hl-info").get_treesitter_hl()
					if tshl and #tshl > 0 then
						local ind = tshl[#tshl]:match("^.*()%*%*.*%*%*")
						tshl = tshl[#tshl]:sub(ind + 2, -3)
						local allowed = { "TSVariable", "TSFuncBuiltin", "TSFunction", "TSField", "TSProperty" }
						if not vim.tbl_contains(allowed, tshl) then return end
					else
						return
					end

					local win = require('plenary.popup').create(currName, {
						title = "New Name",
						style = "minimal",
						borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						relative = "cursor",
						borderhighlight = "FloatBorder",
						titlehighlight = "Title",
						highlight = tshl,
						focusable = true,
						width = 25,
						height = 1,
						line = "cursor+2",
						col = "cursor-1"
					})

					local map_opts = { noremap = true, silent = true }
					vim.api.nvim_buf_set_keymap(0, "i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
					vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
					vim.api.nvim_buf_set_keymap(0, "i", "<CR>",
						"<cmd>stopinsert | lua vim.lsp.buf.rename.apply('" .. currName .. "'," .. win .. ")<CR>", map_opts)
					vim.api.nvim_buf_set_keymap(0, "n", "<CR>",
						"<cmd>stopinsert | lua vim.lsp.buf.rename.apply('" .. currName .. "'," .. win .. ")<CR>", map_opts)
				end,
				apply = function(curr, win)
					local newName = vim.trim(vim.fn.getline('.'))
					vim.api.nvim_win_close(tonumber(win), true)
					if #newName > 0 and newName ~= curr then
						local params = vim.lsp.util.make_position_params()
						params.newName = newName
						vim.lsp.buf_request(0, "textDocument/rename", params, function(err, res, ctx)
							if err then vim.notify(("Error running lsp query 'rename': " .. err), vim.log.levels.ERROR) end
							if res and res.changes then
								local msg = ""
								for f, c in pairs(res.changes) do
									local new = c[1].newText
									msg = msg .. ("%d changes -> %s"):format(#c, f:gsub("file://", ""):gsub(vim.fn.getcwd(), ".")) .. "\n"
									msg = msg:sub(1, #msg - 1)
									vim.notify(msg, vim.log.levels.INFO, { title = ("Rename: %s -> %s"):format(vim.fn.expand("<cword>"), new) })
								end
							end
							vim.lsp.util.apply_workspace_edit(res, vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
						end)
					end
				end
			}
			vim.diagnostic.config({ virtual_text = false, float = { show_header = false, border = "rounded" } })
			local function on_attach(client, bufnr)
				local function bufmap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

				local opts = { noremap = true, silent = true }
				bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				bufmap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				bufmap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
				bufmap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
				bufmap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
				bufmap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename.float()<CR>", opts)
				bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				bufmap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				bufmap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", opts)
				bufmap("n", "gx", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
				bufmap("n", "gz", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
				bufmap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
				bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
				require("illuminate").on_attach(client)
			end

			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
			-- capabilities.offsetEncoding = { "utf-16" }
			lspconfig.vimls.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.bashls.setup({ on_attach = on_attach, capabilities = capabilities })
			-- lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.ccls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					cache = {
						directory    = vim.env.HOME .. "/.ccls-cache",
						cacheFormat  = "json",
						rootPatterns = { "compile_commands.json", ".prettierrc.json", ".ccls", ".git/", ".svn/", ".hg/" },
						clang        = {
							extraArgs = { '--header-insertion=iwyu', '--suggest-missing-includes', '--cross-file-rename',
								'--completion-style=detailed', '--pch-storage=memory', '--header-insertion-decorators', '--all-scopes-completion' },
						},
					},

					flags = {
						debounce_text_changes = 50,
					};

					codeLens = {
						localVariables = true;
					},

					client = {
						snippetSupport = true;
					};

					completion = {
						placeholder   = true;
						detailedLabel = false;
						spellChecking = true;
						-- filterAndSort = false;
					};
					index = {
						onChange        = false,
						trackDependency = 1
					},
				},
			})
			lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.sumneko_lua.setup(require("lua-dev").setup({
				lspconfig = {
					on_attach = on_attach,
					capabilities = capabilities,
					cmd = { "lua-language-server" },
					settings = {
						Lua = {
							diagnostics = {
								disable = { "missing-parameter" }
							}
						}
					}
				}
			}))
			lspconfig.texlab.setup({ on_attach = on_attach, capabilities = capabilities })
			local win = require("lspconfig.ui.windows")
			local _default_opts = win.default_opts
			win.default_opts = function(options)
				local opts = _default_opts(options)
				opts.border = "rounded"
				return opts
			end
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			local ls = require("null-ls")
			local nls_utils = require "null-ls.utils"
			local sources = {
				ls.builtins.formatting.shfmt,
				ls.builtins.formatting.black,
				ls.builtins.formatting.autopep8,
				ls.builtins.formatting.isort,
				-- ls.builtins.formatting.stylua,

				ls.builtins.diagnostics.shellcheck,
				-- ls.builtins.diagnostics.vale.with({ args = '--config="$XDG_CONFIG_HOME/vale/vale.ini"' }),

				ls.builtins.code_actions.gitsigns,
				ls.builtins.code_actions.gitrebase,
			}
			ls.setup({
				debug = true,
				debounce = 50,
				save_after_format = false,
				sources = sources,
				root_dir = nls_utils.root_pattern ".git",
				-- offsetEncoding = { "utf-8" },

				-- on_init = function(new_client, _)
				-- new_client.offset_encoding = 'utf-32'
				-- end,

				on_attach = function(client)
					if client.server_capabilities.documentFormattingProvider then
						if vim.bo.filetype ~= 'c' or vim.bo.filetype ~= 'lua' then
							vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
						end
					end
				end
			})
		end,
	})
	use({
		"williamboman/nvim-lsp-installer",
		after = "nvim-lspconfig",
		config = function()
			require("nvim-lsp-installer").setup({
				automatic_installation = true,
				ui = {
					icons = {
						server_installed = "✓",
						server_pending = "➜",
						server_uninstalled = "✗"
					}
				}
			})
		end
	})
	use({
		"https://gitlab.com/yorickpeterse/nvim-dd.git",
		after = "null-ls.nvim",
		config = function()
			require("dd").setup({ timeout = 1 })
		end
	})
	use({
		"bellini666/trouble.nvim",
		after = "nvim-dd.git",
		config = function()
			require("trouble").setup({
				auto_open = true,
				auto_close = true,
				padding = false,
				height = 5,
				signs = { error = "", warning = "", hint = "", information = "", other = "", },
				track_cursor = true,
			})
		end,
	})
	use({
		"ray-x/lsp_signature.nvim",
		opt = false,
		after = "trouble.nvim",
		config = function() require("lsp_signature").setup({ doc_lines = 0, hint_enable = false }) end,
	})
	use({ "j-hui/fidget.nvim",
		-- after = "lsp_signature.nvim",
		config = function()
			require("fidget").setup({
				spinner = "dots",
				done = "✔ ",
				commenced = "Gestartet",
				completed = "Fertig",
			})
		end
	})
	use({ "RRethy/vim-illuminate", after = "fidget.nvim" })
	use({ "nvim-treesitter/playground" })
	use({
		"rcarriga/nvim-notify",
		after = "playground",
		config = function()
			require("notify").setup({ max_width = 40 })
			vim.notify = require("notify")
		end
	})
	use({
		"antoinemadec/FixCursorHold.nvim",
		after = "nvim-notify",
	})
	use({ "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } })
	use({
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
		config = function()
			local icons = {
				Text = "", Method = "", Function = "", Constructor = "", Field = "ﰠ",
				Variable = "", Class = "ﴯ", Interface = "", Module = "", Property = "ﰠ",
				Unit = "塞", Value = "", Enum = "", Keyword = "", Snippet = "",
				Color = "", File = "", Reference = "", Folder = "", EnumMember = "",
				Constant = "", Struct = "פּ", Event = "", Operator = "", TypeParameter = "",
			}
			local cmp = require("cmp")
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered({ winhighlight = "" }),
					documentation = cmp.config.window.bordered({ winhighlight = "" }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "path" },
					{ name = "latex_symbols" },
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
					fields = { 'kind', 'abbr', 'menu' }
				},
				mapping = {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
						else fallback()
						end
					end, { "i", "c" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
						else fallback()
						end
					end, { "i", "c" })
				}
			})
			-- cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
			-- cmp.setup.cmdline(':', { sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }) })
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI", })
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
	})
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
	use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })
	use({ "hrsh7th/cmp-cmdline", after = "cmp-nvim-lua" })
	use({ "hrsh7th/cmp-buffer", after = "cmp-cmdline" })
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
	use({ "kdheepak/cmp-latex-symbols", after = "cmp-path" })
	use({
		"echasnovski/mini.nvim",
		after = "cmp-latex-symbols",
		config = function()
			require("mini.surround").setup({ search_method = "cover_or_nearest" })
			require("mini.pairs").setup()
		end,
	})
	use({
		"numToStr/Comment.nvim",
		after = "mini.nvim",
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = {
					line = 'gcc',
					block = 'gbc',
				},
				opleader = {
					---Line-comment keymap
					line = 'gc',
					---Block-comment keymap
					block = 'gb',
				},

				extra = {
					above = 'gcO',
					below = 'gco',
					eol   = '<A-;>',
				},

				mappings = {
					basic = true,
					extra = true,
					extended = false,
				},
				pre_hook = nil,
				post_hook = nil,
			})
		end
	})
	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })
	use({
		"Yggdroot/LeaderF",
		cmd = "Leaderf",
		run = ":LeaderfInstallCExtension",
		config = function()
			vim.g.Lf_WindowPosition        = 'popup'
			vim.g.Lf_WorkingDirectoryMode  = 'Ac'
			vim.g.Lf_ShowDevIcons          = 0
			vim.g.Lf_DefaultMode           = 'NameOnly'
			vim.g.Lf_WindowHeight          = 0.3
			vim.g.Lf_PopupWidth            = 0.8
			vim.g.Lf_PopupPosition         = { 0, 0 }
			vim.g.Lf_UseVersionControlTool = 0
			vim.g.Lf_PopupShowBorder       = 1
			vim.g.Lf_PopupBorders          = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
			vim.g.Lf_ShowRelativePath      = 0
			vim.g.Lf_StlSeparator          = { left = "", right = "", font = "" }
		end
	})

	if vim.g.is_linux then
		use({ "ojroques/vim-oscyank", cmd = { 'OSCYank', 'OSCYankReg' } })
	end
	use({
		'romgrk/nvim-treesitter-context',
		after = { 'nvim-treesitter' },
		config = function()
			require('treesitter-context').setup({
				enable = true,
				throttle = true,
			})
		end
	})

	use({
		"mhinz/vim-startify",
		config = function()
			vim.g.startify_files_number = 5
			vim.g.startify_change_to_vcs_root = 1
			vim.g.startify_lists = {
				{ type = 'files', header = { '   Files' } },
				{ type = 'dir', header = { '   MRU ' } },
				{ type = 'sessions', header = { '   Sessions' } },
				{ type = 'bookmarks', header = { '   Bookmarks' } },
				{ type = 'commands', header = { '   Commands' } },
			}
			vim.g.startify_bookmarks = {
				{ c = '$HOME/.vim/vimrc' },
				{ g = '$HOME/.gitconfig' },
				{ s = '$HOME/.screenrc' },
				{ t = '$HOME/.tmux.conf' },
				{ z = '$HOME/.zshrc' },
			}
		end
	})
	-- The missing auto-completion for cmdline!
	use({
		"gelguy/wilder.nvim",
		opt = false,
		config = function()
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
						-- fuzzy_filter = wilder.lua_fzy_filter(),
					}),
					wilder.search_pipeline({
						pattern = wilder.python_fuzzy_pattern({
							start_at_boundary = 0,
						}),
						-- pattern = 'fuzzy',
					})
				),
			})
			wilder.set_option('renderer', wilder.wildmenu_renderer({
				highlighter = wilder.basic_highlighter(),
				-- highlighter = highlighters,
				separator = ' · ',
				left = { 'Wilder', wilder.wildmenu_spinner(), ' ' },
				right = { 'Idx', wilder.wildmenu_index() },
			})
			)
		end
	})
	use({ 'anuvyklack/hydra.nvim',
		requires = 'anuvyklack/keymap-layer.nvim',
		config = function()
			local Hydra = require('hydra')
			local gitsigns = require('gitsigns')
			local hint = [[
		_j_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line				^
		_k_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full  ^
		^ ^              _S_: stage buffer      ^ ^                 _/_: show base file   ^
		^
		^ ^              _q_/<Esc>: exit
		]]
			Hydra({
				hint = hint,
				config = {
					color = 'pink',
					invoke_on_body = true,
					hint = {
						position = 'bottom',
						border = 'rounded'
					},
					on_enter = function()
						vim.bo.modifiable = false
						gitsigns.toggle_signs(true)
						gitsigns.toggle_linehl(true)
					end,
					on_exit = function()
						gitsigns.toggle_signs(false)
						gitsigns.toggle_linehl(false)
						gitsigns.toggle_deleted(false)
						vim.cmd 'echo' -- clear the echo area
					end
				},
				mode = { 'n', 'x' },
				body = '<leader>g',
				heads = {
					{ 'j', function()
						if vim.wo.diff then return ']c' end
						vim.schedule(function() gitsigns.next_hunk() end)
						return '<Ignore>'
					end, { expr = true } },
					{ 'k', function()
						if vim.wo.diff then return '[c' end
						vim.schedule(function() gitsigns.prev_hunk() end)
						return '<Ignore>'
					end, { expr = true } },
					{ 's', ':Gitsigns stage_hunk<CR>', { silent = true } },
					{ 'u', gitsigns.undo_stage_hunk },
					{ 'S', gitsigns.stage_buffer },
					{ 'p', gitsigns.preview_hunk },
					{ 'd', gitsigns.toggle_deleted, { nowait = true } },
					{ 'b', gitsigns.blame_line },
					{ 'B', function() gitsigns.blame_line { full = true } end },
					{ '/', gitsigns.show, { exit = true } }, -- show the base of the file
					{ '<Esc>', nil, { exit = true, nowait = true } },
					{ 'q', nil, { exit = true, nowait = true } },
				}
			})
		end
	})
	use({ "tpope/vim-surround", event = "VimEnter" })
	use({ "michaeljsmith/vim-indent-object", event = "VimEnter" })
	use({ "tpope/vim-repeat", event = "VimEnter" })
	use({ "jeetsukumaran/vim-pythonsense", ft = { "python" } })
	use({ "machakann/vim-swap", event = "VimEnter" })
	use({ "ojroques/vim-oscyank", cmd = { 'OSCYank', 'OSCYankReg' } })
	-- use ({
	-- 	'goolord/alpha-nvim',
	-- 	requires = { 'kyazdani42/nvim-web-devicons' },
	-- 	config = function ()
	-- 		require'alpha'.setup(require'alpha.themes.startify'.config)
	-- 	end
	-- })
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = { "SnipRun", "SnipInfo" }
	})

	if Packer_bootstrap then
		require('packer').sync()
	end
end,
	config = {
		compile_path = fn.stdpath('config') .. '/lua/packer_compiled.lua',
		display = {
			prompt_border = "rounded",
			open_fn = function() return require("packer.util").float({ border = "rounded" }) end
		},
	},
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
	vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

-- End of File
