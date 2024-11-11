local opt = vim.opt

-- operational
opt.backup = false                          -- creates a backup file
opt.undofile = true                         -- enable persistent undo
opt.clipboard = 'unnamedplus'               -- allows neovim to access the system clipboard
opt.completeopt = { 'menuone', 'noselect' } -- mostly just for cmp
opt.fileencoding = 'utf-8'                  -- the encoding written to a file
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.swapfile = false                        -- creates a swapfile
opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.whichwrap = '<,>,[,],h,l'               -- move to next/prev line if the cursor is at the last/first line character
opt.backspace = 'indent,eol,start'          -- allow backspace on indent, eol, start

-- splitting
opt.splitbelow = true -- force all horizontal splits to go below the current window
opt.splitright = true -- force all vertical splits to go right of the current window

-- gui
opt.mouse = 'a'               -- allow the mouse to be used in neovim
opt.background = 'dark'       -- set dar background
opt.cmdheight = 1             -- height of neovim command line
opt.pumheight = 10            -- pop up menu height
opt.showmode = false          -- show or not show current mode
opt.termguicolors = true      -- set term gui colors
opt.guifont = 'monospace:h17' -- the font used in graphical neovim applications
opt.numberwidth = 2           -- set number column width to 2 {default 4}
opt.number = true             -- set numbered lines
opt.cursorline = true         -- highlight the current line
opt.relativenumber = false    -- set relative numbered lines
opt.signcolumn = 'yes'        -- always show the sign column, otherwise it would shift the text each time
opt.scrolloff = 10            -- number of rows to keep above and below the cursor
opt.sidescrolloff = 10        -- number of columns to keep above and below the cursor

-- text
opt.wrap = false     -- display lines as one long line
opt.conceallevel = 0 -- so that `` is visible in markdown files

-- tabs & indentation
opt.showtabline = 2    -- always show tabs
opt.shiftwidth = 4     -- the number of spaces inserted for each indentation
opt.tabstop = 4        -- insert 2 spaces for a tab
opt.smartindent = true -- make indenting smarter again
opt.expandtab = true   -- convert tabs to spaces

-- search
opt.hlsearch = true            -- highlight all matches on previous search pattern
opt.ignorecase = true          -- ignore case in search patterns
opt.smartcase = true           -- smart case tunrs to case sensitive if mixed case is detected in search pattern

vim.opt.shortmess:append('cI') -- c: don't give ins-completion-menu messages, I: don't give the intro message when starting Vim

local icons = require('itsikelis.core.icons')
vim.cmd('set list listchars=multispace:\\ \\ \\ \\' .. icons.ui.LineIndentDotted .. ',eol:' .. icons.ui.ArrowDownLeft)
