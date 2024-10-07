local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
}

local function lsp_keymaps(bufnr)
    require("which-key").register({
        ["<leader>"] = {
            l = {
                D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
                F = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format Document" },
                I = { "<cmd>LspInfo<cr>", "Lsp Info" },
                R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Current" },
                a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Definition" },
                f = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show Diagnostics Float" },
                h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Open Hover" },
                i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
                j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Go To Next Diagnostic" },
                k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Go To Previous Diagnostic" },
                name = "+Language Server",
                r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show References" },
            },
        },
        buffer = bufnr,
        expr = false,
        mode = "n",
        noremap = true,
        nowait = false,
        prefix = "",
        silent = true,
    })
end

local on_attach = function(_, bufnr)
    lsp_keymaps(bufnr)
end

local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.completion.completionItem.snippetSupport = true
caps = require("cmp_nvim_lsp").default_capabilities(caps)

function M.config()
    local lspconfig = require("lspconfig")
    local icons = require("itsikelis.icons")

    local signs = {
        { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
        { name = "DiagnosticSignWarn",  text = icons.diagnostics.BoldWarning },
        { name = "DiagnosticSignHint",  text = icons.diagnostics.BoldHint },
        { name = "DiagnosticSignInfo",  text = icons.diagnostics.BoldInformation },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = false, -- disable virtual text
        signs = {
            active = signs, -- show signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "none",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "none" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "none" })
    require("lspconfig.ui.windows").default_options.border = "none"

    local servers = {
        "lua_ls",
        "clangd",
        -- "ccls",
        "cmake",
        "pyright",
        "bashls",
        "html",
        -- "dockerls",
        -- "jsonls",
        -- "yamlls",
    }

    for _, server in pairs(servers) do
        local opts = {
            on_attach = on_attach,
            -- capabilities = caps,
        }

        local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
        if require_ok then
            -- print("Loaded settings for " .. server)
            -- print(vim.inspect(settings))

            opts = vim.tbl_deep_extend("force", opts, settings)
        end

        -- print("Final options for " .. server)
        -- print(vim.inspect(opts))

        lspconfig[server].setup(opts)
    end
end

return M
