return {
    {
        "frabjous/knap",
        lazy = false,
        config = function()
            -- Configure KNAP settings
            vim.g.knap_settings = {
                -- Markdown settings
                mdoutputext = "pdf",
                mdtopdf = "pandoc -o %outputfile% --pdf-engine=xelatex",
                mdtopdfviewerlaunch = "zathura %outputfile%",
                mdtopdfviewerrefresh = "kill -HUP %pid%",
                mdtopdfbufferasstdin = true,

                -- LaTeX settings
                texoutputext = "pdf",
                textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
                textopdfviewerlaunch = "zathura %outputfile%",
                textopdfviewerrefresh = "kill -HUP %pid%",
            }

            -- Set up keymappings for all markdown files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "markdown", "pandoc", "md", "tex" },
                callback = function()
                    vim.keymap.set("n", "<leader>pv", function()
                        require("knap").toggle_autopreviewing()
                    end, { buffer = true, desc = "KNAP toggle auto-preview" })
                end,
            })
        end,
    },
}
