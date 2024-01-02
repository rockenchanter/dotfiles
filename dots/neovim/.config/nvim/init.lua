require 'plugins'
require 'configs.treesitter'
require 'configs.lsp'
require 'configs.colorscheme'
require 'configs.nvimtree'

local opt = vim.o
local map = vim.api.nvim_set_keymap
opt.number = true
opt.lazyredraw = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.cursorline = true
opt.colorcolumn = '81,82'
opt.clipboard = "unnamedplus"
opt.scrolloff = 8
opt.tabstop = 4
opt.shiftwidth = 4
opt.wrap = false
opt.expandtab = true
opt.equalalways = false
opt.completeopt="menu,menuone,noselect"

local opts = { noremap = true }
vim.g.mapleader = " "

map("n", "<leader>r", ":so %<cr>", opts) -- source current vim/lua file
map("n", "<leader>s", ":w<cr>", opts)	 -- save file
map("n", "<leader>mm", ":make<cr>", opts)

-- previous/next buffer
map("n", "<s-tab>", ":bp<cr>", opts)
map("n", "<tab>", ":bn<cr>", opts)
map("n", "<leader>d", ":bp|bd#<cr>", opts)
map("n", "<leader>x", ":bd<cr>", opts)

-- resize panes
map("n", "<Left>", ":vertical resize -2<cr>", opts)
map("n", "<Right>", ":vertical resize +2<cr>", opts)
map("n", "<Down>", ":resize -2<cr>", opts)
map("n", "<Up>", ":resize +2<cr>", opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


map("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
map("n", "<leader>tt", ":TroubleToggle<cr>", opts)

vim.opt.termguicolors = true
require("bufferline").setup{}
require('lualine').setup()
require('colorizer').setup()
