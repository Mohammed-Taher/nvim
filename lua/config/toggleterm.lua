local M = {}

function M.setup()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		direction = "float",
		float_opts = {
			border = "double",
		},
	})

	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	local python = Terminal:new({
		cmd = "python",
		hidden = true,
		direction = "float",
		float_opts = {
			border = "curved",
		},
	})

	function _PYTHON_TOGGLE()
		python:toggle()
	end

	local node = Terminal:new({
		cmd = "node",
		hidden = true,
		direction = "float",
		float_opts = {
			border = "curved",
		},
	})

	function _NODE_TOGGLE()
		node:toggle()
	end
end

require("toggleterm").setup({
	size = 10,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	start_in_insert = true,
	terminal_mappings = true,
	persist_size = true,
	direction = "horizontal",
	shade_terminals = true,
})

return M
