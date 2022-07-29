-- vim.g.tokyonight_italic_functions = true
-- vim.cmd [[colorscheme tokyonight]]
vim.opt.laststatus = 3
vim.opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})
require("kanagawa").setup({ globalStatus = true, ... })
vim.cmd([[colorscheme kanagawa]])
