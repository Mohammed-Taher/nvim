local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "html", "javascript", "php", "python", "css", "svelte", "vue", "lua" },
		auto_install = true,
		highlight = {
			enable = true,
			disable = { "" },
			additional_vim_regex_highlighting = true,
		},
		indent = {
			enable = true,
		},
		endwise = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})
end

return M
