-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Basic Settings

-- vim.opt.shadafile = "NONE"
vim.opt.shada          = "%,<300,'100,/10,:100,s100,h,f1,n$HOME/.config/nvim/shada.info"
vim.opt.wrap           = false
vim.opt.list           = true
vim.opt.listchars      = { tab = "  ", extends = "", precedes = "" }
vim.opt.scrolloff      = 5
-- vim.opt.whichwrap   = "<,>,\[,\]"
vim.opt.title          = true
vim.opt.clipboard      = "unnamedplus"
vim.opt.cmdheight      = 1
vim.opt.smartindent    = true
vim.opt.tabstop        = 2
vim.opt.signcolumn     = "yes"
vim.opt.shiftwidth     = 2
vim.opt.shortmess:append("sI")
vim.opt.smartcase      = true
vim.opt.ignorecase     = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.colorcolumn    = "80"
vim.opt.cursorline     = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.termguicolors  = true
vim.opt.timeoutlen     = 750
vim.opt.undofile       = true
vim.opt.updatetime     = 250
vim.opt.shell          = "/bin/zsh"
vim.opt.lazyredraw     = true
vim.opt.mouse          = "a"
vim.opt.pumheight      = 12
vim.opt.completeopt    = "menu,menuone,noselect"
vim.opt.showmode       = false
vim.opt.confirm        = true
vim.opt.laststatus     = 3
vim.opt.guicursor      = "n:block-nCursor-blinkon0,i-ci:ver20-iCursor-blinkon0,v-ve:block-vCursor-blinkon0,o:hor30-oCursor-blinkon0,r-cr:block-rCursor-blinkon0"

vim.g.mapleader                = " "
vim.g.maplocalleader           = ","

-- Disable unwanted in-built plugins
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1

-- _G.colors = {
-- 	red = "#BF616A", teal = "#97B7D7", one_bg = "#373D49", lightbg = "#3B4252", blue = "#81A1C1",
-- 	cyan = "#5E81AC", black = "#2E3440", orange = "#D08770", one_bg2 = "#434C5E", foreground = "#E5E9F0",
-- 	grey = "#4B515D", green = "#A3BE8C", purple = "#8FBCBB", one_bg3 = "#4C566A", light_grey = "#646A76",
-- 	line = "#3A404C", white = "#D8DEE9", yellow = "#EBCB8B", lightbg2 = "#393F4B", dark_purple = "#B48EAD",
-- 	pink = "#D57780", black2 = "#343A46", grey_fg = "#606672", baby_pink = "#DE878F", darker_black = "#2A303C",
-- }

-- End of File
