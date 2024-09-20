require('trouble').setup{
	opts = {},
	cmd = "Trouble",
}

Map('n', '<leader>pe', '<cmd>Trouble diagnostics toggle<cr>')
