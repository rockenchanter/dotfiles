require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
      "css", "scss", "html", "javascript", -- for vue components
      "c", "lua", "vim", "vimdoc", "ruby", "bash",
      "python", "java"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true,
  }
}
