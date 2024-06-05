local servers = {
    "lua_ls",
    "clangd",
    "pyright",
    "bashls",
    "jsonls",
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

-- Ensure opts is initialized before the for loop
local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
}

-- Setting up clangd
lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--compile-commands-dir=build",
        "--header-insertion=never",
        "--clang-tidy",
        "--function-arg-placeholders",
        "--completion-style=bundled",
        -- "--background-index",
        -- "--fallback-style=llvm",
    },
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
}

-- Setting up cmake-language-server
lspconfig.cmake.setup {
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
}

-- lspconfig.ccls.setup {
--     cmd = {
--         "ccls",
--         "-v=-3",
--     },
--     init_options = {
--         compilationDatabaseDirectory = "build",
--         index = {
--             threads = 0,
--         },
--         clang = {
--             excludeArgs = { "-frounding-math" },
--         },
--     }
-- }

-- Setting up other servers
for _, server in ipairs(servers) do
    if server ~= "clangd" then
        local server_opts = vim.tbl_deep_extend("force", {}, opts)

        local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
        if require_ok then
            server_opts = vim.tbl_deep_extend("force", conf_opts, server_opts)
        end

        lspconfig[server].setup(server_opts)
    end
end
