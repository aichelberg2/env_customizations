require('trouble').setup{
	opts = {},
	cmd = "Trouble",
}

Map('n', '<leader>pe', '<cmd>Trouble diagnostics toggle focus filter={buf=0,severity=vim.diagnostic.severity.ERROR}<cr>')
Map('n', '<leader>pr', '<cmd>Trouble lsp toggle focus<cr>')
