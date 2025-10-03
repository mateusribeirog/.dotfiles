return {
    'jpalardy/vim-slime',
    init = function()
        vim.g.slime_no_mappings = 1
        vim.g.slime_target = "tmux"
    end,
    config = function()
        vim.g.slime_bracketed_paste = 1
        vim.g.slime_default_config = {
            socket_name = "default", target_pane = "1"
        }
        vim.g.slime_dont_ask_default = 1
        vim.cmd [[vmap <leader>s <Plug>SlimeRegionSend]]

        vim.cmd [[nmap <leader>ss <Plug>SlimeParagraphSend]]
        vim.cmd [[nmap <leader>sl <CMD>SlimeSend<CR>]]
    end
}
