require("neotest").setup({
    -- your neotest config here
    adapters = {
        require("neotest-go"),
        require('rustaceanvim.neotest'),
        require("neotest-vim-test")({ ignore_filetypes = { "go", "rust" } }),
    },
})

vim.keymap.set('n', '<leader>td', function() require("neotest").run.run({strategy = "dap"}) end)
vim.keymap.set('n', '<leader>tr', function() require('neotest').run.run() end)
vim.keymap.set('n', '<leader>to', function() require('neotest').output.open() end)
vim.keymap.set('n', '<leader>TO', function() require('neotest').output_panel.toggle() end)
vim.keymap.set('n', '<leader>ts', function() require('neotest').summary.toggle() end)
