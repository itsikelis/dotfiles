local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
}

function M.config()
    require("nvim-autopairs").setup({
        check_ts = true, -- Check for treesitter.
        -- ts_config = {
        -- 	lua = { "string", "source" },
        -- 	javascript = { "string", "template_string" },
        -- 	java = false,
        -- },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        disable_in_macro = true,  -- Disable when recording or executing a macro.
        disable_in_visualblock = false, -- Disable when insert after visual block mode.
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true,   -- Add bracket pairs after quote.
        enable_check_bracket_line = true, -- Check bracket in same line.
        enable_bracket_in_quote = true, --
        enable_abbr = false,        -- Trigger abbreviation.
        break_undo = true,          -- Switch for basic rule break undo sequence.
        map_cr = true,
        map_bs = true,              -- Map the <BS> key.
        map_c_h = false,            -- Map the <C-h> key to delete a pair.
        map_c_w = false,            -- map <c-w> to delete a pair if possible.
    })

    -- Map <cr> to indent and place leading delimiter in newline after completion.
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
        return
    end

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

return M
