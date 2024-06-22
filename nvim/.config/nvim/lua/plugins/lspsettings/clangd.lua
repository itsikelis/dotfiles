return {
    cmd = {
        "clangd",
        "--compile-commands-dir=build",
        "--header-insertion=never",
        "--clang-tidy",
        "--function-arg-placeholders=0",
        "--completion-style=bundled",
        "--offset-encoding=utf-16",
        -- "--background-index",
        -- "--fallback-style=llvm",
    },
}
