return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        -- Set keymaps
        vim.keymap.set('n', '<leader>tf', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy())<CR>", { desc = 'Telescope find files', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>tg', '<cmd>Telescope live_grep<CR>', { desc = 'Telescope live grep', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>tb', "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", { desc = 'Telescope buffers', noremap = true, silent = true })

        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local icons = require('itsikelis.core.icons')

        telescope.setup({
            defaults = {
                prompt_prefix = icons.misc.Telescope,
                path_display = { 'smart' },
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,
                    },
                },
            },
        })

        telescope.load_extension('fzf')
    end,
}
