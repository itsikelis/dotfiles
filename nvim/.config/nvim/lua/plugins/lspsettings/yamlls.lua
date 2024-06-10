local M = {}

M.settings = {
    yaml = {
        schemas = require("schemastore").yaml.schemas(),
    },
}

M.setup = {
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
            end,
        },
    },
}

return M
