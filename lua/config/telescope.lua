local M = {}

local center_list = require"telescope.themes".get_dropdown({
	width = 0.5,
	results_height = 15,
	previewer = false,
})

function M.setup()
	local actions = require("telescope.actions")

	require("telescope").setup{
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close
				},
			},
		},
		pickers = {
			find_files = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix"}
			}
		}
	}
end


return M
