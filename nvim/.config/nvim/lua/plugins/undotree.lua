local M = {
    "mbbill/undotree",
    event = "VeryLazy",
}

function M.config()
    local opts = {
        mode = "n",
        prefix = "",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
        expr = false,
    }

    local mappings = {
        ["<leader>u"] = { "<cmd>UndotreeToggle<cr><C-w><C-w><CR>", "Toggle Undo Tree" },
    }

    require("which-key").register(mappings, opts)
end

return M
