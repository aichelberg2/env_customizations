-- Set leader key
vim.g.mapleader = " "

-- Key mappings
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	if type(rhs) == "function" then
		rhs = string.format("<cmd>lua %s()<CR>", debug.getinfo(rhs).source:match("[%w_]+")) -- Get the function name
	end

	if opts and opts.buffer then
		vim.api.nvim_buf_set_keymap(opts.buffer, mode, lhs, rhs, options)
	else
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end
end

-- Require the plugins configuration
require("plugins")
require("config.cmp")
require("config.dap")
require("config.gitsigns")
require("config.harpoon")
require("config.lsp")
require("config.lualine")
require("config.mason")
require("config.noice")
require("config.nvim-tree")
require("config.telescope")
require("config.theme")
require("config.treesitter")
require("config.trouble")
require("config.undotree")
require("config.borders").setup_lsp_handlers()

Map("n", "r", "<C-r>")
Map("n", "<leader>a", "ggVG")
Map("n", "<leader>y", "mzggVGy`zzz")
Map("n", "<leader>P", "mzggVGp`zzz")
Map("n", "<leader>D", "ggVGd")
Map("n", "<C-l>", "$")
Map("n", "<C-h>", "_")
Map("v", "<C-h>", "_")
Map("v", "<C-l>", "$")
Map("n", "<leader>[", "%")
Map("n", "n", "o<Esc>")
Map("n", "N", "O<Esc>")
Map("n", "<C-n>", "i<CR><Esc>l")
Map("n", "<C-k>", "<C-u>zz")
Map("n", "<C-j>", "<C-d>zz")
Map("v", "<C-k>", "<C-u>zz")
Map("v", "<C-j>", "<C-d>zz")
Map("n", ";", "nzz")
Map("n", "'", "Nzz")
Map("n", "J", "jzz")
Map("n", "K", "kzz")
Map("v", "J", "jzz")
Map("v", "K", "kzz")
Map("n", "<S-h>", ":execute 'normal! 80zh'<CR>", { desc = "Scroll left half page" })
Map("n", "<S-l>", ":execute 'normal! 80zl'<CR>", { desc = "Scroll right half page" })
--Map("n", "<C-s>", ":w<CR>:lua vim.lsp.buf.format({ async = true })<CR>")
Map("n", "<C-s>", ":w<CR>")
Map("n", "<C-q>", ":q<CR>")
--Map("i", "<C-s>", "<Esc>:w<CR>:lua vim.lsp.buf.format({ async = true })<CR>")
Map("i", "<C-s>", "<Esc>:w<CR>")
Map("i", "<C-q>", "<Esc>:q<CR>")
Map("v", "<C-s>", ":w<CR>:lua vim.lsp.buf.format({ async = true })<CR>")
Map("v", "<C-q>", ":q<CR>")
Map("n", "<A-j>", ":m .+1<CR>==zz")
Map("n", "<A-k>", ":m .-2<CR>==zz")
Map("v", "<A-j>", ":m '>+1<CR>gv=gvzz")
Map("v", "<A-k>", ":m '<-2<CR>gv=gvzz")
Map("n", "<C-A-m>", "<C-w>_")
Map("n", "<C-A-j>", "<C-w>j")
Map("n", "<C-A-k>", "<C-w>k")
Map("n", "<C-A-h>", "<C-w>h")
Map("n", "<C-A-l>", "<C-w>l")
Map("n", "<C-A-d>", "<C-w>-")
Map("n", "<C-A-i>", "<C-w>+")
Map("n", "<C-m>", "<C-w>_")
Map("v", "p", "pgvy")
Map("n", "<leader>/", '/<C-r>"<CR>')
Map("n", "<leader>t", 'J')
Map("n", "<leader>o", '<cmd>NeovimProjectDiscover<CR>')
Map("n", "<leader>db", '<cmd>DBUIToggle<CR>')

function DeleteLockFileAndOpenLazyGit()
	local lock_file_path = ".git\\index.lock"
	local file_exists = vim.fn.filereadable(lock_file_path) == 1

	if file_exists then
		vim.cmd("silent !del " .. lock_file_path)
	end
	vim.cmd("LazyGit")
end
Map("n", "<leader>G", "<cmd>lua DeleteLockFileAndOpenLazyGit()<CR>")

-- Mappings for VSCode
Map("n", "<A-h>", "<C-o>")
Map("n", "<A-l>", "<C-i>")

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR><C-w>L', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR><C-w>L', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR><C-w>L', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR><C-w>L', {
    desc = "Search on current file"
})

-- Set options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.clipboard = "unnamed"
vim.opt.backspace = "indent,eol,start"
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "C:\\Users\\ChristianGappel\\.vim\\undo\\"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.whichwrap:append("h,l")

-- Set highlighting
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
