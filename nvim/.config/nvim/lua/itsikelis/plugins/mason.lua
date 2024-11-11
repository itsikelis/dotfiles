local lsps = {
    'bashls',
    'basedpyright',
    'cmake',
    'clangd',
    'lua_ls',
}

local extras = {
    -- Formatters
    'stylua',
    'clang-format',
    'black',
    'shfmt',
    -- "prettier",
    -- Linters
    -- "luacheck",
    -- "cmakelint",
    -- "flake8",
}

local linters = {}

return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local icons = require('itsikelis.core.icons')
        require('mason').setup({
            ui = {
                border = 'none',
                icons = {
                    package_installed = icons.mason.Installed,
                    package_pending = icons.mason.Pending,
                    package_uninstalled = icons.mason.Uninstalled,
                },
            },
            log_level = vim.log.levels.INFO,
            max_concurrent_installers = 4,
        })

        require('mason-lspconfig').setup({
            ensure_installed = lsps,
            automatic_installation = true,
        })

        for _, v in ipairs(extras) do
            if not require('mason-registry').is_installed(v) then
                local cmd = ':MasonInstall ' .. v
                vim.cmd(cmd)
            end
        end
    end,
}