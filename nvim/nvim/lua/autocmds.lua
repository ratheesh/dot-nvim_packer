-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Autocommands

local group = vim.api.nvim_create_augroup("AutoCommands", { clear = true })
vim.api.nvim_create_autocmd("Filetype", { pattern = "sh", group = group,
	command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4" })
vim.api.nvim_create_autocmd("FocusLost,InsertLeave,CursorHold", { group = group,
	command = "silent! update" })
vim.api.nvim_create_autocmd("QuickFixCmdPost", { pattern = "[^l]*", group = group,
	callback = function() TroubleQuickFixPost("quickfix") end })
vim.api.nvim_create_autocmd("QuickFixCmdPost", { pattern = "l*", group = group,
	callback = function() TroubleQuickFixPost("loclist") end })
vim.api.nvim_create_autocmd("TextYankPost", { group = group,
	callback = function() vim.highlight.on_yank({ higroup="IncSearch", timeout=300 }) end })

-- set the colorcolumn to 72 for gitcommit filetype
local colorcolGrp = vim.api.nvim_create_augroup("colorcolGrp", { clear = true })
vim.api.nvim_create_autocmd("Filetype", { pattern = "gitcommit", group = colorcolGrp, command = "setlocal colorcolumn=72" })


local cursorGrp = vim.api.nvim_create_augroup("cursorGrp", { clear = true })
vim.api.nvim_create_autocmd( "InsertLeave" , { group = cursorGrp, command = "hi CursorLineNr guifg=#f0f0f0 guibg=#b16286" })
vim.api.nvim_create_autocmd( "InsertEnter" , { group = cursorGrp, command = "hi CursorLineNr guifg=#f0f0f0 guibg=#2AA198" })

-- vim.api.nvim_create_autocmd(
--   { "InsertLeave", "WinEnter" },
--   { pattern = "*", command = "set relativenumber", group = cursorGrp })
--
-- vim.api.nvim_create_autocmd(
--   { "InsertEnter", "WinLeave" },
--   { pattern = "*", command = "set norelativenumber", group = cursorGrp })

-- Utility functions
_G.P = vim.pretty_print

function _G.TroubleQuickFixPost(mode)
	require("trouble.providers").get(vim.api.nvim_get_current_win(),
	vim.api.nvim_get_current_buf(), function(items)
		if #items > 0 then require("trouble").open({ mode = mode }) end
	end, { mode = mode })
end

-- End of File
