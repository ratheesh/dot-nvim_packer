-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Plugin Configuration

-- local fn = vim.fn
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_compiled_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
local packer_bootstrap = false

local present, impatient = pcall(require, "impatient")
if present then
	if impatient ~= nil then
		impatient.enable_profile()
	end
end

_G.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		vim.defer_fn(function()
			require("packer").loader(plugin)
		end, timer)
	end
end

_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath('cache')..'/luacache_chunks',
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath('cache')..'/luacache_modpaths',
	}
}

-- Bootstrap and install packer.
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  packer_bootstrap = true
  vim.fn.system({ "rm", "-f", packer_compiled_path })
  vim.fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  print("Bootstrapping Packer, please wait until installation is finished")
  vim.cmd("packadd packer.nvim")
end

if vim.fn.filereadable(packer_compiled_path) == 1 then
  -- Speed up loading of Lua modules. Note, this needs to happen BEFORE Lua
  -- plugins are loaded.
  require("impatient")
  -- Due to impatient, the packer_compiled file needs to be directly required.
  require("packer_compiled")
end

require("packer").startup({ function(use)
	use("lewis6991/impatient.nvim")
	use({ "kyazdani42/nvim-web-devicons", event = "VimEnter" })
	use({ "tpope/vim-repeat",             event = "CursorHold" })
	use({ "psliwka/vim-smoothie",         keys = { '<c-u>', '<c-d>' }})
	use({
		"mbbill/undotree",
		cmd = { "UndotreeToggle" },
		config = function ()
			vim.g.undotree_WindowLayout    = 4
			vim.g.undotree_ShortIndicators = 1
		end
	})
	use({
		"windwp/windline.nvim",
		after = "hydra.nvim",
		config = function()
			require("plugins.windline")
		end,
	})
	use({
		"romgrk/barbar.nvim",
		after = "alpha-nvim",
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require("plugins.barbar")
		end
	})
	use({
		"chentoast/marks.nvim",
		event = { "CursorHold" },
		config = function() require('marks').setup({}) end
	})
	use({ "nvim-lua/plenary.nvim", event = "VimEnter" })
	use({
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		-- wants = "colorizer",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					-- local gs = package.loaded.gitsigns
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					map({'o', 'x'}, 'ih', 'gitsigns.select_hunk()')
				end,
				diff_opts = {
					internal = true,
				},
				preview_config = {
					border   = "rounded",
					style    = "minimal",
					relative = "cursor",
					row      = 0,
					col      = 1
				}
			})
		end
	})
	use({
		"sindrets/diffview.nvim",
		module = "neogit",
		cmd    = "Neogit",
	})
	use({
		"TimUntersberger/neogit",
		after    = "diffview.nvim",
		cmd 		 = { "Neogit" },
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim"
		},
		config = function()
			require("neogit").setup({
				disable_signs = false,
				disable_hint  = false,
				disable_context_highlighting = false,
				disable_commit_confirmation  = false,
				signs = { section = { "", "" }, item = { "", "" } },
				integrations = { diffview = true },
				disable_builtin_notifications = false,
			})
		end
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		event = "VimEnter",
		config = function()
			require("plugins.treesitter")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		disable = true,
		after   = { "nvim-lspconfig" },
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
		disable = true,
		event = { "BufWinEnter" },
		config = function()
			require("virt-column").setup({
				char = "│"
			})
		end
	})
	use({
		"xiyaowong/virtcolumn.nvim",
		disable = false,
		event = "VimEnter",
		config = function ()
			vim.g.virtcolumn_char     = '▕'
			vim.g.virtcolumn_priority = 10
		end
	})
	use({
		"ethanholz/nvim-lastplace",
		event = { "VimEnter" },
		config = function()
			require 'nvim-lastplace'.setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true
			})
		end
	})
	use({
		"lilydjwg/colorizer",
		event = "CursorHold",
		-- after = "gitsigns.nvim",
		-- ft = { "text", "lua", "markdown", "help" }
	})
	use({ "wbthomason/packer.nvim" })
	use({ "folke/lua-dev.nvim", event = "VimEnter" })
	use({ "hrsh7th/cmp-nvim-lsp", event = "LspAttach" })
	use({
		"neovim/nvim-lspconfig",
		after = "cmp-nvim-lsp",
		event = "VimEnter",
		config = function()
			require("plugins.lsp").setup()
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "LspAttach",
		-- after = "nvim-lspconfig",
		config = function()
			require("plugins.null-ls").setup()
		end,
	})
	use({
		"williamboman/nvim-lsp-installer",
		disable = true,
		-- after = "nvim-lspconfig",
		cmd = { "LspInstall", "LspInstallLog", "LspInstallInfo", "LspPrintInstalled", "LspUninstall", "LspUninstallAll" },
		config = function()
			require("nvim-lsp-installer").setup({
				automatic_installation = false,
				ui = {
					border = "rounded",
					icons = {
						server_installed   = "✓",
						server_pending     = "➜",
						server_uninstalled = "✗"
					}
				}
			})
		end
	})
	use({
		"williamboman/mason.nvim",
		requires = "neovim/nvim-lspconfig",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		config = function ()
			require("mason").setup({
				automatic_installation = false,
				ui = {
					border = "rounded",
					icons = {
						package_installed   = "✓",
						package_pending     = "➜",
						package_uninstalled = "✗"
					}
				}
			})
		end
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		after = "mason.nvim",
		cmd = { "LspInstall", "LspUninstall"},
		config = function ()
			require("mason-lspconfig").setup({
				automatic_installation = false,
			})
		end
	})
	use({
		"weilbith/nvim-code-action-menu",
		-- after = "nvim-lspconfig",
		cmd = { "CodeActionMenu" }
	})
	use({
		"SmiteshP/nvim-navic",
		event = "LspAttach",
		wants = "nvim-lspconfig",
		requires = "neovim/nvim-lspconfig",
		-- after = "nvim-lspconfig",
		config = function()
			require("nvim-navic").setup({
				highlight             = false,
				separator             = "  ",
				depth_limit           = 3,
				depth_limit_indicator = "…",
			})
			vim.g.navic_silence = true
		end
	})
	use({"nanotee/sqls.nvim", ft = { "sql" }})
	use({
		"https://gitlab.com/yorickpeterse/nvim-dd.git",
		after = "null-ls.nvim",
		config = function()
			require("dd").setup({ timeout = 1 })
		end
	})
	use({
		-- "bellini666/trouble.nvim",
		"folke/trouble.nvim",
		event = "LspAttach",
		after = "nvim-dd.git",
		config = function()
			require("trouble").setup({
				auto_open    = false,
				auto_close   = true,
				padding      = false,
				height       = 5,
				signs        = { error = "", warning = "", hint = "", information = "", other = "", },
				track_cursor = true,

				action_keys = {
					close          = "q",
					cancel         = "<esc>",
					refresh        = "r",
					jump           = { "<cr>", "<tab>" },
					jump_close     = { "o" },
					toggle_mode    = "m",
					toggle_preview = "P",
					hover          = "K",
					preview        = "p",
					close_folds    = { "zM", "zm" },
					open_folds     = { "zR", "zr" },
					toggle_fold    = { "zA", "za" },
					previous       = "k",
					next           = "j"
				},
			})
		end,
	})
	use({
		"ray-x/lsp_signature.nvim",
		event = "LspAttach",
		wants = "nvim-lspconfig",
		config = function()
			require("lsp_signature").setup({
				bind 						= true,
				wrap            = true,
				floating_window = false,
				doc_lines       = 0,
				hint_enable     = true,
				hint_prefix     = "🐼 ",
				hint_scheme     = "String",
				hi_parameter    = "LspSignatureActiveParameter",
				handler_opts    = {
					border = "rounded"
				}
			})
		end,
	})
	use({
		"j-hui/fidget.nvim",
		opt   = true,
		event = "LspAttach",
		-- after = { "nvim-lspconfig" },
		config = function()
			require("fidget").setup({
				text = {
					spinner   = "moon",
					done      = "",
					commenced = "Gestartet",
					completed = "Fertig",
				},
				timer = {
					spinner_rate = 250,
					fidget_decay = 2000,
					task_decay   = 1000,
				},
			})
		end
	})
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		disable = true,
		after = "nvim-lspconfig",
		config = function()
			require("lsp_lines").setup()
			vim.keymap.set( "", "<Leader>L", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
		end,
	})
	-- use({ "RRethy/vim-illuminate", after = "fidget.nvim" })
	use({ "nvim-treesitter/playground", event = "LspAttach" })
	use({
		"rcarriga/nvim-notify",
		event = "VimEnter",
		config = function()
			require("notify").setup({ max_width = 40 })
			vim.notify = require("notify")
		end
	})
	use({
		"stevearc/dressing.nvim",
		-- after = { "yanky.nvim" },
		event = "VimEnter",
		disable = false,
		config = function() require("dressing").setup() end
	})
	use({
		"gbprod/yanky.nvim",
		disable = false,
		-- after = "dressing.nvim",
		cmd = { "YankyRingHistory" },
		config = function()
			require("yanky").setup({
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 100,
				},
				preserve_cursor_position = {
					enabled = true,
				},
			})
			vim.keymap.set("n", "p",  "<Plug>(YankyPutAfter)",   {})
			vim.keymap.set("n", "P",  "<Plug>(YankyPutBefore)",  {})
			vim.keymap.set("x", "p",  "<Plug>(YankyPutAfter)",   {})
			vim.keymap.set("x", "P",  "<Plug>(YankyPutBefore)",  {})
			vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)",  {})
			vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
			vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)",  {})
			vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})
		end
	})
	use({
		"antoinemadec/FixCursorHold.nvim",
		after = "nvim-notify",
	})
	use({ "rafamadriz/friendly-snippets", event = { "InsertEnter" }})
	use({
		"hrsh7th/nvim-cmp",
		disable = false,
		-- after = "friendly-snippets",
		event = 'InsertEnter',
		wants = { "LuaSnip" },
		requires = {
			{ "hrsh7th/cmp-nvim-lsp"},
			-- { "petertriho/cmp-git",       event = "VimEnter" },
			{ "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",         after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			-- { "davidsierradz/cmp-conventionalcommits", 	event = "nvim-cmp" },
			-- "f3fora/cmp-spell",
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "ray-x/cmp-treesitter", after = "nvim-cmp" },
			-- "hrsh7th/cmp-cmdline",
			-- "lukas-reineke/cmp-under-comparator",
			-- "hrsh7th/cmp-nvim-lsp-document-symbol",
			-- "hrsh7th/cmp-calc",
			-- "f3fora/cmp-spell",
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
			-- "hrsh7th/cmp-emoji",
			-- "kdheepak/cmp-latex-symbols",
			{ "andersevenrud/cmp-tmux", after = "nvim-cmp" },
			-- "petertriho/cmp-git",
			-- {
			-- 	"L3MON4D3/LuaSnip",
			-- 	after = "nvim-cmp",
			-- 	wants = "friendly-snippets",
				-- config = function()
				-- 	require("config.luasnip").setup()
				-- end,
			-- },
			-- { "rafamadriz/friendly-snippets", after = "nvim-cmp" },
		},
		config = function()
			require('plugins.nvim-cmp').setup()
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
		opt   = true,
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI", })
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
	})
	use({
		"echasnovski/mini.nvim",
		event = "CursorHold",
		config = function()
			require("plugins.mini").setup()
		end,
	})
	use({
		"numToStr/Comment.nvim",
		event = "CursorHold",
		keys = { "gc", "gcc", "gb", "gbc", "<A-;>" },
		config = function()
			require("Comment").setup({
				padding = true,
				sticky  = true,
				ignore  = nil,
				toggler = {
					line = 'gcc',
					block = 'gbc',
				},
				opleader = {
					---Line-comment keymap
					line  = 'gc',
					---Block-comment keymap
					block = 'gb',
				},

				extra = {
					above = 'gcO',
					below = 'gco',
					eol   = '<A-;>',
				},

				mappings = {
					basic    = true,
					extra    = true,
					extended = false,
				},
				pre_hook  = nil,
				post_hook = nil,
			})
		end
	})
	use({
		"folke/which-key.nvim",
		-- event = "VimEnter",
		keys = { "<space>" },
		config = function()
			local wk = require("which-key")
			wk.setup({
				window = {
					border   = "rounded",
					position = "bottom",
					margin   = { 1, 0, 1, 0 },
					padding  = { 2, 2, 2, 2 },
					winblend = 0
				},
				icons = {
					breadcrumb = "»",
					separator  = "➡  ",
					group      = " ",
				},
				plugins = {
					marks     = false,
					registers = false,
					spelling = {
						enabled     = false,
						suggestions = 20,
					},
				},
				presets = {
					operators    = false,
					motions      = false,
					text_objects = false,
					windows      = true,
					nav          = true,
					z            = true,
					g            = true,
				},
				key_labels = {
					["<space>"] = "SPC",
					["<cr>"]    = "RET",
					["<tab>"]   = "TAB",
				},
			})
			-- wk.register({}, {})
		end,
	})
	-- use({ "tweekmonster/startuptime.vim"})
	use({
		"mfussenegger/nvim-dap",
		opt   = true,
		-- keys  = { "<f5>" },
		ft = { "python" },
		-- event = "VimEnter",
		wants = { "dressing.nvim", "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python" },
		requires = {
			-- "Pocco81/DAPInstall.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
		},
		module = "dap",
		config = function()
			require('plugins.nvim-dap').setup()
		end
	})
	use ({
		"mfussenegger/nvim-dap-python",
		after = { "nvim-dap" },
		requires = "mfussenegger/nvim-dap",
		-- ft = { "python" },
		config = function ()
			require('dap-python').setup('python', {})
		end
	})
	use ({
		"rcarriga/nvim-dap-ui",
		after = { "nvim-dap" },
		config = function()
			require("dapui").setup()
		end,
		module = "dapui"
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		after = { "nvim-dap" },
		config = function() require("nvim-dap-virtual-text").setup() end
	})
	use({
		"Yggdroot/LeaderF",
		cmd = { "Leaderf", "LeaderfRgInteractive" },
		run = ":LeaderfInstallCExtension",
		config = function()
			vim.g.Lf_WindowPosition        = 'popup'
			vim.g.Lf_WorkingDirectoryMode  = 'Ac'
			vim.g.Lf_ShowDevIcons          = 1
			vim.g.Lf_ShowHidden 					 = 1
			vim.g.Lf_DefaultMode           = 'NameOnly'
			vim.g.Lf_WindowHeight          = 0.3
			vim.g.Lf_PopupWidth            = 0.8
			vim.g.Lf_PopupPosition         = { 0, 0 }
			vim.g.Lf_CursorBlink           = 0
			vim.g.Lf_UseVersionControlTool = 0
			vim.g.Lf_PopupShowStatusline   = 0
			vim.g.Lf_PopupShowBorder       = 1
			vim.g.Lf_PopupBorders          = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
			vim.g.Lf_ShowRelativePath      = 0
			vim.g.Lf_StlSeparator          = { left = "", right = "", font = "" }
		end
	})

	if vim.g.is_linux then
		use({ "ojroques/vim-oscyank", cmd = { 'OSCYank', 'OSCYankReg' }})
	end
	use({
		'p00f/nvim-ts-rainbow',
		after = "nvim-treesitter",
		requires = { 'nvim-treesitter' },
	})
	use({
		'romgrk/nvim-treesitter-context',
		event = "CursorHold",
		requires = { 'nvim-treesitter' },
		config = function()
			require('treesitter-context').setup({
				enable    = true,
				throttle  = true,
				separator = '━',
			})
		end
	})
	use ({
		"lewis6991/spellsitter.nvim",
		event = "CursorHold",
		config = function()
			require("spellsitter").setup()
		end
	})
	use({
		"RRethy/nvim-treesitter-endwise",
		event = "InsertEnter",
		requires = { "nvim-treesitter" },
	})
	use({
		"RRethy/nvim-treesitter-textsubjects",
		disable = true
	})
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup({
				disable_filetype          = { "TelescopePrompt", "vim" },
				ignored_next_char         = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
				enable_moveright          = true,
				enable_afterquote         = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, --- check bracket in same line
				check_ts                  = true,
				map_bs                    = true,
				map_c_w                   = true,
				map_c_h                   = true,
				map_cr                    = false })
		end
	})

	use({
		"mhinz/vim-startify",
		disable = true,
		config  = function()
		vim.g.startify_custom_header = {
             "",
             "                     ________   ++    ________",
             "                    /        \\++++  /        \\",
             "                    \\        /++++++\\        /",
             "                     |      |++++++++/     /'",
             "                     |      |++++++/     /'",
             "                    +|      |++++/     /'+",
             "                  +++|      |++/     /'+++++",
             "                +++++|      |/     /'+++++++++",
             "                  +++|           /'+++++++++",
             "                    +|         /'+++++++++",
             "                     |       /'+++++++++",
             "                     |     /'+++++++++",
             "                     |   /'+++++++++",
             "                     `_/'   ++++++",
             "                              ++",
             }
			vim.g.startify_files_number       = 5
			vim.g.startify_change_to_vcs_root = 1
			vim.g.startify_lists              = {
				{ type = 'files'     , header = { '   Files'     }},
				{ type = 'dir'       , header = { '   MRU'       }},
				{ type = 'sessions'  , header = { '   Sessions'  }},
				{ type = 'bookmarks' , header = { '   Bookmarks' }},
				{ type = 'commands'  , header = { '   Commands'  }},
			}
			vim.g.startify_bookmarks = {
				{ c = '$HOME/.vim/vimrc' },
				{ g = '$HOME/.gitconfig' },
				{ s = '$HOME/.screenrc'  },
				{ t = '$HOME/.tmux.conf' },
				{ z = '$HOME/.zshrc'     },
			}
		end
	})
	use ({
		"goolord/alpha-nvim",
		disable  = false,
		event    = "VimEnter",
		requires = { 'kyazdani42/nvim-web-devicons' },
		config   = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	})
	-- The missing auto-completion for cmdline!
	use({
		"gelguy/wilder.nvim",
		-- opt = false,
		event = "CmdlineEnter",
		-- wants = "nvim-web-devicons",
		run = ':UpdateRemotePlugins',
		requires = {
			{ "romgrk/fzy-lua-native", event = "CmdlineEnter" },
			-- { "nixprime/cpsm",         event = "CmdlineEnter" },
			"kyazdani42/nvim-web-devicons"
		},
		config = function()
			require("plugins.wilder")
		end
	})
	use({ 'anuvyklack/hydra.nvim',
		event = "VimEnter",
		requires = 'anuvyklack/keymap-layer.nvim',
		after = "gitsigns.nvim",
		config = function()
			require("plugins.hydra")
		end
	})
	use({ "junegunn/vim-easy-align", keys = { "ga" } })
	use ({
		'dccsillag/magma-nvim',
		disable = true,
		ft = { "python" },
		run = ':UpdateRemotePlugins'
	})
	-- use({ "tpope/vim-surround"              , event = "VimEnter" })
	use({
		"kylechui/nvim-surround",
		-- event = "InsertEnter",
		keys = {{'n', 'ys'}, {'n', 'ds'}, {'n', 'cs'}, {'x', 'S'}},
		disable = false,
		config = function ()
			require("nvim-surround").setup({
				highlight_motion = {
				duration = 0,
			}
		})
	end
	})
	use ({
    "machakann/vim-sandwich",
		event = "InsertEnter",
		disable = true,
		config = function ()
			vim.cmd("runtime macros/sandwich/keymap/surround.vim")
			vim.g.sandwich_recipes = {
				{
					buns         = {'{ ', ' }'},
					nesting      = 1,
					match_syntax = 1,
					kind         = {'add', 'replace'},
					action       = {'add'},
					input        = {'{'}
				},
				{
					buns         = {'[ ', ' ]'},
					nesting      = 1,
					match_syntax = 1,
					kind         = {'add', 'replace'},
					action       = {'add'},
					input        = {'['}
				},
				{
					buns         = {'( ', ' )'},
					nesting      = 1,
					match_syntax = 1,
					kind         = {'add', 'replace'},
					action       = {'add'},
					input        = {'('}
				},
				{
					buns         = {'{\\s*', '\\s*}'},
					nesting      = 1,
					regex        = 1,
					match_syntax = 1,
					kind         = {'delete', 'replace', 'textobj'},
					action       = {'delete'},
					input        = {'{'}
				},
				{
					buns         = {'[\\s*', '\\s*]'},
					nesting      = 1,
					regex        = 1,
					match_syntax = 1,
					kind         = {'delete', 'replace', 'textobj'},
					action       = {'delete'},
					input        = {'['}
				},
				{
					buns         = {'(\\s*', '\\s*)'},
					nesting      = 1,
					regex        = 1,
					match_syntax = 1,
					kind         = {'delete', 'replace', 'textobj'},
					action       = {'delete'},
					input        = {'('}
				},
			}
		end
  })
	use({
		"unblevable/quick-scope",
		disable = true,
		config = function ()
			vim.g.qs_ignorecase         = 1
			vim.g.qs_highlight_on_keys  = {'f', 'F', 't', 'T', 'b', 'B', ';', ','}
			vim.g.qs_lazy_highlight     = 1
			vim.g.qs_filetype_blacklist = {'dashboard', 'startify'}
		end
	})
	use({
		"jinh0/eyeliner.nvim",
		disable = true,
		config = function()
			require('eyeliner').setup {
				bold      = false,
				underline = false
			}
		end
	})
	-- use({ "michaeljsmith/vim-indent-object",    event = { "VimEnter"   }})
	-- use({ "mg979/vim-visual-multi",             event = { "VimEnter" }})
	-- use({ "machakann/vim-swap",                 event = { "VimEnter"   }})
	-- use({ "jeetsukumaran/vim-pythonsense",      ft    = { "python"     }})
	use({ "kana/vim-textobj-user",              event = { "CursorHold" }})
	use({ "coderifous/textobj-word-column.vim", keys  = { "vic", "viC" }})
	use({ "ojroques/vim-oscyank",               cmd   = { 'OSCYank' , 'OSCYankReg' }})
	use({
		"antoyo/vim-licenses",
		cmd = { "gplv2", "apache", "mit" },
		config = function ()
			vim.g.licenses_copyright_holders_name = 'Ratheesh <ratheeshreddy@gmail.com>'
			vim.g.licenses_authors_name           = 'Ratheesh S'
			vim.g.licenses_default_commands       = { 'gplv2', 'apache', 'mit' }
		end
	})
	use({ "andymass/vim-matchup", keys = { "%" }, event = { "CursorMoved" }})
	use ({
		"metakirby5/codi.vim",
		ft  = { "python" },
		cmd = { "Codi" },
		config = function ()
			-- vim.g.codi.virtual_text_prefix = ">>> "
			-- vim.g.codi.interpreters = {
			-- 	python= {
			-- 		bin = 'python',
			-- 		prompt= '^(>>>|...) '
			-- 	}
			-- }
		end
	})
	use({
		"jpalardy/vim-slime",
		-- event = "VimEnter",
		ft = { "python" },
		config = function ()
			vim.g.slime_target = "tmux"
			vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}
			vim.cmd([[ let g:slime_default_config = { 'socket_name': get(split($TMUX, ','), 0), 'target_pane': '{top-right}' } ]])
			vim.g.slime_bracketed_paste = 0
		end
	})
	use({
		"hanschen/vim-ipython-cell",
		-- event = "VimEnter",
		ft = { "python" },
		requires = "vim-slime",
		config = function()
		end
	})
	use({
		"bootleq/vim-cycle",
		-- event = "VimEnter",
		keys = { '+', '-' },
		config = function()
			require("plugins.vim-cycle")
		end
	})
	use({
		"winston0410/range-highlight.nvim",
		disable = true,
		event = "VimEnter",
		requires = { "winston0410/cmd-parser.nvim" },
		config = function ()
			require("range-highlight").setup()
		end
	})
	use({ "ratheesh/hiPairs", disable = false, event = "LspAttach" })
	use({
		"dhruvasagar/vim-table-mode",
		cmd = { "TableModeToggle" , "TableModeEnable", "TableModeDisable", "TableModeRealign" },
		config = function ()
			vim.g.table_mode_corner_corner   = '+'
			vim.g.table_mode_header_fillchar = '='
			vim.b.table_mode_corner          = '+'
		end
	})
	use({
		"lewis6991/satellite.nvim",
		event = "CursorHold",
		requires = "nvim-lspconfig",
		config=function ()
			require('satellite').setup {
				current_only = false,
				winblend = 0,
				zindex   = 40,
				excluded_filetypes = {},
				width = 2,
				handlers = {
					search = {
						enable = true,
					},
					diagnostic = {
						enable = true,
					},
					gitsigns = {
						enable = true,
					},
					marks = {
						enable = true,
						show_builtins = false,
					},
				},
			}
		end
	})
	use({
		"b0o/incline.nvim",
		event = "BufWinEnter",
		-- after = "nvim-web-devicons",
		config = function ()
			require('incline').setup({
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
					local icon, icon_color = require('nvim-web-devicons').get_icon_color(filename)
					return {
						{ icon, guifg = icon_color },
						{ ' ' },
						{ filename,  guifg = "#F06372", guibg = nil, gui = "italic" },
					}
				end,
				window = {
					zindex = 60,
					width  = "fit",
					placement = { horizontal = "right", vertical = "top" },
					margin = {
						horizontal = { left = 1, right = 1 },
						vertical   = { bottom = 0, top = 1 },
					},
					padding      = { left = 1, right = 1 },
					padding_char = " ",
					winhighlight = {
						Normal = "TreesitterContext",
					},
				},
				ignore = {
					floating_wins = true,
					unlisted_buffers = true,
					filetypes = {},
					buftypes = 'special',
					wintypes = 'special',
				},
				hide = {
					cursorline  = true,
					focused_win = false,
					only_win    = false
				},
			})
		end
	})
	use({ 'dstein64/vim-startuptime', cmd = { "StartupTime" }})

	if packer_bootstrap then
		require('packer').sync()
	end
end,

config = {
	keybindings = {
		quit          = '<Esc>',
		toggle_info   = '<CR>',
		diff          = 'd',
		prompt_revert = 'r',
	},
	profile   = {
		enable    = true,
		threshold = 0,
	},
	compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
	display = {
		prompt_border   = "rounded",
		non_interactive = false,
		open_fn = function() return require("packer.util").float({ border = "rounded" }) end
	},
},
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
	vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end

-- Avoid notification of few annoying repeatitive messages
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("Reason: breakpoint") or msg:match("Reason: step") then
		return
	end

	notify(msg, ...)
end

-- End of File
