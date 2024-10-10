-- Leader key configuration
vim.g.mapleader = " "

-- Utility function for setting key mappings
local function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	if type(rhs) == "function" then
		rhs = string.format("<cmd>lua %s()<CR>", debug.getinfo(rhs).source:match("[%w_]+"))
	end
	if opts and opts.buffer then
		vim.api.nvim_buf_set_keymap(opts.buffer, mode, lhs, rhs, options)
	else
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end
end

-- Function to delete lock file and open LazyGit
function DeleteLockFileAndOpenLazyGit()
	local lock_file_path = ".git/index.lock"
	if vim.fn.filereadable(lock_file_path) == 1 then
		vim.cmd("silent !del " .. lock_file_path)
	end
	vim.cmd("LazyGit")
end

-- Function to run build command
function RunDetachedBuildCommand()
	local build_command = 'start cmd.exe /c "dotnet build C:/Users/aiche/dev/gappel-cloud/src/GappelCloud/GappelCloud & pause"'
	os.execute(build_command)
	print("Build started in a new command window")
end

-- General Editing Mappings
Map("n", "<C-s>", ":w<CR>")
Map("n", "<C-q>", ":q<CR>")
Map("i", "<C-s>", "<Esc>:w<CR>")
Map("i", "<C-q>", "<Esc>:q<CR>")
Map("v", "<C-s>", ":w<CR>")
Map("v", "<C-q>", ":q<CR>")
Map("v", "p", "pgvy")

-- Visual Mode Mappings for Movement
Map("v", "<C-h>", "_")
Map("v", "<C-l>", "$")
Map("v", "J", "jzz")
Map("v", "K", "kzz")
Map("v", "<A-j>", ":m '>+1<CR>gv=gvzz")
Map("v", "<A-k>", ":m '<-2<CR>gv=gvzz")

-- Normal Mode Mappings for Movement
Map("n", "<C-l>", "$")
Map("n", "<C-h>", "_")
Map("n", "<C-k>", "<C-u>zz")
Map("n", "<C-j>", "<C-d>zz")
Map("n", "<leader>[", "%")
Map("n", "<leader>a", "ggVG")
Map("n", "<leader>y", "mzggVGy`zzz")
Map("n", "<leader>P", "mzggVGp`zzz")
Map("n", "<leader>D", "ggVGd")
Map("n", "<leader>/", '/<C-r>"<CR>')
Map("n", "<leader>t", "J")
Map("n", "<leader>o", "<cmd>NeovimProjectDiscover<CR>")
Map("n", "<leader>db", "<cmd>DBUIToggle<CR>")
Map("n", ";", "nzz")
Map("n", "'", "Nzz")
Map("n", "J", "jzz")
Map("n", "K", "kzz")
Map("n", "<C-n>", "i<CR><Esc>l")
Map("n", "n", "o<Esc>")
Map("n", "N", "O<Esc>")
Map("n", "<S-h>", ":execute 'normal! 80zh'<CR>", { desc = "Scroll left half page" })
Map("n", "<S-l>", ":execute 'normal! 80zl'<CR>", { desc = "Scroll right half page" })
Map("n", "<A-j>", ":m .+1<CR>==zz")
Map("n", "<A-k>", ":m .-2<CR>==zz")
Map("n", "<C-m>", "<C-w>_")
Map("n", "<A-h>", "<C-o>")
Map("n", "<A-l>", "<C-i>")

-- Buffer and Window Management
Map("n", "<C-A-m>", "<C-w>_")
Map("n", "<C-A-j>", "<C-w>j")
Map("n", "<C-A-k>", "<C-w>k")
Map("n", "<C-A-h>", "<C-w>h")
Map("n", "<C-A-l>", "<C-w>l")
Map("n", "<C-A-d>", "<C-w>-")
Map("n", "<C-A-i>", "<C-w>+")

-- Git
Map("n", "<leader>G", "<cmd>lua DeleteLockFileAndOpenLazyGit()<CR>")
Map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>")
Map("n", "<leader>gb", ":Gitsigns blame_line<CR>")

-- DAP Mappings
Map("n", "<leader>b", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
Map("n", "<F5>", '<cmd>lua require"dap".continue()<CR>')
Map("n", "<s-F5>", '<cmd>lua require"dap".terminate()<CR>')
Map("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>')
Map("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>')
Map("n", "<s-F11>", '<cmd>lua require"dap".step_out()<CR>')
Map("n", "repl", '<cmd>lua require"dap.repl".toggle()<CR>')
Map("n", "<leader>dh", '<Cmd>lua require"dapui".eval()<CR>', { noremap = true, silent = true })
Map("n", "<leader>dg", '<cmd>lua require"dapui".toggle()<CR>', { noremap = true, silent = true })

-- LSP Mappings
Map(
	"n",
	"<leader>pe",
	"<cmd>Trouble diagnostics toggle focus filter={buf=0,severity=vim.diagnostic.severity.ERROR}<cr>"
)
Map("n", "<leader>pr", "<cmd>Trouble lsp_references toggle focus<cr>")
Map("n", "<leader>pd", "<cmd>lua vim.lsp.buf.definition()<CR>")
Map("n", "<leader>pi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
Map("n", "<leader>pa", "<cmd>lua vim.lsp.buf.code_action()<CR>")
Map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
Map("n", "<leader>h", vim.lsp.buf.hover, { noremap = true, silent = true })
Map("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
Map("n", "<leader>=", ":lua vim.lsp.buf.format({ async = true })<CR>")

-- Spectre Mappings
Map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR><C-w>L', { desc = "Toggle Spectre" })
Map(
	"n",
	"<leader>sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR><C-w>L',
	{ desc = "Search current word" }
)
Map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR><C-w>L', { desc = "Search current word" })
Map(
	"n",
	"<leader>sp",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR><C-w>L',
	{ desc = "Search on current file" }
)

-- Key binding for build command
Map("n", "<F6>", [[:lua RunDetachedBuildCommand()<CR>]], { noremap = true, silent = true })

-- Harpoon
Map(
	"n",
	"<leader>p0",
	'<cmd>lua require("harpoon.mark").add_file()<CR><cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>'
)

Map("n", "<leader>po", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')

for i = 1, 9 do
	Map("n", "<leader>p" .. i, '<cmd>lua require("harpoon.ui").nav_file(' .. i .. ")<CR>")
end

-- Telescope
Map("n", "<leader>F", ":Telescope find_files<CR>")
Map("n", "<leader>fw", ":Telescope live_grep<CR>")
Map("n", "<leader>fp", ":Telescope resume<CR>")

-- UndoTree
Map("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

-- NvimTree
Map("n", "<leader>pf", ":NvimTreeToggle<CR>")
