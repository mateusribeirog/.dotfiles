function ColorMyPencils(color)
    color = color or "vague"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(1, "NormalFloat", { bg = "none" })
end

return {
    {
        "Mofiqul/dracula.nvim",
        config = function()
            require("dracula").setup({
                transparent_bg = true,
            })
            ColorMyPencils()
        end,
    },
    {
        "erikbackman/brightburn.vim",
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
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
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
            ColorMyPencils()
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                    transparency = true,
                },
            })
            ColorMyPencils()
        end
    },
    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("black-metal").setup({
                -- optional configuration here
                theme = "taake",
                variant = "dark",
                transparent = true,
                code_style = {
                    comments = "none",
                    conditionals = "none",
                    functions = "none",
                    keywords = "none",
                    headings = "none", -- Markdown headings
                    operators = "none",
                    keyword_return = "none",
                    strings = "none",
                    variables = "none",
                },
            })
            require("black-metal").load()
        end,
    },
    {
        'maxmx03/solarized.nvim',
        opts = {},
        config = function(_, opts)
            require('solarized').setup({
                transparent = {
                    enabled = false,    -- Master switch to enable transparency
                    pmenu = true,       -- Popup menu (e.g., autocomplete suggestions)
                    normal = true,      -- Main editor window background
                    normalfloat = true, -- Floating windows
                    neotree = true,     -- Neo-tree file explorer
                    nvimtree = true,    -- Nvim-tree file explorer
                    whichkey = true,    -- Which-key popup
                    telescope = true,   -- Telescope fuzzy finder
                    lazy = true,        -- Lazy plugin manager UI
                    mason = true,       -- Mason manage external tooling
                },
                palette = 'solarized',
                variant = 'autumn',

            })
            vim.o.background = 'light'
        end,
    },
    {
        "vague-theme/vague.nvim",
        priority = 1000, -- make sure to load this before all the other plugins
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup({
                -- optional configuration here
                require("vague").setup({
                    -- Don't set background
                    transparent = true,
                    -- Disable bold/italic globally
                    bold = false,
                    italic = false,

                    -- Override highlights or add new highlights
                    on_highlights = function(highlights, colors) end,

                    -- Override colors
                    -- colors = {
                    --     bg = "#141415",
                    --     inactiveBg = "#1c1c24",
                    --     fg = "#cdcdcd",
                    --     floatBorder = "#878787",
                    --     line = "#252530",
                    --     comment = "#606079",
                    --     builtin = "#b4d4cf",
                    --     func = "#c48282",
                    --     string = "#e8b589",
                    --     number = "#e0a363",
                    --     property = "#c3c3d5",
                    --     constant = "#aeaed1",
                    --     parameter = "#bb9dbd",
                    --     visual = "#333738",
                    --     error = "#d8647e",
                    --     warning = "#f3be7c",
                    --     hint = "#7e98e8",
                    --     operator = "#90a0b5",
                    --     keyword = "#6e94b2",
                    --     type = "#9bb4bc",
                    --     search = "#405065",
                    --     plus = "#7fa563",
                    --     delta = "#f3be7c",
                    -- },
                })
            })
        end
    }
}
