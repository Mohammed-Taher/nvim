local M = {}

function M.setup()
	require("neotest").setup({
		adapters = {
			require("neotest-phpunit"),
		},
		icons = {
			failed = " ",
			passed = " ",
			running = " ",
			skipped = " ",
			unknown = " ",
		},
	})
end

return M
