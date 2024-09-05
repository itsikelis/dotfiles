local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.add({
		{
			"<leader>g",
			expr = false,
			group = "Gitsigns",
			nowait = false,
			remap = false,
		},
		{
			"<leader>gR",
			"<cmd>Gitsigns reset_hunk<cr>",
			desc = "Reset Hunk",
			expr = false,
			nowait = false,
			remap = false,
		},
		{
			"<leader>gS",
			"<cmd>Gitsigns stage_hunk<cr>",
			desc = "Stage Hunk",
			expr = false,
			nowait = false,
			remap = false,
		},
		{
			"<leader>gU",
			"<cmd>Gitsigns undo_stage_hunk<cr>",
			desc = "Unstage Hunk",
			expr = false,
			nowait = false,
			remap = false,
		},
		{
			"<leader>gd",
			"<cmd>Gitsigns diffthis<CR>",
			desc = "Open Diff View",
			expr = false,
			nowait = false,
			remap = false,
		},
		{
			"<leader>gj",
			"<cmd>Gitsigns next_hunk<CR>",
			desc = "Go To Next Hunk",
			expr = false,
			nowait = false,
			remap = false,
		},
		{
			"<leader>gp",
			"<cmd>Gitsigns prev_hunk<CR>",
			desc = "Go To Previous Hunk",
			expr = false,
			nowait = false,
			remap = false,
		},
		{
			"<leader>gr",
			"<cmd>Gitsigns reset_buffer<CR>",
			desc = "Reset Buffer",
			expr = false,
			nowait = false,
			remap = false,
		},
		{
			"<leader>gs",
			"<cmd>Gitsigns stage_buffer<CR>",
			desc = "Stage Buffer",
			expr = false,
			nowait = false,
			remap = false,
		},
	})

	require("gitsigns").setup({
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "󰐊" },
			topdelete = { text = "󰐊" },
			changedelete = { text = "▎" },
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 50,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = "none",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	})
end

return M
