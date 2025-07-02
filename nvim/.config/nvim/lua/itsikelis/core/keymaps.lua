-- Remove ovelappring keymaps (Because which-key does not like gc[motion] and gcc together)
-- vim.keymap.del("n", "gc")

-- Shorten function name.
local keymap = vim.keymap

-- Remap space as leader key.
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes:
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-------------------
--- Normal Mode ---
-------------------
-- Buffers
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close buffer', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer', noremap = true, silent = true })

-- Resize with arrows.
vim.keymap.set('n', '<A-Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Better window navigation.
-- vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Focus left window', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Focus lower window', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Focus upper window', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Focus right window', noremap = true, silent = true })

-- Window management
-- vim.keymap.set('n', '<leader>wv', '<C-w>v<CR>', { desc = 'Split window vertically', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>ws', '<C-w>s<CR>', { desc = 'Split window horizontally', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>w=', '<C-w>=<CR>', { desc = 'Make splits equal size', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>wq', '<C-w>q<CR>', { desc = 'Quit current window', noremap = true, silent = true })

-- Stop highlighting searched text when <ESC> is pressed.
vim.keymap.set('n', '<ESC>', ':noh<CR>:<C-u>stopinsert<CR>', { noremap = true, silent = true })

-------------------
--- Visual Mode ---
-------------------
-- Pefrorm continuous indentations.
vim.keymap.set('v', '>', '>gv', { desc = 'Indent', noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { desc = 'Unindent', noremap = true, silent = true })

-- Move text up and down.
vim.keymap.set('v', '<C-j>', ':m .+1<CR>==', { desc = 'Move text up', noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', ':m .-2<CR>==', { desc = 'Move text down', noremap = true, silent = true })

-- Paste without yanking selected text.
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste over selection', noremap = true, silent = true })

-------------------------
--- Visual Block Mode ---
-------------------------
-- Move text up and down.
vim.keymap.set('x', '<C-j>', ":move '>+1<CR>gv-gv", { desc = 'Move text up', noremap = true, silent = true })
vim.keymap.set('x', '<C-k>', ":move '<-2<CR>gv-gv", { desc = 'Move text down', noremap = true, silent = true })

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
