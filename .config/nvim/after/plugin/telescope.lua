local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local telescopeConfig = require("telescope.config")

telescope.setup {
    defaults = {
        path_display={"truncate"},
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
                    ["x"] = actions.delete_buffer + actions.move_to_top,
                }
            }
        }
    }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', builtin.resume,{})
-- install ripgrep when using macOS
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });

end)
