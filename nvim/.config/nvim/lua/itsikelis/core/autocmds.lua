-- Highlight on yank
local yank_highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    group = yank_highlight_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Remove spaces at eol
local daniel_save_group = vim.api.nvim_create_augroup('MyOnSave', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    group = daniel_save_group,
    pattern = '*',
    callback = function()
        local _, lnum, col, _, _ = unpack(vim.fn.getcursorcharpos())
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setcursorcharpos({ lnum, col })
    end,
})

-- Spell check in text filetypes
local my_filetype_group = vim.api.nvim_create_augroup('MyFiletype', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = my_filetype_group,
    pattern = { 'gitcommit', 'markdown', 'tex', 'latex' },
    callback = function()
        vim.opt_local.spell = true
    end,
})

local latex_group = vim.api.nvim_create_augroup('LatexBuild', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    group = latex_group,
    pattern = { 'tex', 'latex' },
    callback = function()
        vim.cmd([[!pdflatex -output-directory=build % >/dev/null 2>&1]])
    end,
})
