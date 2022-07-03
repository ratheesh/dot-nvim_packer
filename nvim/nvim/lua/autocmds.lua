-- autocmds

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

-- End of File
