vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#ffffff gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = " ",
    space_char_highlight_list = " ",
    -- show_trailing_blankline_indent = false,
    -- show_current_context = true,
    -- show_current_context_start = true,
}
