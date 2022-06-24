-- keybindings.lua

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

map("n", "<Leader>w", "<cmd>w<CR>")
map("n", "<Leader>x", "<cmd>q<CR>")
map("n", "<Leader>;", ":")
map("n", "<BS>", "<cmd>nohlsearch<CR>")
map("n", "<Leader><BS>", "<C-V>")
map("n", "<Leader><Space>", "V")
map("n", "<A-d>", "<cmd>bdelete<CR>")
map("n", "<CR>", "<cmd>call append(line('.'), '')<CR>")
map("n", "<S-CR>", "<cmd>call append(line('.')-1, '')<CR>")
map("n", "<F4>", "<cmd>echo expand('%:p')<CR>")

map("n", "<A-x>", "<C-x>")
map("n", "<A-a>", "<C-a>")
map("n", "<S-t", "<cmd>enew<CR>")
map("n", "<C-t>b", "<cmd>tabnew<CR>")
map("n", "<Leader>l", "<cmd>BufferLineCycleNext<CR>")
map("n", "<Leader>h", "<cmd>BufferLineCyclePrev<CR>")

map("n", "J", "mzJ`z")
map("n", "k", "(v:count > 5 ? (\"m'\" . v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"k\"",
	{ expr = true })
map("n", "j", "(v:count > 5 ? (\"m'\" .v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"j\"",
	{ expr = true })
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("i", "<C-k>", "<Esc>:m .-2<CR>==")
map("i", "<C-j>", "<Esc>:m .+1<CR>==")
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")

map("n", "<leader>fo", "<cmd>Leaderf file<CR>")
map("n", "<leader>fr", "<cmd>Leaderf mru<CR>")
map("n", "<leader>ft", "<cmd>Leaderf bufTag<CR>")
map("n", "<leader>d/", "<cmd>Leaderf LeaderfRgInteractive<CR>")

-- map("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
-- map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>")
-- map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<CR>")
-- map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
-- map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>")
-- map("n", "<leader>xg", "<cmd>lua vimgrepprompt()<CR>")
map("n", "gR", "<cmd>TroubleToggle lsp_references<CR>")
map("n", "<C-A-j>", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>")
map("n", "<C-A-k>", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>")

-- bufferline
map("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
map("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
map("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
map("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
map("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
map("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
map("n", "<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
map("n", "<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
map("n", "<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")

-- End of File
