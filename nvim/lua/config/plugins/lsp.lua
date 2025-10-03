return {
    {
        'VonHeikemen/lsp-zero.nvim',
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'VonHeikemen/lsp-zero.nvim',
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                    pyright = function()
                        local lspconfig = require('lspconfig')
                        local util = require('lspconfig.util')

                        -- Find project root based on .git marker
                        local root_dir = util.root_pattern('.git')(vim.fn.bufname())

                        -- Default to system python (pacman's installation)
                        local python_path = '/usr/bin/python3'

                        -- If a root is found and it contains a .venv, use it instead
                        if root_dir and vim.fn.isdirectory(root_dir .. '/.venv') then
                            print("Project .venv found. Using: " .. root_dir .. '/.venv/bin/python')
                            python_path = root_dir .. '/.venv/bin/python'
                        else
                            print("No project .venv found. Falling back to system Python.")
                        end

                        -- Setup pyright with our dynamic python path and on_attach function
                        lspconfig.pyright.setup({
                            on_attach = on_attach,
                            settings = {
                                python = {
                                    pythonPath = python_path,
                                }
                            }
                        })
                    end,
                }
            })
        end
    },
}
