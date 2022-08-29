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
		ls.builtins.formatting.prettier.with({
			filetypes = { 'html', 'css', 'yaml', 'markdown', 'json' },
		}),
		-- ls.builtins.formatting.stylua,

		-- diagnostics
		with_diagnostics_code(ls.builtins.diagnostics.shellcheck),
		ls.builtins.diagnostics.flake8,
		-- ls.builtins.diagnostics.mypy,
		ls.builtins.diagnostics.gitlint.with {
      extra_args = { '--contrib=contrib-title-conventional-commits', '--ignore=body-is-missing' },
    },
		-- ls.builtins.diagnostics.vale.with({ args = '--config="$XDG_CONFIG_HOME/vale/vale.ini"' }),

		-- completion
		ls.builtins.completion.spell,

		-- hover
		ls.builtins.hover.dictionary,

		-- code actions
		ls.builtins.code_actions.refactoring,
		ls.builtins.code_actions.gitsigns,
		ls.builtins.code_actions.gitrebase,
	}

	ls.setup({
		debug             = true,
		debounce          = 50,
		save_after_format = false,
		sources           = sources,
		root_dir          = nls_utils.root_pattern ".git",
		-- filetypes         = { 'python', 'lua', 'gitcommit', 'c', 'cpp', 'html',  },

		on_init = function(new_client, _)
			new_client.offset_encoding = 'utf-32'
		end,

		on_attach = function(client, bufnr)
			if client.supports_method 'textDocument/formatting' then
				vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = augroup,
					buffer = bufnr,
					callback = function()
						if vim.bo.filetype == 'python' or vim.bo.filetype == 'html' then
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
