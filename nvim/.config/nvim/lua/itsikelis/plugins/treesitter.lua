return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "python", "latex" },
			auto_install = true,
			highlight = { enable = true },
			disable = {},
		})
	end,
}
