local M = {}

function M.setup()
	require("material").setup({
		italics = {
			comments = true,
			keywords = true,
		},
		lualine_style = "stealth",
		contrast = {
			line_numbers = true,
		},
	})
end

return M
