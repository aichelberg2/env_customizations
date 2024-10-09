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
    current_line_blame = false, -- Disable inline blame
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
}

-- Define highlight groups for gitsigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })

-- Set key mappings for navigating hunks
local function set_gitsigns_keymaps()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', opts)
    vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>', opts)
end

set_gitsigns_keymaps()
