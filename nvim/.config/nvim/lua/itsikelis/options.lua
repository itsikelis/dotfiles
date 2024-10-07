-- Disable Netrw to use NvimTree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Disable optional providers.
vim.g.loaded_ruby_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.lsp.set_log_level("off") -- vim.lsp.set_log_level("debug").

local options = {
    backup = false,                       -- creates a backup file
    clipboard = "unnamedplus",            -- allows neovim to access the system clipboard
    cmdheight = 1,                        -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                     -- so that `` is visible in markdown files
    fileencoding = "utf-8",               -- the encoding written to a file
    hlsearch = true,                      -- highlight all matches on previous search pattern
    ignorecase = true,                    -- ignore case in search patterns
    mouse = "a",                          -- allow the mouse to be used in neovim
    pumheight = 10,                       -- pop up menu height
    showmode = false,                     -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                      -- always show tabs
    smartcase = true,                     -- smart case
    smartindent = true,                   -- make indenting smarter again
    splitbelow = true,                    -- force all horizontal splits to go below current window
    splitright = true,                    -- force all vertical splits to go to the right of current window
    swapfile = false,                     -- creates a swapfile
    termguicolors = true,                 -- set term gui colors (most terminals support this)
    timeoutlen = 1000,                    -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                      -- enable persistent undo
    updatetime = 300,                     -- faster completion (4000ms default)
    expandtab = true,                     -- convert tabs to spaces
    shiftwidth = 4,                       -- the number of spaces inserted for each indentation
    tabstop = 4,                          -- insert 2 spaces for a tab
    cursorline = true,                    -- highlight the current line
    number = true,                        -- set numbered lines
    relativenumber = false,               -- set relative numbered lines
    numberwidth = 2,                      -- set number column width to 2 {default 4}
    signcolumn = "yes",                   -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                         -- display lines as one long line
    scrolloff = 8,                        -- is one of my fav
    sidescrolloff = 8,
    guifont = "monospace:h17",            -- the font used in graphical neovim applications
    whichwrap = "<,>,[,],h,l",            -- move to next/prev line if the cursor is at the last/first line character
}

vim.opt.shortmess:append("cI")

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
