return {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = function()
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.netrwPlugin = 1

        -- Set keymaps
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree', noremap = true, silent = true })

        require('nvim-tree').setup({
            view = {
                width = 35,
                side = 'left',
            },
            actions = { open_file = { window_picker = { enable = false } } }, -- disable window picker to work better with window splits
            filters = { custom = { '.git/', 'build' } },
            git = { ignore = false },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        git = {
                            unstaged = '',
                            staged = 'S',
                            unmerged = '',
                            renamed = '➜',
                            untracked = 'U',
                            deleted = '',
                            ignored = '◌',
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
        })
    end,
}
