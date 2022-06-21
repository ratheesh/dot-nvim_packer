-- Boot strapping packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('basic_settings')
require('plugins')
require('keybindings')
require('colors')
require('autocmds')

_G.P = vim.pretty_print

function _G.TroubleQuickFixPost(mode)
	require("trouble.providers").get(vim.api.nvim_get_current_win(),
	vim.api.nvim_get_current_buf(), function(items)
		if #items > 0 then require("trouble").open({ mode = mode }) end
	end, { mode = mode })
end

function _G.vimgrepprompt()
	local pattern = fn.input("vimgrep pattern: ")
	if pattern and pattern ~= "" then
		local ok = vim.F.npcall(vim.cmd, "vimgrep /"..pattern.."/j %")
		vim.schedule(function() print(ok and " " or "No results") end)
	end
end

-- vim.schedule(function()
-- 	local home = os.getenv("HOME")
-- 	local shada = home.."/.local/state/nvim/shada/main.shada"
-- 	vim.opt.shadafile = shada
-- 	if vim.loop.fs_stat(shada) then
-- 		vim.cmd("rshada")
-- 	end
-- 	local shortcuts = home..".config/nvim/shortcuts.vim"
-- 	if vim.loop.fs_stat(shortcuts) then
-- 		vim.cmd("source "..shortcuts)
-- 	end
-- end)
-- End of File
