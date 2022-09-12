-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- LSP Configuration

-- local navic    = require("nvim-navic")

local M = {}

function M.setup()
	vim.fn.sign_define("DiagnosticSignError" , { text = "" , texthl = "DiagnosticError" })
	vim.fn.sign_define("DiagnosticSignHint"  , { text = "" , texthl = "DiagnosticHint"  })
	vim.fn.sign_define("DiagnosticSignInfo"  , { text = "" , texthl = "DiagnosticInfo"  })
	vim.fn.sign_define("DiagnosticSignWarn"  , { text = "" , texthl = "DiagnosticWarn"  })

	vim.lsp.handlers["textDocument/hover"]         = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
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
				title           = "New Name",
				style           = "minimal",
				borderchars     = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				relative        = "cursor",
				borderhighlight = "FloatBorder",
				titlehighlight  = "Title",
				highlight       = tshl,
				focusable       = true,
				width           = 25,
				height          = 1,
				line            = "cursor+2",
				col             = "cursor-1"
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
	vim.diagnostic.config({ virtual_text = false, float = { show_header = false, border = "rounded" }})

	local function on_init(client, _) client.offset_encoding = "utf-32" end

	local function on_attach(client, bufnr)
		local function bufmap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

		local opts = { noremap = true, silent = true }
		bufmap("n" , "gD"         , "<cmd>lua vim.lsp.buf.declaration()<CR>"       , opts)
		bufmap("n" , "gd"         , "<cmd>lua vim.lsp.buf.definition()<CR>"        , opts)
		bufmap("n" , "K"          , "<cmd>lua vim.lsp.buf.hover()<CR>"             , opts)
		-- bufmap("n" , "<leader>gi"         , "<cmd>lua vim.lsp.buf.implementation()<CR>"    , opts)
		-- bufmap("n" , "gk"         , "<cmd>lua vim.lsp.buf.signature_help()<CR>"    , opts)
		-- bufmap("n" , "<leader>D"  , "<cmd>lua vim.lsp.buf.type_definition()<CR>"   , opts)
		bufmap("n" , "<leader>rn" , "<cmd>lua vim.lsp.buf.rename.float()<CR>"      , opts)
		bufmap("n" , "<leader>ca" , "<cmd>lua vim.lsp.buf.code_action()<CR>"       , opts)
		bufmap("v" , "<leader>ca" , "<cmd>lua vim.lsp.buf.range_code_action()<CR>" , opts)
		bufmap("n" , "gr"         , "<cmd>lua vim.lsp.buf.references()<CR>"        , opts)
		bufmap("n" , "<leader>e"  , "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>" , opts)
		bufmap("n" , "gx"         , "<cmd>lua vim.diagnostic.goto_prev()<CR>"      , opts)
		bufmap("n" , "gz"         , "<cmd>lua vim.diagnostic.goto_next()<CR>"      , opts)
		bufmap("n" , "<leader>q"  , "<cmd>lua vim.diagnostic.setloclist()<CR>"     , opts)
		-- bufmap("n" , "<leader>f"  , "<cmd>lua vim.lsp.buf.formatting()<CR>"        , opts)
		-- bufmap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		-- bufmap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		-- bufmap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

		-- require("illuminate").on_attach(client)
		-- require("virtualtypes").on_attach(client)

		if client.name == 'sqls' then
        require('sqls').on_attach(client, bufnr)
    end

		-- require('inlay-hints').on_attach(client, bufnr)

		if client.server_capabilities.colorProvider then
			require("document-color").buf_attach(bufnr)
		end

		--[[ if client.name ~= 'pyright' or client.name ~= "sqls" then
			navic.attach(client, bufnr)
		end ]]

	end

	local lspconfig = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	-- capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = { "documentation", "detail", "additionalTextEdits" },
	}
	capabilities.textDocument.colorProvider = { dynamicRegistration = true }
	-- capabilities.offsetEncoding = "utf-32"

		if capabilities.semanticTokensProvider and capabilities.semanticTokensProvider.full then
			vim.cmd [[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.buf.semantic_tokens_full()]]
		end

	lspconfig.vimls.setup({ on_init = on_init, on_attach = on_attach, capabilities = capabilities })
	lspconfig.bashls.setup({ on_init = on_init, on_attach = on_attach, capabilities = capabilities })

	lspconfig.jdtls.setup({
		on_init      = on_init,
		on_attach    = on_attach,
		capabilities = capabilities,
		settings = {
			java = {
				eclipse = {
					downloadSources = true,
				},
				configuration = {
					updateBuildConfiguration = "interactive",
				},
				maven = {
					downloadSources = true,
				},
				implementationsCodeLens = {
					enabled = true,
				},
				referencesCodeLens = {
					enabled = true,
				},
				references = {
					includeDecompiledSources = true,
				},
				format = {
					enabled = true,
					settings = {
						url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
						profile = "GoogleStyle",
					},
				},
			},
			signatureHelp = { enabled = true },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			contentProvider = { preferred = "fernflower" },
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
			},
		},
		flags = {
			allow_incremental_sync = true,
		},
	})

	-- C/Cpp
	lspconfig.clangd.setup({
		on_init      = on_init,
		on_attach    = on_attach,
		capabilities = capabilities,
		cmd = { '/bin/clangd', '--background-index', '--header-insertion=iwyu',
			'--completion-style=detailed', '--pch-storage=memory', '--clang-tidy',
			'--header-insertion-decorators', '--all-scopes-completion',
			'--offset-encoding=utf-32' },
		flags = {
			debounce_text_changes = 150,
		};
		init_options = {
			clangdFileStatus     = true,
			usePlaceholders      = true,
			completeUnimported   = true,
			semanticHighlighting = true,
		};
	})

	--[[ lspconfig.ccls.setup({
		on_init = on_init,
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
				detailedLabel = true;
				spellChecking = true;
				-- filterAndSort = false;
			};
			index = {
				onChange        = false,
				trackDependency = 1
			},
		},
	}) ]]

	-- Python
	lspconfig.jedi_language_server.setup({ on_init = on_init, on_attach = on_attach, capabilities = capabilities })
	--[[ lspconfig.pylsp.setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = {'W391'},
						maxLineLength = 100
					},
					jedi_completion = {
						enabled = true,
						fuzzy   = true,
						eager   = true,
					}
				}
			}
		}
	}) ]]

	lspconfig.pyright.setup({
		on_init = on_init,
		on_attach    = on_attach,
		capabilities = capabilities,
		settings = {
			pyright = {
				disableLanguageServices = true,
			},
		},
	})

	--html
	lspconfig.html.setup({
		on_init      = on_init,
		on_attach    = on_attach,
		capabilities = capabilities,
		settings = {
			html = {
				format = {
					templating     = true,
					wrapLineLength = 120,
					wrapAttributes = 'auto',
				},
				hover = {
					documentation = true,
					references    = true,
				},
			},
		},
	})

	-- css
	lspconfig.cssls.setup({
		on_init      = on_init,
		on_attach    = on_attach,
		capabilities = capabilities,
	})
	--[[ lspconfig.tailwindcss.setup({
		on_init      = on_init,
		on_attach    = on_attach,
		capabilities = capabilities,
	}) ]]

	-- Lua
	lspconfig.sumneko_lua.setup(require("lua-dev").setup({
		lspconfig = {
			on_init      = on_init,
			on_attach    = on_attach,
			capabilities = capabilities,
			cmd = { "lua-language-server" },
			settings = {
				Lua = {
					hint = {
						enable = true,
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							[vim.fn.expand('$VIMRUNTIME/lua')] = true,
							[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
						},
					},
					telemetry = { enable = false },
					diagnostics = {
						globals = { 'vim' },
						disable = {
							"missing-parameter",
							"cast-local-type",
							"param-type-mismatch",
							"assign-type-mismatch",
							"undefined-field",
							"redundant-parameter"
						}
					}
				}
			}
		}
	}))

	lspconfig.sqls.setup({ on_init = on_init, on_attach = on_attach, capabilities = capabilities })
	-- lspconfig.texlab.setup({ on_attach = on_attach, capabilities = capabilities })

	local win = require("lspconfig.ui.windows")
	local _default_opts = win.default_opts
	win.default_opts = function(options)
		local opts = _default_opts(options)
		opts.border = "rounded"
		return opts
	end
end

return M
-- End of File
