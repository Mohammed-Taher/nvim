local M = {}

function M.setup()
	require("material").setup({
		italics = {
			comments = true,
		},
		lualine_style = "stealth",
	})
end

return M
