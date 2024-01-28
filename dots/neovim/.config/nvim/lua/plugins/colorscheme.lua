return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup({
            style = 'storm',
            light_style = 'day',
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be 'dark', 'transparent' or 'normal'
                sidebars = 'dark', -- style for sidebars, see below
                floats = 'dark', -- style for floating windows
            },
            sidebars = { 'qf', 'help' },
            day_brightness = 0.3,
            hide_inactive_statusline = false,
            dim_inactive = true,
            lualine_bold = false,
        })

        vim.cmd[[colorscheme tokyonight]]
    end
}
