local M = {}

function M.setup()
	require("lua-dev").setup({
		library = { plugins = { "neotest" }, types = true },
	})
end

return M
