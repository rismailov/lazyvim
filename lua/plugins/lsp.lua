return {
    -- Completion
    {
        "hrsh7th/nvim-cmp",
        opts = {
            experimental = {
                ghost_text = false,
            },
        },
    },
    -- Mason
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "prettierd" },
        },
    },
    -- Mason LSP Config (helps to bridge the gap between Mason and LSP)
    -- Github repo:
    -- https://github.com/williamboman/mason-lspconfig.nvim
    -- Mappings:
    -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
    -- Great video to refresh memory regarding what is Mason and how it works:
    -- https://www.youtube.com/watch?v=UVcC5ifbXL8
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "cssls",
                "css_variables",
                "html",
                "jsonls",
            },
        },
        config = function()
            require("mason-lspconfig").setup()

            -- See :h mason-lspconfig.setup_handlers()
            require("mason-lspconfig").setup_handlers({
                -- NOTE: The docs regarding the callback below are misleading.
                -- NOTE: The callback below is not optional! Don't remove it.
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                ["cssls"] = function()
                    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.completion.completionItem.snippetSupport = true

                    require("lspconfig").cssls.setup({
                        capabilities = capabilities,
                        init_options = {
                            provideFormatter = false,
                        },
                    })
                end,

                -- Next, you can provide targeted overrides for specific servers.
                ["css_variables"] = function()
                    require("lspconfig").css_variables.setup({
                        settings = {
                            cssVariables = {
                                lookupFiles = {
                                    "**/*.less",
                                    "**/*.scss",
                                    "**/*.sass",
                                    "**/*.css",
                                    -- https://mantine.dev/getting-started/#set-up-vs-code
                                    -- https://github.com/vunguyentuan/vscode-css-variables?tab=readme-ov-file#i-want-to-add-files-in-node_modules-folder
                                    "node_modules/@mantine/core/styles.css",
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        -- disable <C-k> shortcut in favor of navigating forward through snippets
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()

            -- need to explicitly specify mode if shortcut is not binded to "normal mode"
            -- https://github.com/LazyVim/LazyVim/discussions/266
            keys[#keys + 1] = { "<C-k>", false, mode = "i" }
        end,
        opts = {
            -- disable inlay hints
            inlay_hints = {
                enabled = false,
            },

            setup = {
                -- disable formatting from vtsls
                vtsls = function()
                    require("lazyvim.util").lsp.on_attach(function(client)
                        if client.name == "vtsls" then
                            client.server_capabilities.documentFormattingProvider = false
                        end
                    end)
                end,

                -- disable formatting from eslint
                -- eslint = function()
                --     -- require("lazyvim.util").lsp.on_attach(function(client)
                --     --     if client.name == "eslint" then
                --     --         client.server_capabilities.documentFormattingProvider = false
                --     --     end
                --     -- end)
                -- end,
            },
        },
    },
}
