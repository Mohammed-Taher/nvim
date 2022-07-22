local M = {}

local kind_icons = {
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
}

function M.setup()
	local lsp = require('lsp-zero')
	lsp.preset('recommended')
	lsp.nvim_workspace()
	lsp.setup_nvim_cmp(
		{
			formatting = {
				format = function(entry, vim_item)
					local prsnt, lspkind = pcall(require, "lspkind")
					if not prsnt then
						-- Kind icons
						vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						-- Source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[LaTeX]",
					})[entry.source.name]
						return vim_item
					else
						return lspkind.cmp_format()
					end
				end
			},
		}	)

	lsp.on_attach(function(client, bufnr)
		require 'illuminate'.on_attach(client)
	end)

	lsp.setup()
end


return M
