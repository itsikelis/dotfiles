local M = {
	"lewis6991/gitsigns.nvim",
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
		["<leader>"] = {
			g = {
				name = "+Gitsigns",
				d = { "<cmd>Gitsigns diffthis<CR>", "Open Diff View" },
				r = { "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
				s = { "<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },

				j = { "<cmd>Gitsigns next_hunk<CR>", "Go To Next Hunk" },
				p = { "<cmd>Gitsigns prev_hunk<CR>", "Go To Previous Hunk" },

				S = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
				U = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Unstage Hunk" },
				R = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
			},
		},
	}

	require("which-key").register(mappings, opts)

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
