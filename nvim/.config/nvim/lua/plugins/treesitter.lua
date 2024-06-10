local M = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" }, -- Always install "c", "lua", "vim", "vimdoc", "query" .
        sync_install = false,                                         -- Install parsers synchronously
        auto_install = true,                                          -- Automatically install missing parsers when entering buffer
        ignore_install = { "" },                                      -- List of parsers to ignore installing (or "all")
        indent = { enable = false, disable = { "yaml" } },            -- Disable aut-indent for yaml.
        -- Text highlighting.
        highlight = {
            enable = true,                    -- Enable text highlighting.
            additional_vim_regex_highlighting = false, -- Disable vim regex highlighting
        },
        -- Enable autopair completion (with autopairs plugin).
        autopairs = {
            enable = true,
        },
        -- Enable line and block comments.
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end

return M
