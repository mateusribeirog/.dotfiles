return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    config = function()
        -- Everything goes inside the main nvim-treesitter configs setup block
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "python", "lua", "vim", "markdown" },
            highlight = {
                enable = true,
            },
            --  FIX: textobjects configuration goes HERE, not in its own require().setup()
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can actually map your keys directly here,
                        -- but we will keep your custom vim.keymap.set functions below intact!
                    },
                },
            },
        })

        -- Keymaps (These work great exactly as you wrote them)
        vim.keymap.set({ "x", "o" }, "af", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "if", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ac", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ic", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
        end)

        -- Autocommand for buffer attachment
        local group = vim.api.nvim_create_augroup("MateusTreeSitter", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
            group = group,
            callback = function()
                pcall(vim.treesitter.start)
            end
        })
    end
}
