local M = {
    "nvimtools/none-ls.nvim",
}

function M.config()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
        debug = true,
        sources = {
            -- Lua
            formatting.stylua,
            diagnostics.selene,
            -- C/C++
            formatting.clang_format,
            diagnostics.cppcheck,
            -- CMake
            formatting.cmake_format,
            diagnostics.cmake_lint,
            -- Python
            formatting.black,
            diagnostics.pylint,
            -- Bash
            formatting.shfmt,
            -- XML, HTML
            formatting.tidy,
            diagnostics.tidy,

            null_ls.builtins.completion.spell,
        },
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        end,
    })
end

return M
