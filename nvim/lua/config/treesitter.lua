require'nvim-treesitter.configs'.setup {
  -- Install languages synchronously (only applied to `ensure_installed`)
  ensure_installed = { "lua", "javascript", "html", "css", "c_sharp", "dockerfile" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
