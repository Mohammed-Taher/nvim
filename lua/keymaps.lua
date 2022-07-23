---@diagnostic disable: unused-local
local M = {}

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

local keymappings = function()
	-- Remap leader and local leader to ','
	vim.g.mapleader = ","
	vim.g.maplocalleader = ","

	keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", default_opts)

	-- Center search results
	keymap("n", "n", "nzz", default_opts)
	keymap("n", "N", "Nzz", default_opts)

	-- Paste over currently selected text without yanking it
	keymap("v", "p", '"_dP', default_opts)

	-- Switch buffer
	keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
	keymap("n", "<S-l>", ":bnext<CR>", default_opts)

	-- Cancel search highlighting with ESC
	keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

	-- Move selected line / block of text in visual mode
	keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
	keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

	-- Resizing panes
	keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
	keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
	keymap("n", "<Up>", ":resize -1<CR>", default_opts)
	keymap("n", "<Down>", ":resize +1<CR>", default_opts)

	-- Telescope
	keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", default_opts)

	-- Navigation
	keymap("n", "<C-d>", "5j", default_opts)
	keymap("n", "<C-u>", "5k", default_opts)

	--Open Configuration Files
	keymap("n", "<Leader>ep", "<cmd>e $HOME/.config/nvim/lua/plugins.lua<CR>", default_opts)
	keymap("n", "<Leader>em", "<cmd>e $HOME/.config/nvim/lua/keymaps.lua<CR>", default_opts)
	keymap("n", "<Leader>ev", "<cmd>e $MYVIMRC<CR>", default_opts)

	-- Better Window Movement
	keymap("n", "<C-h>", "<C-w>h", default_opts)
	keymap("n", "<C-j>", "<C-w>j", default_opts)
	keymap("n", "<C-k>", "<C-w>k", default_opts)
	keymap("n", "<C-l>", "<C-w>l", default_opts)
end

local terminal_keymappings = function()
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], default_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], default_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], default_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], default_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], default_opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], default_opts)
end

function M.setup(client, bufnr)
	keymappings()
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "term://*",
		callback = terminal_keymappings,
	})
end

return M
