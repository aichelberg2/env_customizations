local border = require('config.borders').border

require('gitsigns').setup {
    signs = {
        add = { text = '▌' },
        change = { text = '▌' },
        delete = { text = '▌' },
    },
    preview_config = {
        border = border,
    },
}

-- Define highlight groups for gitsigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })

-- Set key mappings for navigating hunks
local function set_gitsigns_keymaps()
	local opts = { noremap = true, silent = true }
	Map('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', opts)
	Map('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', opts)
end

set_gitsigns_keymaps()
