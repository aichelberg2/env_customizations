require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation  = true
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup{}

