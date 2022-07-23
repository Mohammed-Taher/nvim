local M = {}

local icons = require("config.utils").icons()
local kind_icons = icons

function M.setup()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lsp = require("lsp-zero")
	lsp.preset("recommended")
	lsp.nvim_workspace()

	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format({
			filter = function(client)
				-- apply whatever logic you want (in this example, we'll only use null-ls)
				return client.name == "null-ls"
			end,
			bufnr = bufnr,
		})
	end

	-- if you want to set up formatting on save, you can use this as a callback
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	-- configure null-ls
	local null_ls = require("null-ls")
	local null_opts = lsp.build_options("null-ls", {
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end,
	})

	null_ls.setup({
		on_attach = null_opts.on_attach,
		sources = {
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.eslint,
			null_ls.builtins.formatting.phpcsfixer,
			null_ls.builtins.formatting.blade_formatter,
			null_ls.builtins.formatting.djhtml,
			null_ls.builtins.code_actions.eslint,
			null_ls.builtins.code_actions.refactoring,
			null_ls.builtins.completion.tags,
			null_ls.builtins.diagnostics.eslint,
			null_ls.builtins.diagnostics.flake8,
			null_ls.builtins.diagnostics.phpcs,
		},
	})

	-- Use buffer source for `/`
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':'
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	lsp.setup_nvim_cmp({
		sources = {
			{ name = "nvim_lsp_signature_help" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "cmdline" },
			{ name = "path" },
			{ name = "tags" },
		},
		mapping = {

			["<Tab>"] = cmp.mapping(function(fallback)
				-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						cmp.confirm()
					end
				else
					fallback()
				end
			end, { "i", "s", "c" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
			["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		},
		formatting = {
			format = function(entry, vim_item)
				local prsnt, lspkind = pcall(require, "lspkind")
				if not prsnt then
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
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
			end,
		},
	})

	lsp.on_attach(function(client, bufnr)
		-- Load vim illuminate
		require("illuminate").on_attach(client)
	end)

	lsp.setup()
end

return M
