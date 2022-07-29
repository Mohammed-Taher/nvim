local M = {}

function M.setup()
	require("nvim-tree").setup({
		sort_by = "name",
		disable_netrw = true,
		auto_reload_on_write = true,
		hijack_netrw = true,
		view = {
			side = "right",
			number = false,
			relativenumber = false,
		},
		renderer = {
			highlight_git = true,
			highlight_opened_files = "all",
			indent_markers = {
				enable = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					none = " ",
				},
			},
			icons = {
				webdev_colors = true,
				git_placement = "before",
				padding = " ",
				symlink_arrow = "  ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = " ",
					symlink = " ",
					bookmark = " ",
					folder = {
						arrow_closed = " ",
						arrow_open = " ",
						default = " ",
						open = " ",
						empty = " ",
						empty_open = " ",
						symlink = " ",
						symlink_open = " ",
					},
					git = {
						unstaged = " ",
						staged = " ",
						unmerged = " ",
						renamed = " ",
						untracked = " ",
						deleted = " ",
						ignored = " ",
					},
				},
			},
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		},
		filters = {
			custom = { ".git" },
			dotfiles = false,
		},
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
	})
end

return M
