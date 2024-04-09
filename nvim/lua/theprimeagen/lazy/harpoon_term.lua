local function term_select(list_item, list, options)
    local Extensions = require("harpoon.extensions")
    local Logger = require("harpoon.logger")

    Logger:log(
        "term_config#select",
        list_item,
        list.name,
        options
    )

    options = options or {}

    if list_item == nil then
        vim.cmd("terminal")
        vim.cmd("norm G")
        require("harpoon"):list("term"):add()
        return
    end

    local bufnr = vim.fn.bufnr(list_item.value)
    local set_position = false

    if bufnr == -1 then
        set_position = true
        bufnr = vim.fn.bufnr(list_item.value, true)
    end

    if not vim.api.nvim_buf_is_loaded(bufnr) then
        vim.fn.bufload(bufnr)
        vim.api.nvim_set_option_value("buflisted", true, {buf = bufnr})
    end

    -- Check if the buffer is empty or invalid before setting the cursor position
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    if line_count == 0 then
        -- Buffer is empty or invalid, open a new terminal
        vim.cmd("terminal")
        vim.cmd("norm G")
        require("harpoon"):list("term"):append()
        return
    end

    if options.vsplit then
        vim.cmd("vsplit")
    elseif options.split then
        vim.cmd("split")
    elseif options.tabedit then
        vim.cmd("tabedit")
    end

    vim.api.nvim_set_current_buf(bufnr)

    if set_position then
        -- Ensure the cursor position is within the buffer's range
        local cursor_row = math.min(list_item.context.row or 1, line_count)
        local cursor_col = list_item.context.col or 0
        vim.api.nvim_win_set_cursor(0, {cursor_row, cursor_col})
    end

    Extensions.extensions:emit(Extensions.event_names.NAVIGATE, {buffer = bufnr})
    vim.cmd("norm G")  -- Scroll to the bottom of the terminal
end

return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    opts = {
        term = {
            select_with_nil = true,
            encode = false,
            select = term_select,
        }
    },
    keys = {
        {
            "<leader>th",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list("term"))
            end,
            desc = "opens harpoon's list of terminal buffers"
        },
        {
            "<leader>t1",
            function() require("harpoon"):list("term"):select(1) end,
            desc = "selects first buffer in harpoon term list"
        },
        {
            "<leader>t2",
            function() require("harpoon"):list("term"):select(2) end,
            desc = "selects second buffer in harpoon term list"
        },
        {
            "<leader>t3",
            function() require("harpoon"):list("term"):select(3) end,
            desc = "selects third buffer in harpoon term list"
        },
        {
            "<leader>t4",
            function() require("harpoon"):list("term"):select(4) end,
            desc = "selects fourth buffer in harpoon term list"
        }
    }
}
