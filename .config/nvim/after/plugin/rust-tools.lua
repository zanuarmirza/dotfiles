vim.g.rustaceanvim = {
    inlay_hints = {
        highlight = "NonText",
    },
    tools = {
        -- hover_actions = {
        --     auto_focus = true,
        -- },
    },
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
                procMacro = {
                    ignored = {
                        leptos_macro = {
                            -- optional: --
                            -- "component",
                            "server",
                        },
                    },
                },
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}
