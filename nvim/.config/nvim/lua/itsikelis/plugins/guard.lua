return {
    'nvimdev/guard.nvim',
    dependencies = {
        'nvimdev/guard-collection',
    },
    config = function()
        ft = require('guard.filetype')
        ft('c'):fmt('clang-format')
        ft('cpp'):fmt('clang-format')
        ft('lua'):fmt('stylua')
        ft('python'):fmt('black')
        vim.g.guard_config = {
            fmt_on_save = true,
            lsp_as_default_formatter = false,
            save_on_fmt = true,
            auto_lint = true,
            lint_interval = 500,
            refresh_diagnostic = true,
        }
    end,
}
