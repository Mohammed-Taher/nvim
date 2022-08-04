local M = {}

function M.setup()
	local conf = {
		git = {
			clone_timeout = false,
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
			working_sym = " ", -- The symbol for a plugin being installed/updated
			error_sym = " ", -- The symbol for a plugin with an error in installation/updating
			done_sym = " ", -- The symbol for a plugin which has completed installation/updating
			removed_sym = " ", -- The symbol for an unused plugin which was removed
			moved_sym = " ", -- The symbol for a plugin which was moved (e.g. from opt to start)
			header_sym = " ", -- The symbol for the header line in packer's display
			show_all_info = true, -- Should packer show all update details automatically?
			prompt_border = "double", -- Border style of prompt popups.
		},
	}

	local function plugins(use)
		use("wbthomason/packer.nvim")
		use("folke/tokyonight.nvim")
		use("rebelot/kanagawa.nvim")

		-- NvimTree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icons
			},
			config = function()
				require("config.nvim-tree").setup()
			end,
		})

		-- LSP
		use({
			"VonHeikemen/lsp-zero.nvim",
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/nvim-lsp-installer" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{ "saadparwaiz1/cmp_luasnip" },
				{
					"quangnguyen30192/cmp-nvim-tags",
					ft = {
						"javascript",
						"php",
						"python",
						"lua",
					},
				},
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{ "jose-elias-alvarez/null-ls.nvim" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
			config = function()
				require("config.lsp-zero").setup()
			end,
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("config.telescope").setup()
			end,
		})

		use({
			"nvim-telescope/telescope-file-browser.nvim",
		})

		-- Indent Blank Line
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("config.indentblankline")
			end,
		})

		-- TreeSitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter").setup()
			end,
		})

		-- Autopair
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("config.nvim-autopairs").setup({})
			end,
		})

		use("windwp/nvim-ts-autotag")

		use("RRethy/nvim-treesitter-endwise")

		use("jwalton512/vim-blade")

		use({
			"yamatsum/nvim-nonicons",
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- Better Comment
		use({
			"numToStr/Comment.nvim",
			keys = { "gc", "gcc", "gbc" },
			config = function()
				require("Comment").setup({})
			end,
		})

		-- Startup screen
		use({
			"goolord/alpha-nvim",
			config = function()
				require("config.alpha").setup()
			end,
		})

		-- WhichKey
		use({
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
			end,
		})

		-- Vim Illuminate
		use({ "RRethy/vim-illuminate" })

		-- LuaLine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("config.lualine").setup()
			end,
		})

		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
			config = function()
				require("nvim-navic").setup()
			end,
		})

		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("config.bufferline").setup()
			end,
		})

		use({
			"akinsho/toggleterm.nvim",
			tag = "v2.*",
			config = function()
				require("config.toggleterm").setup()
			end,
		})

		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			config = function()
				require("config.lspsaga").setup()
			end,
		})

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("config.nvim-colorizer").setup()
			end,
		})

		use({
			"ziontee113/color-picker.nvim",
			config = function()
				require("config.color-picker").setup()
			end,
		})

		-- Testing
		use("vim-test/vim-test")
		use({
			"nvim-neotest/neotest",
			wants = {
				"plenary.nvim",
				"nvim-treesitter",
				"FixCursorHold.nvim",
				"neotest-plenary",
				"neotest-phpunit",
			},
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"antoinemadec/FixCursorHold.nvim",
				"olimorris/neotest-phpunit",
				"nvim-neotest/neotest-plenary",
			},
			config = function()
				require("config.neotest").setup()
			end,
		})

		-- Lua Dev
		use({
			"folke/lua-dev.nvim",
			config = function()
				require("config.lua-dev").setup()
			end,
		})

		-- Vim-surround
		use({ "tpope/vim-surround" })

		use("MunifTanjim/nui.nvim")

		use({
			"rcarriga/nvim-notify",
			config = function()
				require("config.nvim-notify").setup()
			end,
		})

		use({
			"Mohammed-Taher/AdvancedNewFile.nvim",
			config = function()
				require("config.advanced_new_file")
			end,
		})
	end

	local packer = require("packer")
	packer.init(conf)
	packer.startup(plugins)
end

return M
