local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver' },
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
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_format = require('lsp-zero').cmp_format({ details = true })
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = luasnip_safe_jump_forward,
        ['<S-Tab>'] = luasnip_safe_jump_backward,
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    --- (Optional) Show source name in completion menu
    formatting = cmp_format,

})
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local severity_error = { severity = vim.diagnostic.severity.ERROR }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gc", function() vim.lsp.buf.incoming_calls() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vf", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next(severity_error) end, opts)
    vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev(severity_error) end, opts)
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

function ToggleInlay()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

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
lspconfig.gopls.setup({
    settings = {
        gopls = {
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true
            }
        }
    }
})
lspconfig.denols.setup {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
lspconfig.tsserver.setup {
    root_dir = lspconfig.util.root_pattern("package.json"),
    single_file_support = false,
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
        }
    },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        },
    }
}
lspconfig.tailwindcss.setup({
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                    { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
                },
            },
        },
    },
})
-- lspconfig.rust_analyzer.setup {
--   -- Other Configs ...
--   settings = {
--     ["rust-analyzer"] = {
--       -- Other Settings ...
--       procMacro = {
--         ignored = {
--             leptos_macro = {
--                 -- optional: --
--                 -- "component",
--                 "server",
--             },
--         },
--       },
--     },
--   }
-- }
