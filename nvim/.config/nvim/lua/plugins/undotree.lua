local M = {
	"mbbill/undotree",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.add({
		{
			"<leader>u",
			"<cmd>UndotreeToggle<cr><C-w><C-w><CR>",
			desc = "Toggle Undo Tree",
			expr = false,
			nowait = false,
			remap = false,
		},
	})
end

return M
