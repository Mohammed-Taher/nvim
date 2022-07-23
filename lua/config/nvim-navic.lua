local M = {}

function M.setup()
	require 'nvim-navic'.setup{
		icons = {
			Text = " ",
			Method = " ",
			Function = " ",
			Constructor = " ",
			Field = " ",
			Variable = " ",
			Class = " ",
			Interface = " ",
			Module = " ",
			Property = " ",
			Unit = " ",
			Value = " ",
			Enum = " ",
			Keyword = " ",
			Snippet = " ",
			Color = " ",
			File = " ",
			Reference = " ",
			Folder = " ",
			EnumMember = " ",
			Constant = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " "
		},
		highlight = false,
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = " ",
	}
end

return M
