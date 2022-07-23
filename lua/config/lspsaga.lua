local M = {}

function M.setup()
	local saga = require("lspsaga")

	saga.init_lsp_saga({
		diagnostic_header = { " ", " ", " ", " " },
		show_diagnostic_source = true,
		code_action_icon = "💡",
		code_action_num_shortcut = true,
		code_action_lightbulb = {
			enable = true,
			sign = true,
			sign_priority = 20,
			virtual_text = true,
		},
		-- finder icons
		finder_icons = {
			def = "  ",
			ref = " ",
			link = "  ",
		},
		code_action_keys = {
			quit = "q",
			exec = "<CR>",
		},
	})
end

return M
