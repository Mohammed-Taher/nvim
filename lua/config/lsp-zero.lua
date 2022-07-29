local M = {}

local icons = require("config.utils").icons()
local kind_icons = icons

function M.setup()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lsp = require("lsp-zero")
	lsp.preset("recommended")
	lsp.set_preferences({
		set_lsp_kemaps = false,
	})
	lsp.nvim_workspace({
		library = vim.api.nvim_get_runtime_file("", true),
	})

	-- local lsp_formatting = function(bufnr)
	-- 	vim.lsp.buf.format({
	-- 		filter = function(client)
	-- 			return client.name == "null-ls"
	-- 		end,
	-- 		bufnr = bufnr,
	-- 	})
	-- end

	-- if you want to set up formatting on save, you can use this as a callback
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	-- configure null-ls
	local null_ls = require("null-ls")
	local null_opts = lsp.build_options("null-ls", {
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					desc = "Auto format before save.",
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							bufnr = bufnr,
							filter = function(client)
								return client.name == "null-ls"
							end,
						})
					end,
				})
			end
		end,
	})

	null_ls.setup({
		on_attach = null_opts.on_attach,
		sources = {
			null_ls.builtins.formatting.prettierd.with({
				filetypes = { "html", "json", "svelte", "markdown", "css", "javascript", "javascriptreact" },
				-- command = "./node_modules/.bin/prettier",
			}),
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.phpcsfixer,
			null_ls.builtins.formatting.blade_formatter,
			null_ls.builtins.formatting.djhtml,
			null_ls.builtins.completion.tags,
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
			{ name = "nvim_lsp" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "luasnip", keyword_length = 3 },
			{ name = "path" },
			{ name = "buffer", keyword_length = 3 },
			{ name = "cmdline" },
			{ name = "tags" },
		},
		window = {
			documentation = cmp.config.window.bordered(),
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
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
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
		local noremap = { buffer = bufnr, remap = false }
		local bind = vim.keymap.set
		-- LSP Saga
		bind("n", "<F4>", "<cmd>Lspsaga code_action<CR>", noremap)
		bind("n", "<F2>", "<cmd>Lspsaga rename<CR>", noremap)
		bind("n", "K", "<cmd>Lspsaga hover_doc<CR>", noremap)
		bind("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>", noremap)

		-- Load vim illuminate
		require("illuminate").on_attach(client)
	end)

	lsp.configure("emmet_ls", {
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "blade" },
	})

	lsp.setup()
end

return M
