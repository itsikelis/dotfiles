local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "nvim-lua/plenary.nvim",
    },
}

M.execs = {
    "lua_ls",
    "clangd",
    "cmake",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
}

function M.config()
    require("mason").setup({
        ui = {
            border = "none",
            icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "",
            },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    })

    require("mason-lspconfig").setup({
        ensure_installed = M.execs,
        automatic_installation = true,
    })
end

return M
