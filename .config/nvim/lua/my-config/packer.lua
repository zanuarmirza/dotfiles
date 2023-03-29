vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'Mofiqul/dracula.nvim',
        as = 'dracula',
        config = function()
            require("dracula").setup()
            vim.cmd('colorscheme dracula')
        end
    })
    -- use 'folke/tokyonight.nvim'
    -- use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')

    -- git plugins
    use('tpope/vim-fugitive')
    use('mhinz/vim-signify')
    -- use('airblade/vim-gitgutter')

    use { 'numToStr/Comment.nvim' }
    -- use('RRethy/nvim-treesitter-textsubjects')
    
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    -- use {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v2.x",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim",
    --     }
    -- }
    --use ('JoosepAlviste/nvim-ts-context-commentstring')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use('windwp/nvim-ts-autotag')
    -- use('jose-elias-alvarez/null-ls.nvim')
    use('sbdchd/neoformat')
    use "lukas-reineke/indent-blankline.nvim"
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use "rafamadriz/friendly-snippets"
    use {
        "benfowler/telescope-luasnip.nvim",
        module = "telescope._extensions.luasnip", -- if you wish to lazy-load
    }
end)
