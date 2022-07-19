-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Keybindings

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then options = vim.tbl_extend("force", options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Esc>", "<cmd>noh<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<Cmd>e #<CR>")
map("n", "gV", "`[v`]")

map("n" , "<Leader>w"       , "<cmd>w<CR>")
map("n" , "<Leader>x"       , "<cmd>q<CR>")
map("n" , "<Leader>;"       , ":")
map("x" , "<Leader>;"       , ":")
map("n" , "<BS>"            , "<cmd>nohlsearch<CR>")
map("n" , "<Leader><BS>"    , "<C-V>")
map("n" , "<Leader><Space>" , "V")
map("n" , "<A-d>"           , "<cmd>bdelete<CR>")
map("n" , "<CR>"            , "<cmd>call append(line('.')   , '')<CR>")
map("n" , "<S-CR>"          , "<cmd>call append(line('.')-1 , '')<CR>")
map("n" , "<F2>"            , "<cmd>echo expand('%:p')<CR>")

map("n" , "<A-x>"  , "<C-x>")
map("n" , "<A-a>"  , "<C-a>")
map("n" , "<S-t"   , "<cmd>enew<CR>")
map("n" , "<C-t>b" , "<cmd>tabnew<CR>")

map("n", "J", "mzJ`z")
map("n", "k", "(v:count > 5 ? (\"m'\" . v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"k\"",
	{ expr = true })
map("n", "j", "(v:count > 5 ? (\"m'\" .v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"j\"",
	{ expr = true })
map("n" , "<leader>k" , ":m .-2<CR>==")
map("n" , "<leader>j" , ":m .+1<CR>==")
map("v" , "K"         , ":m '<-2<CR>gv=gv")
map("v" , "J"         , ":m '>+1<CR>gv=gv")
map("i" , "<C-k>"     , "<Esc>:m .-2<CR>==")
map("i" , "<C-j>"     , "<Esc>:m .+1<CR>==")
-- map("i" , "           , " , " , <C-g>u")
map("i" , "."         , ".<C-g>u")
map("i" , "!"         , "!<C-g>u")
map("i" , "?"         , "?<C-g>u")

map("n", "<leader>fo", "<cmd>Leaderf file<CR>")
map("n", "<leader>fr", "<cmd>Leaderf mru<CR>")
map("n", "<leader>ft", "<cmd>Leaderf bufTag<CR>")
map("n", "<leader>d/", "<cmd>LeaderfRgInteractive<CR>")

-- map("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
-- map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>")
-- map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<CR>")
-- map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
-- map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>")
-- map("n", "<leader>xg", "<cmd>lua vimgrepprompt()<CR>")
map("n", "gR", "<cmd>TroubleToggle lsp_references<CR>")
map("n", "<C-A-j>", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>")
map("n", "<C-A-k>", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>")

map("n", "ga", "<Plug>(EasyAlign)")
map("x", "ga", "<Plug>(EasyAlign)")

map('o', 'ih', '<cmd>Gitsigns select_hunk<CR>')
map('x', 'ih', '<cmd>Gitsigns select_hunk<CR>')

-- map('n', '<leader>H', '<cmd>Startify<CR>')
map('n', '<leader>H', '<cmd>Alpha<CR>')

map("s", "<C-l>" ,"<cmd>lua require('luasnip').jump(1)<CR>")
map("s", "<C-h>" ,"<cmd>lua require('luasnip').jump(-1)<CR>")
map("i", "<C-l>" ,"<cmd>lua require('luasnip').jump(1)<CR>")
map("i", "<C-h>" ,"<cmd>lua require('luasnip').jump(-1)<CR>")

map("x", "<leader>s" ,"<Plug>(sqls-execute-query)")
map("n", "<leader>s" ,"<Plug>(sqls-execute-query)")

-- gitsigns
vim.api.nvim_create_user_command("Stage", function(t) require('gitsigns').stage_hunk({ t.line1, t.line2 }) end, { range = true })
vim.api.nvim_create_user_command("Reset", function(t) require('gitsigns').reset_hunk({ t.line1, t.line2 }) end, { range = true })

vim.api.nvim_create_autocmd('User', {
	pattern = 'SqlsConnectionChoice',
	callback = function(event)
		vim.notify(event.data.choice)
	end,
})
-- End of File
