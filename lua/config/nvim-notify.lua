local M = {}

function M.setup()
	require("notify").setup({
		timeout = 1500,
	})
	vim.notify = require("notify")
end

return M
