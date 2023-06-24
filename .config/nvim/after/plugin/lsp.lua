local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})
lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
})

local ls = require('luasnip')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local function luasnip_safe_jump_forward()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end
local function luasnip_safe_jump_backward()
    if ls.jumpable( -1) then
        ls.jump( -1)
    end
end
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = luasnip_safe_jump_forward,
    ['<S-Tab>'] = luasnip_safe_jump_backward,
})
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gc", function() vim.lsp.buf.incoming_calls() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vf", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    -- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
    vim.api.nvim_set_keymap('n', '<leader>vd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
    -- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
    vim.api.nvim_set_keymap('n', '<leader>VD', '<cmd>lua vim.diagnostic.setqflist()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>VE',
        '<cmd>lua vim.diagnostic.setqflist({severity=vim.diagnostic.severity.ERROR})<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>li', '<cmd>EslintFixAll<CR>', { noremap = true, silent = true })
end)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- vim.diagnostic.config({
--     virtual_text = true
-- })

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
        }
    }
}
