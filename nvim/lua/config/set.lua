-- vim.o.guicursor =
--     "n-v-c-sm:block-blinkwait175-blinkon175-blinkoff150," ..
--     "i-ci-ve:ver25-blinkwait175-blinkon175-blinkoff150," ..
--     --"i-ci-ve:block-blinkwait175-blinkon175-blinkoff150," ..
--     "r-cr-o:hor20"

vim.o.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.winborder = "rounded"
vim.o.cindent = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.scrolloff = 8

-- Give more space for displaying messages.
vim.opt.cmdheight = 1
vim.opt.wrap = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
vim.opt.termguicolors = true
--vim.opt.winblend = 0
vim.opt.laststatus = 2
vim.opt.background = 'dark'
--vim.opt.fillchars = {
--    stl = "─"
--}
vim.opt.guifont = "JetBrainsMono Nerd Font"

vim.filetype.add({
    filename = {
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
    },
})
