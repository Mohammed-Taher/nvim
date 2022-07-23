require("plugins").setup()
require("colorscheme")
require("keymaps").setup()
require("luasnip.loaders.from_snipmate").load()

vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])
