local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local telescopeConfig = require("telescope.config")

telescope.setup {
    defaults = {
        path_display = { "truncate" },
        -- default argumento
        -- vimgrep_arguments = {
        --     "rg",
        --     "--color=never",
        --     "--no-heading",
        --     "--with-filename",
        --     "--line-number",
        --     "--column",
        --     "--smart-case"
        -- }
    },
    pickers = {
        buffers = {
            -- initial_mode = "normal",
            mappings = {
                n = {
                    ["x"] = actions.delete_buffer + actions.move_to_top, -- delete buffer at telescope buffer result
                }
            }
        },
        -- grep_string = {
        --     additional_args = {
        --         '--color=never',
        --         '--no-heading',
        --         '--hidden',
        --         '--with-filename',
        --         '--line-number',
        --         '--column',
        --         '--smart-case',
        --         '--multiline',
        --     },
        -- }
    }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find files (fuzzy)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- show buffer
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- search files at git
vim.keymap.set('n', '<leader>fr', builtin.resume, {}) -- show latest telescope result
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {}) -- show documents symbols
vim.keymap.set('n', '<leader>gc', builtin.git_status, {}) -- show git status list
vim.keymap.set('n', '<leader>o', builtin.oldfiles, {}) -- show oldfiles
-- install ripgrep when using macOS
-- standard grep string
vim.keymap.set('n', '<leader>fg', function()
    builtin.grep_string({ use_regex = true, search = vim.fn.input("Grep > ") });
end)
-- multiline refex grep string
vim.keymap.set('n', '<leader>fx', function()
    builtin.grep_string({ use_regex = true, additional_args = { '--multiline' }, search = vim.fn.input("Grep > ") });
end)
