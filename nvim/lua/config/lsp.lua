local null_ls = require('null-ls')
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local border_opts = require('config.borders').float_opts

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, border_opts
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, border_opts
)

-- Setup null-ls
null_ls.setup({
    debug = true,
    sources = {
				null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gdformat,
        null_ls.builtins.formatting.csharpier,
    },
})

-- Setup LSP servers
lsp.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
    capabilities = capabilities,
})

lsp.gdscript.setup({
    capabilities = capabilities,
})

lsp.csharp_ls.setup({
    capabilities = capabilities,
})

Map("n", "<leader>pd", "<cmd>lua vim.lsp.buf.definition()<CR>")
Map("n", "<leader>pi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
Map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
