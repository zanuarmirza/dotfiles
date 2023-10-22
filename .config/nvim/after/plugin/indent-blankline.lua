vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#888888 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#ffffff gui=nocombine]]
vim.opt.list = true

require("ibl").setup {
    -- char_highlight_list          = {
    --     "IndentBlanklineIndent1",
    -- },
    -- show_current_context         = true,
    -- context_highlight_list       = { "IndentBlanklineIndent2" }
}
