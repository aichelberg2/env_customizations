local null_ls = require("null-ls")
local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local border = require("config.borders").border

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

lsp.angularls.setup({
	capabilities = capabilities,
})

-- Override the default LSP floating window handler
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Configure diagnostic float
vim.diagnostic.config({
	float = {
		border = border,
		source = "always", -- Or "if_many"
	},
})

-- Set key mappings
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Key mappings for LSP actions
Map("n", "<leader>pd", "<cmd>lua vim.lsp.buf.definition()<CR>")
Map("n", "<leader>pi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
Map("n", "<leader>pa", "<cmd>lua vim.lsp.buf.code_action()<CR>")
Map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
Map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
Map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
Map("n", "<leader>=", ":lua vim.lsp.buf.format({ async = true })<CR>")

local ok, mason_registry = pcall(require, "mason-registry")
if not ok then
	vim.notify("mason-registry could not be loaded")
	return
end

-- local angularls_path = mason_registry.get_package("angularls"):get_install_path()
--
-- local cmd = {
-- 	"ngserver",
-- 	"--stdio",
-- 	"--tsProbeLocations",
-- 	table.concat({
-- 		angularls_path,
-- 		vim.uv.cwd(),
-- 	}, ","),
-- 	"--ngProbeLocations",
-- 	table.concat({
-- 		angularls_path .. "/node_modules/@angular/language-server",
-- 		vim.uv.cwd(),
-- 	}, ","),
-- }
--
-- local config = {
-- 	cmd = cmd,
-- 	on_new_config = function(new_config, new_root_dir)
-- 		new_config.cmd = cmd
-- 	end,
-- }
--
-- return config
