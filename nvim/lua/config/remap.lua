local map = vim.keymap.set
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")

--lsp
map('n', 'K', function()
    vim.lsp.buf.hover {
        border = "solid",
        title = " 󰈙 Documentation "
    }
end
, noremap)
map('n', 'gd', vim.lsp.buf.definition, noremap)
map('n', 'gD', vim.lsp.buf.declaration, noremap)
map('n', 'gi', vim.lsp.buf.implementation, noremap)
map('n', '<leader>ca', vim.lsp.buf.code_action, noremap)
map('n', '<leader>vr', vim.lsp.buf.references, noremap)
map('n', '<leader>vn', vim.lsp.buf.rename, noremap)
map('n', '<leader>rf', vim.lsp.buf.references, noremap)
--map('n', '<leader>ws', vim.lsp.buf.workspace_symbol)

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
