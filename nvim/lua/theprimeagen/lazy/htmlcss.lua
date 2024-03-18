return {

    {
        "hrsh7th/nvim-cmp",
        opts = {
            sources = {
                -- other sources
                {
                    name = "html-css",
                    option = {
                        max_count = {}, -- not ready yet
                        enable_on = {
                            "html", "css", "scss", "less", "sass", "vue", "javascript", "typescript", "javascriptreact",
                            "typescriptreact",
                        },                       -- set the file types you want the plugin to work on
                        file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
                        style_sheets = {
                            -- example of remote styles, only css no js for now
                            "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js",
                            "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
                        }
                    }
                },
            },
        },
    },
    {
        "Jezda1337/nvim-html-css",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("html-css"):setup()
        end
    },
}
