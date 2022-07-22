require('plugins').setup()
require('colorscheme')
require('keymaps')
require("luasnip.loaders.from_snipmate").load()

vim.o.cmdheight = 0 

vim.cmd [[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]
