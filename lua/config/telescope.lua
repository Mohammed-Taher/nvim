local M = {}

function M.setup()
	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			sorting_strategy = "ascending",
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
				previewer = false,
				hidden = true,
				prompt_prefix = "   ",
				selection_caret = "   ",
				entry_prefix = "    ",
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { "node_modules", ".git", "vendor" },
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				color_devicons = true,
			},
			lsp_document_symbols = {
				theme = "dropdown",
				previewer = false,
				prompt_prefix = "  ",
				selection_caret = "   ",
				entry_prefix = "    ",
				color_devicons = true,
			},
			tags = {
				prompt_prefix = "   ",
			},
		},
		extensions = {
			file_browser = {
				prompt_prefix = "  ",
				selection_caret = "   ",
				entry_prefix = "    ",
				previewer = false,
				files = false,
				display_stats = false,
			},
		},
	})

	require("telescope").load_extension("file_browser")
end
return M
