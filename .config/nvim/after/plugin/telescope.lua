local telescope = require('telescope')
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
    }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', builtin.resume,{})
-- install ripgrep when using macOS
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });

end)
