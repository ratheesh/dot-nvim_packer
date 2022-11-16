-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- null-ls Configuration

local M = {}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

function M.setup()
	local ls = require('null-ls')
	local nls_utils = require('null-ls.utils')

	local with_diagnostics_code = function(builtin)
		return builtin.with {
			diagnostics_format = '#{m} [#{c}]',
		}
	end

	-- local with_root_file = function(builtin, file)
	-- 	return builtin.with {
	-- 		condition = function(utils)
	-- 			return utils.root_has_file(file)
	-- 		end,
	-- 	}
	-- end

	local sources = {
		-- formatting
		ls.builtins.formatting.shfmt,
		ls.builtins.formatting.black,
		ls.builtins.formatting.autopep8,
		ls.builtins.formatting.isort,
		ls.builtins.formatting.trim_newlines,
		ls.builtins.formatting.prettier.with({
			filetypes = { 'html', 'css', 'yaml', 'markdown', 'json', 'javascript' },
		}),
		ls.builtins.formatting.stylelint,
		-- ls.builtins.formatting.stylua,

		-- diagnostics
		-- with_diagnostics_code(ls.builtins.diagnostics.shellcheck),
		-- ls.builtins.diagnostics.djlint,
		ls.builtins.diagnostics.curlylint,
		ls.builtins.diagnostics.tidy,
		-- ls.builtins.diagnostics.shellcheck,
		ls.builtins.diagnostics.flake8,
		-- ls.builtins.diagnostics.mypy,
		ls.builtins.diagnostics.cmake_lint,
		ls.builtins.diagnostics.stylelint,
		ls.builtins.diagnostics.trail_space,
		ls.builtins.diagnostics.gitlint.with {
			extra_args = { '--contrib=contrib-title-conventional-commits', '--ignore=body-is-missing' },
		},

		ls.builtins.hover.dictionary,

		-- code actions
		ls.builtins.code_actions.refactoring,
		ls.builtins.code_actions.refactoring,
		ls.builtins.code_actions.proselint,
		ls.builtins.code_actions.eslint_d,
		ls.builtins.code_actions.gitsigns,
		ls.builtins.code_actions.gitrebase,
	}

	ls.setup({
		debug             = false,
		debounce          = 150,
		save_after_format = false,
		sources           = sources,
		root_dir          = nls_utils.root_pattern ".git",
		filetypes         = { 'python', 'lua', 'gitcommit', 'c', 'cpp', 'html',  },

		on_init = function(new_client, _)
			new_client.offset_encoding = 'utf-16'
		end,

		on_attach = function(client, bufnr)
			if client.supports_method 'textDocument/formatting' then
				vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = augroup,
					buffer = bufnr,
					callback = function()
						if vim.bo.filetype == 'python' or vim.bo.filetype == 'html' or
							vim.bo.filetype == 'css' or vim.bo.filetype == 'gitcommit' then
							vim.lsp.buf.format({bufnr = bufnr})
						end
					end,
				})
			end
		end,
	})
end

return M
-- End of File
