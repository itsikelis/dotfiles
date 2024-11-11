local function lsp_keymaps()
    vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = 'Go To Declaration', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lF', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>', { desc = 'Format Document', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lI', '<cmd>LspInfo<cr>', { desc = 'Lsp Info', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename Current', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code Action', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go To Definition', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show Diagnostics Float', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Open Hover', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Go To Implementation', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>', { desc = 'Go To Next Diagnostic', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>', { desc = 'Go To Previous Diagnostic', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Show References', noremap = true, silent = true })
end

local function pumvisible()
    return tonumber(vim.fn.pumvisible()) ~= 0
end

---For replacing certain <C-x>... keymaps.
---@param keys string
local function feedkeys(keys)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
end

local function on_attach(_, bufnr)
    lsp_keymaps()

    -- Built-in completion
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
        if client.supports_method('completion') then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

            -- Use enter to accept completions.
            vim.keymap.set('i', '<CR>', function()
                return pumvisible() and '<C-y>' or '<CR>'
            end, { expr = true, desc = 'Accept completion', buffer = bufnr, noremap = true, silent = true })

            -- -- Use slash to dismiss the completion menu.
            -- keymap('/', function()
            --     return pumvisible() and '<C-e>' or '/'
            -- end, { expr = true }, 'i')

            -- Use <Tab> to navigate to the next completion
            vim.keymap.set('i', '<Tab>', function()
                if pumvisible() then
                    feedkeys('<C-n>')
                else
                    feedkeys('<Tab>')
                end
            end, { desc = 'Select next completion', buffer = bufnr, noremap = true, silent = true })

            -- Use <S-Tab> to navigate to the previous completion
            vim.keymap.set('i', '<S-Tab>', function()
                if pumvisible() then
                    feedkeys('<C-p>')
                else
                    feedkeys('<S-Tab>')
                end
            end, { desc = 'Select previous completion', buffer = bufnr, noremap = true, silent = true })
        end
    end
end

return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
        local lspconfig = require('lspconfig')
        local icons = require('itsikelis.core.icons')

        local signs = {
            { name = 'DiagnosticSignError', text = icons.diagnostics.BoldError },
            { name = 'DiagnosticSignWarn', text = icons.diagnostics.BoldWarning },
            { name = 'DiagnosticSignHint', text = icons.diagnostics.BoldHint },
            { name = 'DiagnosticSignInfo', text = icons.diagnostics.BoldInformation },
        }

        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
        end

        local config = {
            virtual_text = false, -- disable virtual text
            signs = {
                active = signs, -- show signs
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = true,
                style = 'minimal',
                border = 'none',
                source = 'always',
                header = '',
                prefix = '',
            },
        }

        vim.diagnostic.config(config)

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'none' })
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'none' })
        require('lspconfig.ui.windows').default_options.border = 'none'

        ---------------------
        --- Server Setups ---
        ---------------------

        -- bashls
        lspconfig.bashls.setup({ on_attach = on_attach })

        -- cmake
        lspconfig.cmake.setup({ on_attach = on_attach })

        -- basedpyright
        lspconfig.basedpyright.setup({ on_attach = on_attach })

        -- clangd
        lspconfig.clangd.setup({
            cmd = {
                'clangd',
                '--compile-commands-dir=build',
                '--header-insertion=never',
                '--clang-tidy',
                -- "--function-arg-placeholders=0",
                '--completion-style=bundled',
                '--offset-encoding=utf-16',
            },
            on_attach = on_attach,
        })

        -- lua_ls
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    format = {
                        enable = true,
                    },
                    diagnostics = {
                        globals = { 'vim', 'spec' },
                    },
                    runtime = {
                        version = 'LuaJIT',
                    },
                },
            },
            on_attach = on_attach,
        })
    end,
}
