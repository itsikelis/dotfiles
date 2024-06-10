local M = {}

M.settings = {
	Lua = {
		format = {
			enable = true,
		},
		diagnostics = {
			globals = { "vim", "spec" },
		},
		runtime = {
			version = "LuaJIT",
			special = {
				spec = "require",
			},
		},
		workspace = {
			checkThirdParty = false,
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
		hint = {
			enable = false,
			arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
			await = true,
			paramName = "Disable", -- "All" | "Literal" | "Disable"
			paramType = true,
			semicolon = "All", -- "All" | "SameLine" | "Disable"
			setType = false,
		},
		telemetry = {
			enable = false,
		},
	},
}

return M