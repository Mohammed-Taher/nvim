local M = {}

function M.setup()
	require("colorizer").setup({
		"javascript",
		"css",
		"html",
		"svelte",
		"vue",
		"lua",
	})
end

return M
