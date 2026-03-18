vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>update <CR> <cmd>source<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>")

--lsp
vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover {
        border = "solid",
        title = " 󰈙 Documentation "
    }
end
, noremap)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, noremap)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, noremap)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, noremap)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, noremap)
vim.keymap.set('n', '<leader>vr', vim.lsp.buf.references, noremap)
vim.keymap.set('n', '<leader>vn', vim.lsp.buf.rename, noremap)
vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, noremap)
--vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol)

--diagnostic
local SHOW_DIAGNOSTICS = true

local function toggle_diag()
    SHOW_DIAGNOSTICS = not SHOW_DIAGNOSTICS
    vim.diagnostic.config({
        underline = true,
        virtual_lines = SHOW_DIAGNOSTICS,
        virtual_text = not SHOW_DIAGNOSTICS,
    })
end

toggle_diag()

vim.keymap.set('n', '<leader>dv', vim.diagnostic.open_float, { noremap = true })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { noremap = true })
vim.keymap.set('n', '<leader>dt', toggle_diag, { noremap = true })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
