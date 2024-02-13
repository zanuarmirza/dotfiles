require("fzf-lua").setup({ "telescope" })
local actions = require("fzf-lua.actions")
local m = require("fzf-lua",{
    actions    = {
        files = {
            ["ctrl-s"]  = actions.file_split,
        },
        buffers = {
            ["ctrl-s"]  = actions.buf_split,
        }
    }
})

vim.keymap.set('n', '<leader>ff', m.files, { silent = true }) -- find files (fuzzy)
vim.keymap.set('n', '<leader>fb', m.buffers, { silent = true }) -- show buffer
vim.keymap.set('n', '<C-p>', m.git_files, {silent = true}) -- search files at git
vim.keymap.set('n', '<leader>fr', m.resume, {}) -- show latest telescope result
-- vim.keymap.set('n', '<leader>fs', m.lsp_document_symbols, {}) -- show documents symbols
vim.keymap.set('n', '<leader>gt', m.git_status, {}) -- show git status list
vim.keymap.set('n', '<leader>f/', m.lgrep_curbuf, {}) -- show git status list
vim.keymap.set('n', '<leader>o', function()
    m.oldfiles({
        prompt_title = 'Project History',
        cwd_only = true,
    })
end, {}) -- show oldfiles

vim.keymap.set('n', '<leader>fg', function()
    m.grep({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>flg', function()
    m.live_grep({ rg_opts = '--multiline' });
end)
