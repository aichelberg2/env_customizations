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
require("config.nvim-tree")
require("config.telescope")
require("config.harpoon")
require("config.undotree")
require("config.mason")
require("config.treesitter")
require("config.dap")
require("config.lsp")
require("config.cmp")
--require("config.lackluster")
require("config.gitsigns")
require("config.lualine")
require("config.trouble")
require("command-completion").setup()
require("config.borders").setup_lsp_handlers()

Map("n", "r", "<C-r>")
Map("n", "<leader>a", "ggVG")
Map("n", "<leader>y", "mzggVGy`zzz")
Map("n", "<leader>pp", "mzggVGp`zzz")
Map("n", "<leader>dd", "ggVGd")
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


-- Mappings for VSCode
Map("n", "<A-h>", "<C-o>")
Map("n", "<A-l>", "<C-i>")

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

local function safe_del_keymap(mode, lhs)
	local map_exists = vim.api.nvim_get_keymap(mode)
	for _, mapping in ipairs(map_exists) do
		if mapping.lhs == lhs then
			vim.api.nvim_del_keymap(mode, lhs)
			return
		end
	end
end

safe_del_keymap('n', '<C-b>')
safe_del_keymap('n', '<C-f>')

-- Set highlighting
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
