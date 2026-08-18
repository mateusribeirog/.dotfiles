local default_theme = "rose-pine-moon"

function ColorMyPencils(color)
    color = color or default_theme
    vim.o.background = "dark"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        config = function()
            require("dracula").setup({ transparent_bg = true })
        end,
    },
    { "erikbackman/brightburn.vim" },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "",
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = false,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
        end
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = { italic = false, transparency = true },
            })
        end
    },
    {
        'maxmx03/solarized.nvim',
        priority = 1000,
        opts = {},
        config = function(_, opts)
            -- This ensures that IF you switch to solarized later, it sets light background
            vim.api.nvim_create_autocmd("ColorSchemePre", {
                pattern = "solarized",
                callback = function()
                    vim.o.background = 'light'
                end,
            })
            require('solarized').setup({
                transparent = {
                    enabled = false,
                    pmenu = true,
                    normal = true,
                    normalfloat = true,
                    whichkey = true,
                    telescope = true,
                    lazy = true,
                    mason = true,
                },
                palette = 'solarized',
                variant = 'autumn',
            })
            -- REMOVED: The hardcoded colorscheme activation that was hijacking your setup
        end,
    },
    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("black-metal").setup({
                theme = "taake",
                variant = "dark",
                transparent = true,
                code_style = {
                    comments = "none",
                    conditionals = "none",
                    functions = "none",
                    keywords = "none",
                    headings = "none",
                    operators = "none",
                    keyword_return = "none",
                    strings = "none",
                    variables = "none",
                },
            })
        end,
    },
    {
        "vague-theme/vague.nvim",
        priority = 1000,
        config = function()
            require("vague").setup({
                transparent = true,
                bold = false,
                italic = false,
            })

            -- TRIGGER THE DEFAULT HERE:
            -- Because it's the last plugin block, or handled at the very end of loading
            ColorMyPencils()
        end
    }
}
