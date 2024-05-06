require("lualine").setup({
    options = {
        theme = 'dracula'
    },
    sections = {
        lualine_c = { "filename", "require'lsp-status'.status()" },
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
        lualine_b = { { 'filename', path = 1, shorting_target = 0 } },
        lualine_c = { 'mode' },
        lualine_x = { 'encoding' },
        lualine_y = {},
        lualine_z = { 'tabs' }
    }
})
