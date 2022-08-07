-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- NeoViM Config entry point

-- Boot strapping packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- require('global')
require('plugins')
require('colors')

vim.defer_fn(function()
	require('keybindings')
	require('autocmds')
	vim.cmd([[
	PackerLoad incline.nvim
	]])
end, 30)

-- End of File
