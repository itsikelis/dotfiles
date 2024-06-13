local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-lua/plenary.nvim",
	},
}

M.lsps = {
	"lua_ls",
	"clangd",
	"cmake",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
}

M.extras = {
	-- Formatters
	"stylua",
	"clang-format",
	"black",
	"shfmt",
	-- Linters
	"luacheck",
	"cmakelint",
	-- "flake8",
}

M.linters = {}

function M.config()
	require("mason").setup({
		ui = {
			border = "none",
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	})

	require("mason-lspconfig").setup({
		ensure_installed = M.lsps,
		automatic_installation = true,
	})

	for _, v in ipairs(M.extras) do
		if not require("mason-registry").is_installed(v) then
			local cmd = ":MasonInstall " .. v
			vim.cmd(cmd)
		end
	end
end

return M
