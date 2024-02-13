require("neotest").setup({
    -- your neotest config here
    adapters = {
        require("neotest-go"),
        require('rustaceanvim.neotest'),
        require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
                return vim.fn.getcwd()
            end,
        }),
    },
})

vim.keymap.set('n', '<leader>rd', function() require("neotest").run.run({strategy = "dap"}) end)
vim.keymap.set('n', '<leader>rt', function() require('neotest').run.run() end)
vim.keymap.set('n', '<leader>re', function() require('neotest').output.open() end)
vim.keymap.set('n', '<leader>RE', function() require('neotest').output_panel.toggle() end)
vim.keymap.set('n', '<leader>rs', function() require('neotest').summary.toggle() end)
