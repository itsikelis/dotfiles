local M = {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy", -- Colour delimiter pairs.
}

function M.config()
	--- type rainbow_delimiters.config
	local rainbow_delimiters = require("rainbow-delimiters")
	vim.g.rainbow_delimiters = {
		strategy = {
			[""] = rainbow_delimiters.strategy["global"],
			vim = rainbow_delimiters.strategy["local"],
		},
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
		},
		priority = {
			[""] = 110,
			lua = 210,
		},
		highlight = {
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
			"RainbowDelimiterRed",
		},
	}
end

return M
