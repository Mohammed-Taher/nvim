local M = {}

function M.setup()
	require("color-picker").setup({
		["icons"] = { "ﱢ", "" },
		["border"] = "rounded",
		["keymap"] = { -- mapping example:
			["U"] = "<Plug>ColorPickerSlider5Decrease",
			["O"] = "<Plug>ColorPickerSlider5Increase",
		},
	})

	vim.cmd([[hi FloatBorder guibg=NONE]])
end

return M
