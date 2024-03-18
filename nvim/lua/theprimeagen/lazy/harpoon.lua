return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        settings = {
            save_on_toggle = true
        },
    },

    keys = {
        {
            "<leader>lh",
            function() require("harpoon").logger:show() end,
            desc = "shows harpoon logger"
        },
        {
            "<leader>a",
            function() require("harpoon"):list():append() end,
            desc = "appends currently focused buffer to harpoon list"
        },
        {
            "<leader>e",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "opens harpoon's list of buffers"
        },
        {
            "<M-q>",
            function() require("harpoon"):list():prev() end,
            desc = "selects the previous buffer in harpoon list"
        },
        {
            "<M-e>",
            function() require("harpoon"):list():next() end,
            desc = "selects the next buffer in harpoon list"
        },
        {
            "<M-1>",
            function() require("harpoon"):list():select(1) end,
            desc = "selects first buffer in harpoon list"
        },
        {
            "<M-2>",
            function() require("harpoon"):list():select(2) end,
            desc = "selects second buffer in harpoon list"
        },
        {
            "<M-3>",
            function() require("harpoon"):list():select(3) end,
            desc = "selects third buffer in harpoon list"
        },
        {
            "<M-4>",
            function() require("harpoon"):list():select(4) end,
            desc = "selects fourth buffer in harpoon list"
        },
        {
            "<M-5>",
            function() require("harpoon"):list():select(5) end,
            desc = "selects fifth buffer in harpoon list"
        },
        {
            "<M-6>",
            function() require("harpoon"):list():select(6) end,
            desc = "selects sixth buffer in harpoon list"
        },
        {
            "<M-7>",
            function() require("harpoon"):list():select(7) end,
            desc = "selects seventh buffer in harpoon list"
        },
        {
            "<M-8>",
            function() require("harpoon"):list():select(8) end,
            desc = "selects eighth buffer in harpoon list"
        },
        {
            "<M-9>",
            function() require("harpoon"):list():select(9) end,
            desc = "selects ninth buffer in harpoon list"
        }
    }
}
