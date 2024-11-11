return {
    'nvimtools/none-ls.nvim',
    config = function()
        local none_ls = require('null-ls')

        local formatting = none_ls.builtins.formatting
        local diagnostics = none_ls.builtins.diagnostics
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

        none_ls.setup({
            debug = true,
            sources = {
                -- Lua
                formatting.stylua,
                -- C/C++
                formatting.clang_format,
                -- CMake
                -- formatting.cmake_format,
                -- diagnostics.cmake_lint,
                -- Python
                formatting.black,
                -- Bash
                formatting.shfmt,
                -- Extras
                -- none_ls.builtins.completion.spell,
            },
            -- Format on write.
            on_attach = function(client, bufnr)
                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}
