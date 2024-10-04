local lackluster = require("lackluster")

local color = lackluster.color -- blue, green, red, orange, black, lack, luster, gray1-9

-- !must called setup() before setting the colorscheme!
lackluster.setup({
    tweak_background = {
        normal = 'none',
        telescope = 'none',
        menu = 'none',
        popup = 'none',
    },
})

-- Function to set up the colorscheme
local function colormy()
    vim.cmd.colorscheme("lackluster")
end

-- Return the setup function
return {
    colormy = colormy
}
