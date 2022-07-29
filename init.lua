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

-- Disable vim-illuminate on NvimTree
vim.cmd([[
let g:Illuminate_ftblacklist = ['NvimTree', 'packer']
]])

vim.cmd([[
command! NeotestSummary lua require("neotest").summary.toggle()
command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
command! NeotestNearest lua require("neotest").run.run()
command! NeotestDebug lua require("neotest").run.run({ strategy = "dap" })
command! NeotestAttach lua require("neotest").run.attach()
]])
