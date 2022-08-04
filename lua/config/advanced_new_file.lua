local M = {}

function M.setup()
	require("advanced_new_file").run({
		show_cwd = true,
		goto_file = false,
		notify = false,
		prompt = "Enter File Name:",
	})
end

return M
