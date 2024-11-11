local M = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
        vim.keymap.set('n', '<leader>gR', '<cmd>Gitsigns reset_hunk<cr>', { desc = 'Gitsigns reset hunk', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gS', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Gitsigns stage hunk', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gU', '<cmd>Gitsigns undo_stage_hunk<cr>', { desc = 'Gitsigns undo stage hunk', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>', { desc = 'Gitsigns open diff', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gj', '<cmd>Gitsigns next_hunk<CR>', { desc = 'Gitsigns next hunk', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<CR>', { desc = 'Gitsigns previous hunk', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gr', '<cmd>Gitsigns reset_buffer<CR>', { desc = 'Gitsigns reset buffer', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gs', '<cmd>Gitsigns stage_buffer<CR>', { desc = 'Gitsigns stage buffer', noremap = true, silent = true })

        require('gitsigns').setup({
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '󰐊' },
                topdelete = { text = '󰐊' },
                changedelete = { text = '▎' },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 50,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'none',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1,
            },
        })
    end,
}

return M
