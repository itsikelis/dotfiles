return {
    'mbbill/undotree',
    event = 'VeryLazy',
    config = function()
        vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr><C-w><C-w><CR>', { desc = 'Toggle undotree', noremap = true, silent = true })
    end,
}
