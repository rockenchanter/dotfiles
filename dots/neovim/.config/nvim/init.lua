vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {}
require("lazy").setup("plugins", lazy_opts)

local opt = vim.o
opt.number = true
opt.lazyredraw = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.cursorline = true
opt.colorcolumn = '81,82'
opt.clipboard = "unnamedplus"
opt.scrolloff = 5
opt.tabstop = 4
opt.shiftwidth = 4
opt.wrap = false
opt.expandtab = true
opt.equalalways = false
opt.completeopt="menu,menuone,noselect"

local opts = { noremap = true }
local map = vim.api.nvim_set_keymap
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
