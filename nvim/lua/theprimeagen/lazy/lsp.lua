return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- vim.lsp.set_log_level("debug")

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        local util = require('lspconfig.util')
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tsserver",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        root_dir = util.root_pattern('.git'),
                    }
                end,

                -- ["eslint"] = function()
                --     local lspconfig = require("lspconfig")
                --     lspconfig.eslint.setup {
                --         capabilities = capabilities,
                --         on_attach = function(client, bufnr)
                --             vim.api.nvim_create_autocmd("BufWritePre", {
                --                 buffer = bufnr,
                --                 command = "EslintFixAll",
                --             })
                --         end,
                --     }
                -- end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local has_words_before = function()
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            local line = cursor_pos[1]
            local col = cursor_pos[2]
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-e>'] = cmp.mapping.abort(),
                -- ['<Tab>'] = function(fallback)
                --     if vim.fn["copilot#Accept"]() ~= "" then
                --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-R>=copilot#Accept()<CR>", true, true, true),
                --             "")
                --     elseif cmp.visible() then
                --         cmp.select_next_item()
                --     elseif has_words_before() then
                --         cmp.complete()
                --     else
                --         fallback() -- Default <Tab> behavior
                --     end
                -- end,
                ['<Tab>'] = cmp.mapping.confirm({ select = true }), --
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'html-css' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            }),
            foratting = {
                format = function(entry, vim_item)
                    if entry.source.name == "html-css" then
                        vim_item.menu = entry.completion_item.menu
                    end
                    return vim_item
                end
            }
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
