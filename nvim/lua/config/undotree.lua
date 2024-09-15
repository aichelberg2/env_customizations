vim.g.undotree_WindowLayout = 3
vim.g.undotree_DiffCommand = "fc"
vim.g.undotree_SetFocusWhenToggle = 1

vim.keymap.set('n', '<leader>u', function()
	vim.cmd('UndotreeToggle')
	vim.cmd('UndotreeFocus')
end, { noremap = true, silent = true })
