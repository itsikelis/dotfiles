local M = {}

M.settings = {
    cmd = {
        "clangd",
        "--compile-commands-dir=build",
        "--header-insertion=never",
        "--clang-tidy",
        --    "--function-arg-placeholders",
        --    "--completion-style=bundled",
        -- "--background-index",
        -- "--fallback-style=llvm",
    },
}

return M
