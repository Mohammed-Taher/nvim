local M = {}

function M.setup()
	require 'bufferline'.setup{
		options = {
			tab_size = 25,
			diagnostics = 'nvim-lsp',
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " "
					or (e == "warning" and " " or "" )
					s = s .. n .. sym
				end
				return s
			end,
			color_icons = true,
			separator_style = 'slant',
			offsets = {
				filetype = "NvimTree",
				text = "File Explorer",
				text_align ="center"
			},
		}

	}
end

return M
