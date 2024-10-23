local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remove ovelappring keymaps (Because which-key does not like gc[motion] and gcc together)
vim.keymap.del("n", "gc")

-- Shorten function name.
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
-- Better window navigation.
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Resize with arrows.
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Stop highlighting searched text when <ESC> is pressed.
keymap("n", "<ESC>", ":noh<CR>:<C-u>stopinsert<CR>", opts)

-------------------
--- Insert Mode ---
-------------------
-- Press jk fast to return to normal mode.
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-------------------
--- Visual Mode ---
-------------------
-- Pefrorm continuous indentations.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down.
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Paste without yanking selected text.
keymap("v", "p", '"_dP', opts)

-------------------------
--- Visual Block Mode ---
-------------------------
-- Move text up and down.
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])

--------------
-- Terminal --
--------------
-- Better terminal navigation.
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
