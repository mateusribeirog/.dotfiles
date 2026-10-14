return {
    {
        "frabjous/knap",
        lazy = false,
        config = function()
            local is_mac = vim.fn.has("macunix") == 1

            local pdf_viewer = is_mac
                and "open -a Skim %outputfile%"
                or "zathura %outputfile%"

            local pdf_refresh = is_mac
                and ""
                or "kill -HUP %pid%"

            vim.g.knap_settings = {
                -- Markdown
                mdoutputext = "pdf",
                mdtopdf = "pandoc -o %outputfile% --pdf-engine=xelatex",
                mdtopdfviewerlaunch = pdf_viewer,
                mdtopdfviewerrefresh = pdf_refresh,
                mdtopdfbufferasstdin = true,

                -- LaTeX
                texoutputext = "pdf",
                textopdf = "latexmk -pdf -synctex=1 -interaction=nonstopmode %docroot%",
                textopdfviewerlaunch = pdf_viewer,
                textopdfviewerrefresh = pdf_refresh,
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "markdown", "pandoc", "tex" },
                callback = function()
                    vim.keymap.set("n", "<leader>pv", function()
                        require("knap").toggle_autopreviewing()
                    end, {
                        buffer = true,
                        desc = "Toggle KNAP auto-preview",
                    })
                end,
            })
        end,
    },

    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        opts = {},
    },
}
