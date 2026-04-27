return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({})
        require("nvim-treesitter").install({ "c", "python", "lua", "vim", "markdown" })

        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
            },
        })

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

        local group = vim.api.nvim_create_augroup("MateusTreeSitter", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
            group = group,
            callback = function()
                pcall(vim.treesitter.start)
            end
        })
    end
}
