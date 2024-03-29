-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Plugin Configuration

-- local fn = vim.fn
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_compiled_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua'
local packer_bootstrap = false

_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath('cache') .. '/luacache_chunks',
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
	}
}

local present, impatient = pcall(require, 'impatient')
if present then
	if impatient ~= nil then
		impatient.enable_profile()
	end
end

_G.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		vim.defer_fn(function()
			require('packer').loader(plugin)
		end, timer)
	end
end

-- Bootstrap and install packer.
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  packer_bootstrap = true
  vim.fn.system({ 'rm', '-f', packer_compiled_path })
	print('Bootstrapping Packer!, Cloning new copy to', packer_path)
  vim.fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    packer_path,
  })
  print('Bootstrapping Packer, please wait until installation is finished')
  vim.cmd('packadd packer.nvim')
end

if vim.fn.filereadable(packer_compiled_path) == 1 then
  -- Speed up loading of Lua modules. Note, this needs to happen BEFORE Lua
  -- plugins are loaded.
  require('impatient')
  -- Due to impatient, the packer_compiled file needs to be directly required.
  require('packer_compiled')
	require('global')
end

require('packer').startup({ function(use)
	use({'lewis6991/impatient.nvim'})
	use({
		'kyazdani42/nvim-web-devicons',
		-- event = 'VimEnter',
		config = function()
			require('nvim-web-devicons').setup {
				override = {
					sh = {
						icon  = '',
						color = '#994C5F',
						name  = 'sh'
					},
					lua = {
						icon  = '',
						color = '#A070C8',
						name  = 'lua'
					},
					md = {
						icon  = ' ',
						color = '#EC318C',
						name  = 'md'
					},
					java = {
						icon  = '',
						color = '#B3C1A9',
						name  = 'java'
					},
					python = {
						icon  = ' ',
						color = '#f781bf',
						name  = 'py'
					},
					gitcommit = {
						icon  = '',
						color = '#e7b898',
						name  = 'gitcommit'
					},
				}
			}
		end
	})
	use({ 'tpope/vim-repeat',     event = 'CursorHold'      })
	use({ 'psliwka/vim-smoothie', keys = { '<c-u>', '<c-d>' }})
	use({
		'mbbill/undotree',
		disable = true,
		cmd = { 'UndotreeToggle' },
		keys = { '<space>u' },
		config = function ()
			vim.g.undotree_WindowLayout    = 4
			vim.g.undotree_ShortIndicators = 1
		end
	})
	use({
		'windwp/windline.nvim',
		after = { 'hydra.nvim' },
		config = function()
			require('plugins.windline')
		end,
	})
	use({
		'akinsho/bufferline.nvim',
		after = 'alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require('plugins.bufferline')
		end
	})
	use({
		'romgrk/barbar.nvim',
		disable = true,
		after = 'alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('plugins.barbar')
		end
	})
	use({
		'chentoast/marks.nvim',
		event = { 'CursorHold' },
		config = function() require('marks').setup({}) end
	})
	use({ 'nvim-lua/plenary.nvim', event = 'VimEnter' })
	use({
		'lewis6991/gitsigns.nvim',
		event = 'VimEnter',
		-- wants = 'colorizer',
		config = function()
			require('gitsigns').setup({
				on_attach = function(bufnr)
					-- local gs = package.loaded.gitsigns
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
				end,
				diff_opts = {
					internal = true,
				},
				preview_config = {
					border   = 'rounded',
					style    = 'minimal',
					relative = 'cursor',
					row      = 0,
					col      = 1
				}
			})
		end
	})
	use({
		'akinsho/git-conflict.nvim',
		disable = false,
		config = function()
			 require('git-conflict').setup()
		end
	})
	use({
		'sindrets/diffview.nvim',
		module = 'neogit',
		cmd    = 'Neogit',
	})
	use({
		'TimUntersberger/neogit',
		after    = 'diffview.nvim',
		cmd 		 = { 'Neogit' },
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		},
		config = function()
			require('neogit').setup({
				disable_signs = false,
				disable_hint  = false,
				disable_context_highlighting = false,
				disable_commit_confirmation  = false,
				signs = { section = { '', '' }, item = { '', '' } },
				integrations = { diffview = true },
				disable_builtin_notifications = false,
			})
		end
	})
	use({ 'microsoft/python-type-stubs', opt = true, event = 'VimEnter' })
	use({
		'lvimuser/lsp-inlayhints.nvim',
		disable = false,
		branch = 'anticonceal',
		event = { 'LspAttach' },
		requires = { 'nvim-lspconfig' },
		config = function ()
			require('lsp-inlayhints').setup()
		end
	})
	use({
		'simrat39/inlay-hints.nvim',
		disable = true,
		after = 'nvim-lspconfig',
		config = function ()
			require('inlay-hints').setup({
				only_current_line = true,
				-- eol = {
				-- 	right_align = true,
				-- }
			})
		end
	})
	use({
		'lewis6991/hover.nvim',
		event = 'LspAttach',
		require = 'nvim-lspconfig',
		config = function()
			require('hover').setup {
				init = function()
					-- Require providers
					require('hover.providers.lsp')
					require('hover.providers.man')
					-- require('hover.providers.gh')
					-- require('hover.providers.dictionary')
				end,
				preview_opts = {
					border = 'rounded',
				},
				title = true
			}
			vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
			-- vim.keymap.set('n', 'gK', require('hover').hover_select, { desc='hover.nvim (select)' })
		end
	})
	use({
		'nvim-treesitter/nvim-treesitter',
		-- event = { 'VimEnter' },
		opt = false,
		run = ':TSUpdate',
		-- module = 'treesitter',
		config = function()
			require('plugins.treesitter')
		end,
	})
	use({
		'nvim-treesitter/nvim-treesitter-textobjects',
		event = 'CursorHold',
		requires = 'nvim-treesitter',
		after = 'nvim-treesitter',
	})
	use({
		'xiyaowong/virtcolumn.nvim',
		disable = false,
		-- event   = 'LspAttach',
		-- ft      = { 'gitcommit', 'c' },
		config = function ()
			-- vim.g.virtcolumn_char     = '│'
			vim.g.virtcolumn_char = '▕'
			vim.g.virtcolumn_priority = 0
		end
	})
	use({
		'ethanholz/nvim-lastplace',
		after = 'nvim-treesitter',
		-- event = { 'VimEnter' },
		config = function()
			require ('nvim-lastplace').setup({
				lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
				lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
				lastplace_open_folds = true
			})
		end
	})
	use({
		'mrshmllow/document-color.nvim',
		disable = false,
		event   = 'LspAttach',
		config  = function ()
			require('document-color').setup({
				mode = 'background',
			})
		end
	})
	use({
		'brenoprata10/nvim-highlight-colors',
		disable = true,
		event =  { 'VimEnter' },
		config = function ()
			require('nvim-highlight-colors').setup ({
				render = 'background',
				enable_tailwind = false
			})
		end
	})
	use({
		'NvChad/nvim-colorizer.lua',
		disable = false,
		event = 'VimEnter',
		-- opt =  true,
		-- after = { 'nvim-treesitter' },
		-- module = 'colorizer',
		config = function ()
			require('colorizer').setup()
			vim.cmd([[ColorizerAttachToBuffer]])
		end
	})
	use({ 'wbthomason/packer.nvim' })
	use({
		'folke/neodev.nvim',
		event = 'VimEnter',
		config = function()
			require('neodev').setup({
				plugins = false,
				-- plugins = { 'nvim-treesitter', 'plenary.nvim' },
			})
		end
	})
	-- use({ 'hrsh7th/cmp-nvim-lsp', event = 'VimEnter' })
	use({
		'neovim/nvim-lspconfig',
		requires = { 'cmp-nvim-lsp', 'nvim-treesitter' },
		after    = { 'cmp-nvim-lsp', 'mason.nvim' },
		-- event = 'VimEnter',
		config = function()
			require('plugins.lsp').setup()
			-- require('plugins.lsp.init')
			require('lspconfig.ui.windows').default_options.border = 'rounded'
		end,
	})
	use({
		'jose-elias-alvarez/null-ls.nvim',
		event = 'LspAttach',
		ft = { 'gitcommit', 'python', 'c', 'cpp', 'java', 'html', 'css', 'json', 'sh', 'vim' },
		-- after = 'nvim-lspconfig',
		config = function()
			require('plugins.null-ls').setup()
		end,
	})
	use ({
		'ThePrimeagen/refactoring.nvim',
		after = 'null-ls.nvim',
		disable = false,
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-treesitter/nvim-treesitter'}
		}
	})
	use({
		'williamboman/mason.nvim',
		requires = 'neovim/nvim-lspconfig',
		event = 'VimEnter',
		cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
		config = function ()
			require('mason').setup({
				automatic_installation = false,
				ui = {
					border = 'rounded',
					icons = {
						package_installed   = '✓',
						package_pending     = '➜',
						package_uninstalled = '✗'
					}
				}
			})
			require('plugins.lsp.pylance')
		end
	})
	use({
		'williamboman/mason-lspconfig.nvim',
		after = 'mason.nvim',
		cmd = { 'LspInstall', 'LspUninstall'},
		config = function ()
			require('mason-lspconfig').setup({
				-- require('plugins.lsp.init'),
				ensure_installed = { 'sumneko_lua', 'clangd', 'html', 'bashls', 'jedi_language_server', 'jdtls' },
				automatic_installation = true,
			})
		end
	})
	use({
		'weilbith/nvim-code-action-menu',
		cmd = { 'CodeActionMenu' }
	})
	use({'nanotee/sqls.nvim', ft = { 'sql' }})
	use({
		'https://gitlab.com/yorickpeterse/nvim-dd.git',
		after = 'null-ls.nvim',
		config = function()
			require('dd').setup({ timeout = 1 })
		end
	})
	use({
		'folke/trouble.nvim',
		event = 'LspAttach',
		after = 'nvim-dd.git',
		config = function()
			require('trouble').setup({
				auto_open    = false,
				auto_close   = true,
				padding      = false,
				height       = 5,
				signs        = { error = '', warning = '', hint = '', information = '', other = '', },
				track_cursor = true,

				action_keys = {
					close          = 'q',
					cancel         = '<esc>',
					refresh        = 'r',
					jump           = { '<cr>', '<tab>' },
					jump_close     = { 'o' },
					toggle_mode    = 'm',
					toggle_preview = 'P',
					hover          = 'K',
					preview        = 'p',
					close_folds    = { 'zM', 'zm' },
					open_folds     = { 'zR', 'zr' },
					toggle_fold    = { 'zA', 'za' },
					previous       = 'k',
					next           = 'j'
				},
			})
		end,
	})
	use({
		'ray-x/lsp_signature.nvim',
		disable = false,
		event = 'LspAttach',
		wants = 'nvim-lspconfig',
		config = function()
			require('lsp_signature').setup({
				bind 						= true,
				wrap            = true,
				floating_window = false,
				doc_lines       = 0,
				hint_enable     = true,
				hint_prefix     = '🐼 ',
				hint_scheme     = 'String',
				hi_parameter    = 'LspSignatureActiveParameter',
				handler_opts    = {
					border = 'rounded'
				}
			})
		end,
	})
	use({
		'j-hui/fidget.nvim',
		disable = true,
		opt   = true,
		-- branch = 'menu-border',
		event = 'LspAttach',
		-- after = { 'nvim-lspconfig' },
		config = function()
			require('fidget').setup({
				text = {
					spinner   = 'moon',
					done      = '',
					commenced = 'Gestartet',
					completed = 'Fertig',
				},
				window = {
					border = 'rounded',
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
		'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
		disable = false,
		event = 'LspAttach',
		config = function()
			require('lsp_lines').setup()
			vim.keymap.set( '', '<Leader>L', require('lsp_lines').toggle, { desc = 'Toggle lsp_lines' })
			vim.defer_fn(function() vim.diagnostic.config({ virtual_lines = false }) end, 50)
		end,
	})
	use({
		'dnlhc/glance.nvim',
		disable = false,
		event = 'LspAttach',
		config = function()
			require('glance').setup({
				border = {
					enable      = true,
					top_char    = '─',
					bottom_char = '─',
				},
			})
		end,
	})
	-- use({ 'RRethy/vim-illuminate', after = 'fidget.nvim' })
	use({ 'nvim-treesitter/playground', event = 'LspAttach' })
	use({
		'rcarriga/nvim-notify',
		disable = false,
		event = 'VimEnter',
		config = function()
			require('notify').setup({ max_width = 40 })
			vim.notify = require('notify')
		end
	})
	use ({
		'vigoux/notifier.nvim',
		disable = true,
		event = 'VimEnter',
		opt = true,
		config = function()
			require('notifier').setup({
				notify = {
					clear_time = 5000,
					min_level = vim.log.levels.TRACE,
				},
				component_name_recall = false,
			})
		end
	})
	use({
		'mfussenegger/nvim-jdtls',
		disable = true,
		ft = { 'java' }
	})
	use({
		'stevearc/dressing.nvim',
		disable = false,
		opt     = true,
		event   = 'VimEnter',
		config  = function() require('dressing').setup() end
	})
	use({ 'rafamadriz/friendly-snippets', disable = false, event = { 'InsertEnter', 'CmdlineEnter' }})
	use({
		'L3MON4D3/LuaSnip',
		disable = false,
		requires = { 'rafamadriz/friendly-snippets' },
		after = 'friendly-snippets',
		config = function()
			require('luasnip').config.set_config({ history = true, updateevents = 'TextChanged,TextChangedI', })
			require('luasnip/loaders/from_vscode').lazy_load()
		end,
	})
	use({ 'saadparwaiz1/cmp_luasnip',            after = 'nvim-cmp' })
	use({ 'hrsh7th/cmp-buffer',                    after = 'nvim-cmp' })
	use({ 'hrsh7th/cmp-nvim-lsp',                  after = 'nvim-cmp' })
	use({ 'hrsh7th/cmp-nvim-lua',                  after = 'nvim-cmp' })
	use({ 'hrsh7th/cmp-cmdline',                   after = 'nvim-cmp' })
	use({ 'kdheepak/cmp-latex-symbols',            after = 'nvim-cmp' })
	use({ 'hrsh7th/cmp-path',                      after = 'nvim-cmp' })
	use({ 'hrsh7th/cmp-nvim-lsp-signature-help',   after = 'nvim-cmp' })
	use({ 'onsails/lspkind-nvim',                  after = 'nvim-cmp' })
	--[[ use({ 'hrsh7th/cmp-vsnip',                     after = 'nvim-cmp' })
	use({ 'hrsh7th/vim-vsnip',                     after = 'nvim-cmp' }) ]]
	use({ 'nat-418/cmp-color-names.nvim',          after = 'nvim-cmp' })
	use({ 'davidsierradz/cmp-conventionalcommits', after = 'nvim-cmp' })
	use({
		'hrsh7th/nvim-cmp',
		disable = false,
		event = { 'InsertEnter', 'CmdlineEnter' },
		requires = {
			-- { 'L3MON4D3/LuaSnip'  },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer',       after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-path',         after = 'nvim-cmp' },
			{ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lua',     after = 'nvim-cmp' },
			{ 'onsails/lspkind.nvim',     after = 'nvim-cmp' },
			{ 'davidsierradz/cmp-conventionalcommits', 	after = 'nvim-cmp' },
		},
		config = function()
			require('plugins.nvim-cmp').setup()
		end,
	})
	use({
		'echasnovski/mini.indentscope',
		event = 'CursorHold',
		config = function()
			require('mini.indentscope').setup({
				symbol = '╎',
			})
		end,
	})
	use({
		'numToStr/Comment.nvim',
		event = 'CursorHold',
		keys = { 'gc', 'gcc', 'gb', 'gbc', '<A-;>' },
		config = function()
			require('Comment').setup({
				padding = true,
				sticky  = true,
				ignore  = nil,
				toggler = {
					line = 'gcc',
					block = 'gbc',
				},
				opleader = {
					line  = 'gc',
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
				pre_hook = function(ctx)
					local line_start = (ctx.srow or ctx.range.srow) - 1
					local line_end = ctx.erow or ctx.range.erow
					-- require('lsp-inlayhints.core').clear(0, line_start, line_end)
					vim.api.nvim_buf_clear_namespace(0, -1, line_start, line_end)
				end,
				post_hook = nil,
			})
		end
	})
	use({
		'nvim-neo-tree/neo-tree.nvim',
		disable = false,
		event = 'VimEnter',
		cmd = { 'Neotree' },
		requires = {
			'MunifTanjim/nui.nvim',
    },
		config = function ()
			require('neo-tree').setup({
				close_if_last_window = false,
				enable_diagnostics = true,
				enable_git_status = true,
				popup_border_style = 'rounded',
				sort_case_insensitive = false,
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
				window = { width = 30 },
			})
		end
	})
	use({
		'folke/which-key.nvim',
		disable = true,
		-- event = 'VimEnter',
		keys = { '<space>' },
		config = function()
			local wk = require('which-key')
			wk.setup({
				window = {
					border   = 'rounded',
					position = 'bottom',
					margin   = { 1, 0, 1, 0 },
					padding  = { 2, 2, 2, 2 },
					winblend = 0
				},
				icons = {
					breadcrumb = '»',
					separator  = '➡  ',
					group      = ' ',
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
					['<space>'] = 'SPC',
					['<cr>']    = 'RET',
					['<tab>']   = 'TAB',
				},
			})
		-- wk.register({}, {})
		end,
	})
	use({ 'tweekmonster/startuptime.vim', cmd = { 'StartupTime' }})
	use({
		'mfussenegger/nvim-dap',
		opt   = true,
		-- keys  = { '<f5>' },
		-- ft = { 'python' },
		-- event = 'VimEnter',
		wants = { 'dressing.nvim', 'nvim-dap-virtual-text', 'nvim-dap-ui', 'nvim-dap-python' },
		requires = {
			-- 'Pocco81/DAPInstall.nvim',
			'theHamsta/nvim-dap-virtual-text',
			'rcarriga/nvim-dap-ui',
			'mfussenegger/nvim-dap-python',
		},
		module = 'dap',
		config = function()
			require('plugins.nvim-dap').setup()
		end
	})
	use ({
		'mfussenegger/nvim-dap-python',
		after = { 'nvim-dap' },
		requires = 'mfussenegger/nvim-dap',
		config = function ()
			require('dap-python').setup('python', {})
		end
	})
	use ({
		'rcarriga/nvim-dap-ui',
		after = { 'nvim-dap' },
		config = function()
			require('dapui').setup()
		end,
		module = 'dapui'
	})
	use({
		'theHamsta/nvim-dap-virtual-text',
		after = { 'nvim-dap' },
		config = function() require('nvim-dap-virtual-text').setup() end
	})
	use({
		'nvim-telescope/telescope.nvim',
		disable = false,
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 },
			{ 'nvim-telescope/telescope-project.nvim' },
			{ 'desdic/telescope-rooter.nvim' },
			{ 'debugloop/telescope-undo.nvim' },
		},
		config = function()
			require('plugins.telescope').setup()
		end
	})
	use({
		'Yggdroot/LeaderF',
		disable = true,
		cmd = { 'Leaderf', 'LeaderfRgInteractive' },
		run = '<cmd>LeaderfInstallCExtension<cr>',
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
			vim.g.Lf_PopupBorders          = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
			vim.g.Lf_ShowRelativePath      = 0
			vim.g.Lf_StlSeparator          = { left = '', right = '', font = '' }

			local function map(mode, l, r, opts)
				opts = opts or {}
				-- opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end
			map('n', '<leader>fo', '<cmd>Leaderf file<CR>')
			map('n', '<leader>fr', '<cmd>Leaderf mru<CR>')
			map('n', '<leader>ft', '<cmd>Leaderf bufTag<CR>')
			map('n', '<leader>d/', '<cmd>LeaderfRgInteractive<CR>')
		end
	})

	if vim.g.is_linux then
		use({ 'ojroques/vim-oscyank', cmd = { 'OSCYank', 'OSCYankReg' }})
	end
	use({
		'p00f/nvim-ts-rainbow',
		event = 'VimEnter',
		after = { 'nvim-treesitter' },
		requires = { 'nvim-treesitter' },
	})
	use({
		'romgrk/nvim-treesitter-context',
		event = 'CursorHold',
		requires = { 'nvim-treesitter' },
		config = function()
			require('treesitter-context').setup({
				enable    = true,
				throttle  = true,
				-- separator = '─',
			})
		end
	})
	use ({
		'lewis6991/spellsitter.nvim',
		opt = true,
		ft  = { 'text' },
		-- event = 'CursorHold',
		config = function()
			require('spellsitter').setup()
		end
	})
	use ({
		'lewis6991/spaceless.nvim',
		event = 'InsertEnter',
		config = function()
			require('spaceless').setup()
		end
	})
	use({
		'RRethy/nvim-treesitter-endwise',
		event = 'InsertEnter',
		after = { 'nvim-treesitter' },
	})
	use({
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		module = { 'nvim-autopairs.completion.cmp', 'nvim-autopairs' },
		config = function()
			require('nvim-autopairs').setup({
				disable_filetype          = { 'TelescopePrompt', 'vim' },
				ignored_next_char         = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
				enable_moveright          = true,
				enable_afterquote         = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, --- check bracket in same line
				check_ts                  = true,
				map_bs                    = true,
				map_c_w                   = true,
				map_c_h                   = true,
				map_cr                    = true,

				fast_wrap = {
					map            = '<A-e>',
					chars          = { '{', '[', '(', '"', "'" },
					pattern        = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
					end_key        = '$',
					keys           = 'qwertyuiopzxcvbnmasdfghjkl',
					check_comma    = true,
					highlight      = 'Search',
					highlight_grey = 'Comment',
				},
			})
			require('nvim-autopairs').add_rules(require 'nvim-autopairs.rules.endwise-lua')

			local npairs = require'nvim-autopairs'
			local cond   = require('nvim-autopairs.conds')
			local Rule   = require'nvim-autopairs.rule'

			npairs.add_rules({
				-- add margin after cursor on space
				-- Before: (|)
				-- After: ( | )
				Rule(' ', ' ')
				:with_pair(function(opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({ '()', '{}', '[]' }, pair)
				end)
				:with_move(cond.none())
				:with_cr(cond.none())
				:with_del(function(opts)
					local col = vim.api.nvim_win_get_cursor(0)[2]
					local context = opts.line:sub(col - 1, col + 2)
					return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
				end),
				Rule('', ' )')
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == ')'
				end)
				:with_cr(cond.none())
				:with_del(cond.none())
				:use_key(')'),
				Rule('', ' }')
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == '}'
				end)
				:with_cr(cond.none())
				:with_del(cond.none())
				:use_key('}'),
				Rule('', ' ]')
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == ']'
				end)
				:with_cr(cond.none())
				:with_del(cond.none())
				:use_key(']'),

				-- Add curly braces on arrow on javascript
				Rule(
				'%(.*%)%s*%=>$',
				' {}',
				{ 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' }
				):use_regex(true):set_end_pair_length(1),

				-- Auto add space on =
				Rule('=', '')
				:with_pair(cond.not_inside_quote())
				:with_pair(function(opts)
					if vim.o.filetype == 'rust' then
						return false
					end

					local last_char = opts.line:sub(opts.col - 1, opts.col - 1)

					if last_char:match('[%w%=%s]') then
						return true
					end
					return false
				end)
				:replace_endpair(function(opts)
					local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
					local next_char = opts.line:sub(opts.col, opts.col)
					next_char = next_char == ' ' and '' or ' '
					if prev_2char:match('%w$') then
						return '<bs> =' .. next_char
					end
					if prev_2char:match('%=$') then
						return next_char
					end
					if prev_2char:match('=') then
						return '<bs><bs>=' .. next_char
					end
					return ''
				end)
				:set_end_pair_length(0)
				:with_move(cond.none())
				:with_del(cond.none()),
			})
		end
	})
	use ({
		'windwp/nvim-ts-autotag',
		disable = true,
		ft = { 'html', 'javascript', 'xml', 'markdown' },
		wants  = 'treesitter',
		-- event  = 'InsertEnter',
		config = function()
			require('nvim-ts-autotag').setup()
		end,
	})
	use ({
		'goolord/alpha-nvim',
		disable  = false,
		event    = 'VimEnter',
		after = { 'nvim-web-devicons' },
		config   = function ()
			-- require'alpha'.setup(require'alpha.themes.startify'.config)
			local alpha    = require'alpha'
			local startify = require'alpha.themes.startify'
			startify.section.header.val = {
				[[                                   __                ]],
				[[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
				[[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
				[[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
				[[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
				[[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			}
			startify.section.top_buttons.val = {
				startify.button( 'e', '  New file' , '<cmd>ene <BAR> startinsert <CR>'),
			}
			startify.nvim_web_devicons.enabled = true
			startify.section.bottom_buttons.val = {
				startify.button( 'q', '  Quit this Screen' , '<cmd>bdelete<CR>'),
				startify.button( 'X', '  Quit NV!M' , '<cmd>qall<CR>'),
			}
			startify.section.footer = {
				{ type = 'text', val = 'footer' },
			}
			startify.mru_opts.ignore = function(path, _)
				return
				(string.find(path, 'COMMIT_EDITMSG'))
			end
			alpha.setup(startify.config)
		end
	})
	use({
		'folke/noice.nvim',
		disable = false,
		after = { 'nvim-lspconfig', 'nvim-treesitter' },
		event = { 'VimEnter', 'CmdlineEnter' },
		module = 'noice',
		requires = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
    },
		config = function()
			require('plugins.noice').setup()
		end,
	})
	-- The missing auto-completion for cmdline!
	use({
		'gelguy/wilder.nvim',
		disable = true,
		event = 'CmdlineEnter',
		run = '<cmd>UpdateRemotePlugins<cr>',
		requires = {
			{ 'romgrk/fzy-lua-native', event = 'CmdlineEnter' },
			'kyazdani42/nvim-web-devicons'
		},
		config = function()
			require('plugins.wilder')
		end
	})
	use({ 'anuvyklack/hydra.nvim',
		event = 'VimEnter',
		requires = { 'anuvyklack/keymap-layer.nvim' },
		after = 'gitsigns.nvim',
		config = function()
			require('plugins.hydra')
		end
	})
	use({
		'junegunn/vim-easy-align',
		disable = false,
		keys = { 'ga' },
		cmd = { 'EasyAlign', 'LiveEasyAlign' },
		config = function ()
			local function map(mode, l, r, opts)
				opts = opts or {}
				vim.keymap.set(mode, l, r, opts)
			end
			map({ 'n', 'x' }, 'ga', '<Plug>(EasyAlign)', { desc = 'Easy Align' })
		end
		-- event = { 'CursorHold' }
	})
	use ({
		'danymat/neogen',
		disable = false,
		event = 'VimEnter',
		config = function()
			require('neogen').setup {}
		end,
		requires = 'nvim-treesitter/nvim-treesitter',
	})
	use({
		'tpope/vim-surround',
		disable = true,
	})
	use({
		'kylechui/nvim-surround',
		disable = false,
		-- event = 'InsertEnter',
		keys = {{'n', 'ys'}, {'n', 'ds'}, {'n', 'cs'}, {'x', 'S'}},
		config = function ()
			require('nvim-surround').setup({
				highlight = {
					duration = 300,
			}
		})
	end
	})
	use({ 'ojroques/vim-oscyank', cmd   = { 'OSCYank' , 'OSCYankReg' }})
	use({
		'antoyo/vim-licenses',
		cmd = { 'Gplv2', 'Apache', 'Mit' },
		config = function ()
			vim.g.licenses_copyright_holders_name = 'Ratheesh <ratheeshreddy@gmail.com>'
			vim.g.licenses_authors_name           = 'Ratheesh S'
			vim.g.licenses_default_commands       = { 'Gplv2', 'Apache', 'Mit' }
		end
	})
	use({ 'andymass/vim-matchup', keys = { '%' }, event = { 'CursorHold' }})
	use ({
		'metakirby5/codi.vim',
		ft  = { 'python' },
		cmd = { 'Codi' },
		config = function ()
		end
	})
	use({
		'hood/popui.nvim',
		disable = false,
		config = function()
			vim.ui.select = require('popui.ui-overrider')
			vim.ui.input = require('popui.input-overrider')
		end
	})
	use({
		'jpalardy/vim-slime',
		-- event = 'VimEnter',
		ft = { 'python' },
		config = function ()
			vim.g.slime_target = 'tmux'
			vim.g.slime_default_config = { socket_name = 'default', target_pane = '{last}' }
			vim.cmd([[ let g:slime_default_config = { 'socket_name': get(split($TMUX, ','), 0), 'target_pane': '{top-right}' } ]])
			vim.g.slime_bracketed_paste = 0
		end
	})
	use({
		'hanschen/vim-ipython-cell',
		-- event = 'VimEnter',
		ft = { 'python' },
		requires = 'vim-slime',
		config = function()
		end
	})
	use({
		'bootleq/vim-cycle',
		disable = false,
		-- event = 'VimEnter',
		keys = { '+', '-' },
		config = function()
			require('plugins.vim-cycle')
		end
	})
	use({
		'dhruvasagar/vim-table-mode',
		cmd = { 'TableModeToggle' , 'TableModeEnable', 'TableModeDisable', 'TableModeRealign' },
		config = function ()
			vim.g.table_mode_corner_corner   = '+'
			vim.g.table_mode_header_fillchar = '='
			vim.b.table_mode_corner          = '+'
		end
	})
	use({
		'lewis6991/satellite.nvim',
		event = 'VimEnter',
		after = { 'nvim-lspconfig' },
		config=function ()
			require('satellite').setup()
		end
	})
	use({
	'uga-rosa/ccc.nvim',
		disable = false,
		opt = true,
		cmd = { 'CccPick' },
		config = function ()
			-- require('ccc').setup({
			-- 	vim.cmd([[CccHighlighterEnable]])
			-- })
		end
	})
	use({
		'majutsushi/tagbar',
		disable = true,
		opt = true,
		cmd = { 'TagbarToggle', 'Tagbar' },
		keys = { '<f4>' },
		config = function ()
			vim.g.tagbar_sort             = 0;
			vim.g.tagbar_indent           = 1;
			vim.g.tagbar_expand           = 0;
			vim.g.tagbar_show_linenumbers = 0;
			vim.g.tagbar_autoshowtag      = 1;
		end
	})
	use({
		'simrat39/symbols-outline.nvim',
		disable = false,
		config = function()
			require('symbols-outline').setup()
		end
	})
	use({
		'b0o/incline.nvim',
		opt = true,
		event = 'WinNew',
		-- after = 'nvim-web-devicons',
		config = function ()
			require('incline').setup({
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
					local icon, icon_color = require('nvim-web-devicons').get_icon_color(filename)
					return {
						{ icon, guifg = icon_color },
						{ ' ' },
						{ filename,  guifg = '#B6919E', guibg = nil, gui = 'italic' },
					}
				end,
				window = {
					zindex = 60,
					width  = 'fit',
					placement = { horizontal = 'right', vertical = 'top' },
					margin = {
						horizontal = { left = 1, right = 1 },
						vertical   = { bottom = 0, top = 1 },
					},
					padding      = { left = 1, right = 1 },
					padding_char = ' ',
					winhighlight = {
						Normal = 'TreesitterContext',
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
					only_win    = true
				},
			})
		end
	})
	use ({ 'AndrewRadev/inline_edit.vim' })
	use({'jghauser/mkdir.nvim', event = 'VimEnter'})
	use({'Glench/Vim-Jinja2-Syntax', event = 'VimEnter'})
	-- use({'lepture/vim-jinja', event = 'VimEnter'})

	use({
		'mattn/emmet-vim',
		ft = { 'html', 'css', 'scss', 'xml' },
	})

	-- use({'ratheesh/hiPairs', event = 'VimEnter'})
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
		prompt_border   = 'rounded',
		non_interactive = false,
		open_fn = function() return require('packer.util').float({ border = 'rounded' }) end
	},
},
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
	vim.notify('Error requiring packer_compiled.lua: run PackerSync to fix!')
end

-- Avoid notification of few annoying repeatitive messages
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match('Reason: breakpoint') or msg:match('Reason: step') then
		return
	end

	notify(msg, ...)
end

-- End of File
