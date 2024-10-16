return {
    {
        "nvimtools/none-ls.nvim",
        keys = {
            {
                "<leader>f",
                function()
                    vim.lsp.buf.format({ async = true })
                end,
            },
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    -- python formatter
                    -- null_ls.builtins.formatting.black,
                    -- null_ls.builtins.formatting.isort,
                    -- null_ls.builtins.formatting.prettier,
                    -- null_ls.builtins.formatting.pint,
                    -- null_ls.builtins.diagnostics.eslint_d,
                    -- null_ls.builtins.diagnostics.php,
                },
            })
            -- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
