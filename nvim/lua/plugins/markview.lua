return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        heading = {
            render_modes = false,
            atx = true,
            setext = true,
            sign = true,
            icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
            position = 'overlay',
            signs = { '󰫎 ' },
            width = 'block',
            left_margin = 0,
            left_pad = 0,
            right_pad = 2,
            above = '▄',
            below = '▀',
            backgrounds = {
                'NoiceFormatProgressDone',
                'RenderMarkdownH2Bg',
                'RenderMarkdownH4Bg',
                'RenderMarkdownH5Bg',
                'RenderMarkdownH6Bg',
                'RedrawDebugRecompose',
            },
        },
    },
}
