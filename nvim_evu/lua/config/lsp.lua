local null_ls = require("null-ls")
local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local border_opts = require("config.borders").float_opts

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, border_opts)

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.csharpier,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint.with({
			cwd = function(params)
				return vim.fn.getcwd()
			end,
		}),
	},
})

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

lsp.csharp_ls.setup({
	capabilities = capabilities,
})

lsp.ts_ls.setup({
	capabilities = capabilities,
})

lsp.cssls.setup({
	capabilities = capabilities,
})

-- lsp.angularls.setup({
-- 	capabilities = capabilities,
-- })

Map("n", "<leader>pd", "<cmd>lua vim.lsp.buf.definition()<CR>")
Map("n", "<leader>pi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
Map("n", "<leader>pa", "<cmd>lua vim.lsp.buf.code_action()<CR>")
Map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
Map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
Map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
Map("n", "<leader>=", ":lua vim.lsp.buf.format({ async = true })<CR>")

local ok, mason_registry = pcall(require, 'mason-registry')
if not ok then
    vim.notify 'mason-registry could not be loaded'
    return
end

local angularls_path =
    mason_registry.get_package('angular-language-server'):get_install_path()

local cmd = {
    'ngserver',
    '--stdio',
    '--tsProbeLocations',
    table.concat({
        angularls_path,
        vim.uv.cwd(),
    }, ','),
    '--ngProbeLocations',
    table.concat({
        angularls_path .. '/node_modules/@angular/language-server',
        vim.uv.cwd(),
    }, ','),
}

local config = {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
}

return config
