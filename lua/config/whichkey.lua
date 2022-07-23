local M = {}

function M.setup()
	local whichkey = require("which-key")

	local conf = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	}

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		b = {
			name = "Buffer",
			c = { "<Cmd>bd!<Cr>", "Close current buffer" },
			D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		g = {
			name = "Git",
			s = { "<cmd>Neogit<CR>", "Status" },
		},

		f = {
			name = "Find",
			f = { "<cmd>Telescope find_files<cr>", "Files" },
			t = { "<cmd>Telescope tags<cr>", "Tags" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			r = { "<cmd>Telescope file_browser<cr>", "Browser" },
			w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
			e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		},

		t = {
			name = "Terminal",
			t = { "<cmd>ToggleTerm<CR>", "Terminal" },
			l = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazy Git" },
			p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Python" },
			n = { "<cmd>lua _NODE_TOGGLE()<CR>", "Node" },
		},

		e = {
			name = "Edit configurations",
			p = { "<cmd>e $HOME/.config/nvim/lua/plugins.lua<CR>", "Plugins" },
			m = { "<cmd>e $HOME/.config/nvim/lua/keymaps.lua<CR>", "Keymaps" },
			v = { "<cmd>e $MYVIMRC<CR>", "init.lua" },
		},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
