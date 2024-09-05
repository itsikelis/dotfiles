local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.add({
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<cr>",
			desc = "Toggle File Tree",
			expr = false,
			nowait = false,
			remap = false,
		},
	})

	require("nvim-tree").setup({
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		renderer = {
			root_folder_modifier = ":t",
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						untracked = "U",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		view = {
			width = 30,
			side = "left",
		},
	})
end

return M
