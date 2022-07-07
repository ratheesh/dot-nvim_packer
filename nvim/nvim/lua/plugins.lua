-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Plugin Configuration

local fn = vim.fn
-- local home = os.getenv("HOME")
local function stat(name, type)
	local stats = vim.loop.fs_stat(name)
	return stats and stats.type == type
end

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if not stat(install_path, "directory") then
	print("Cloning packer...")
	Packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

pcall(require, "impatient")
pcall(require, "packer_compiled")
require("packer").startup({ function(use)
	use("lewis6991/impatient.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({ "tpope/vim-repeat"    , event = "VimEnter" })
	use({"psliwka/vim-smoothie" , event = "VimEnter" })
	use({"majutsushi/tagbar"    , event = "VimEnter" })
	use({"sjl/gundo.vim"        , event = "VimEnter" })
	use({
		"windwp/windline.nvim",
		config = function()
			require("plugins.windline")
		end,
	})
	use({
		"romgrk/barbar.nvim",
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require("plugins.barbar")
		end
	})
	use({"chentoast/marks.nvim", config = function() require('marks').setup({}) end})
	use("nvim-lua/plenary.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		config = function() require("gitsigns").setup() end
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	})
	-- use({
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		require("indent_blankline").setup({
	-- 			char = "▏",
	-- 			show_trailing_blankline_indent = false,
	-- 			show_first_indent_level = false,
	-- 			buftype_exclude = { "terminal" },
	-- 			filetype_exclude = { "help", "terminal", "dashboard", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults" }
	-- 		})
	-- 	end,
	-- })
	use({
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({
				char = "│"
			})
		end
	})
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require 'nvim-lastplace'.setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true
			})
		end
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function() require("colorizer").setup({ "*" }, { names = false }) end,
	})
	use("wbthomason/packer.nvim")
	use({ "folke/lua-dev.nvim" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "lua-dev.nvim" })
	use({
		"neovim/nvim-lspconfig",
		after = "cmp-nvim-lsp",
		config = function()
			require("plugins.lsp").setup()
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.null-ls").setup()
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
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("nvim-navic").setup({
				highlight             = false,
				separator             = " > ",
				depth_limit           = 30,
				depth_limit_indicator = "..",
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
		-- "bellini666/trouble.nvim",
		"folke/trouble.nvim",
		after = "nvim-dd.git",
		config = function()
			require("trouble").setup({
				auto_open    = true,
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
	-- use({
	-- 	"ray-x/lsp_signature.nvim",
	-- 	opt = false,
	-- 	after = "trouble.nvim",
	-- 	config = function() require("lsp_signature").setup({ doc_lines = 0, hint_enable = false }) end,
	-- })
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				text = {
					spinner   = "dots",
					done      = "",
					commenced = "Gestartet",
					completed = "Fertig",
				},
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
		"stevearc/dressing.nvim",
		config = function() require("dressing").setup() end
	})
	use({
		"gbprod/yanky.nvim",
		-- after = "dressing",
		config = function()
			require("yanky").setup({
				ring = {
					history_length = 10,
					storage = "shada",
					sync_with_numbered_registers = true,
				},
				picker = {
					-- select = {
					-- 	action = {
					-- 		default = actions.put("p"),
					-- 		i = {
					-- 			["<c-p>"] = actions.put("p"),
					-- 			["<c-k>"] = actions.put("P"),
					-- 			["<c-x>"] = actions.delete(),
					-- 		},
					-- 		n = {
					-- 			p = actions.put("p"),
					-- 			P = actions.put("P"),
					-- 			d = actions.delete(),
					-- 		},
					-- 	},
					-- },
				},
				system_clipboard = {
					sync_with_ring = true,
				},
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 200,
				},
				preserve_cursor_position = {
					enabled = true,
				},
			})
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
		event = 'InsertEnter',
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-calc",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-emoji",
			"kdheepak/cmp-latex-symbols",
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				config = function()
					require("config.luasnip").setup()
				end,
			},
			"rafamadriz/friendly-snippets",
			disable = false,
		},
		config = function()
			require('plugins.nvim-cmp').setup()
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
	use({
		"echasnovski/mini.nvim",
		after = "cmp-latex-symbols",
		config = function()
			require("mini.indentscope").setup({
				symbol = '╎',
			})
		end,
	})
	use({
		"numToStr/Comment.nvim",
		-- after = "mini.nvim",
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
		after = "Comment.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup({
				window = {
					border   = "single",
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
	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })
	use({
		"mfussenegger/nvim-dap",
		wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python" },
		requires = {
			"Pocco81/DAPInstall.nvim",
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
		requires = "mfussenegger/nvim-dap",
		config = function ()
			require('dap-python').setup('python', {})
		end
	})
	use ({
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
		module = "dapui"
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function() require("nvim-dap-virtual-text").setup() end
	})
	use({
		"Yggdroot/LeaderF",
		cmd = { "Leaderf", "LeaderFRgInteractive" },
		run = ":LeaderfInstallCExtension",
		config = function()
			vim.g.Lf_WindowPosition        = 'popup'
			vim.g.Lf_WorkingDirectoryMode  = 'Ac'
			vim.g.Lf_ShowDevIcons          = 0
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
		use({ "ojroques/vim-oscyank", cmd = { 'OSCYank', 'OSCYankReg' } })
	end
	use({
		'p00f/nvim-ts-rainbow',
		after = { 'nvim-treesitter' },
	})
	use({
		'romgrk/nvim-treesitter-context',
		after = { 'nvim-treesitter' },
		config = function()
			require('treesitter-context').setup({
				enable    = true,
				throttle  = true,
				separator = '━',
			})
		end
	})
	use({
		"RRethy/nvim-treesitter-endwise",
		after = { "nvim-treesitter" },
	})
	use({
		"RRethy/nvim-treesitter-textsubjects",
		config = function()
			require('nvim-treesitter.configs').setup {
				textsubjects = {
					enable = true,
					prev_selection = ',', -- (Optional) keymap to select the previous selection
					keymaps = {
						['.'] = 'textsubjects-smart',
						[';'] = 'textsubjects-container-outer',
						['i;'] = 'textsubjects-container-inner',
					},
				},
			}
		end
	})
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
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
		config = function()
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
				{ type = 'dir'       , header = { '   MRU '      }},
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
	-- The missing auto-completion for cmdline!
	use({
		"gelguy/wilder.nvim",
		opt = false,
		requires = { "romgrk/fzy-lua-native", "nixprime/cpsm" },
		-- event = "VimEnter",
		config = function()
			require("plugins.wilder")
		end
	})
	use({ 'anuvyklack/hydra.nvim',
		requires = 'anuvyklack/keymap-layer.nvim',
		config = function()
			require("plugins.hydra")
		end
	})
	use({
		"junegunn/vim-easy-align",
	})
	use({ "tpope/vim-surround"              , event = "VimEnter" })
	use({ "michaeljsmith/vim-indent-object" , event = "VimEnter" })
	use({ "jeetsukumaran/vim-pythonsense"   , ft    = { "python" }})
	use({ "machakann/vim-swap"              , event = "VimEnter" })
	use({ "ojroques/vim-oscyank"            , cmd   = { 'OSCYank' , 'OSCYankReg' }})
	use({
		"antoyo/vim-licenses",
		config = function ()
			vim.g.licenses_copyright_holders_name = 'Ratheesh <ratheeshreddy@gmail.com>'
			vim.g.licenses_authors_name           = 'Ratheesh S'
			vim.g.licenses_default_commands       = { 'gplv2', 'apache', 'mit' }
		end
	})
	use ({
		"metakirby5/codi.vim",
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
		"bootleq/vim-cycle",
		config = function()
			require("plugins.vim-cycle")
		end
	})
	use({ 'dstein64/vim-startuptime' })

	if Packer_bootstrap then
		require('packer').sync()
	end
end,

config = {
	profile   = {
		enable    = true,
		threshold = 0,
	},
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

-- Avoid notification of few annoying repeatitive messages
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") or
		msg:match("Reason: breakpoint") or msg:match("Reason: step") then
		return
	end

	notify(msg, ...)
end

-- End of File
