require("lualine").setup({
    options = {
        theme = 'tokyonight'
    },
    sections = {
        lualine_x = {
            { 'encoding' },
            {
                'fileformat',
                icons_enabled = true,
                symbols = {
                    unix = ' LF', -- e712
                    dos = ' CRLF', -- e70f
                    mac = ' CR', -- e711
                },
            },
            { 'filetype' }
        },
    },
    tabline = {
        lualine_b = { { 'filename', path = 1 } },
        lualine_c = { 'mode' },
        lualine_x = { 'encoding' },
        lualine_y = {},
        lualine_z = { 'tabs' }
    }
})
