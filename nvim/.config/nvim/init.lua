-- PACKAGE MANAGER

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- LEADER
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup("plugins")


-- OPTIONS
local o = vim.o


o.scrolloff = 5
o.wrap = false
o.lazyredraw = true
o.number = true
o.relativenumber = true
o.termguicolors = true
o.cursorline = true
o.colorcolumn = '81'
o.laststatus = 1
o.splitbelow = true
o.splitright = true
o.clipboard = 'unnamedplus'

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
