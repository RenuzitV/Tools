require('rose-pine').setup({
    -- disable_background = true,
    variant = "moon",
})

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
