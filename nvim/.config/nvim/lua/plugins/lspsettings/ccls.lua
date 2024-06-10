local M = {}

M.settings = {
	cmd = {
		"ccls",
		"-v=-3",
	},
	init_options = {
		compilationDatabaseDirectory = "build",
		index = {
			threads = 0,
		},
		clang = {
			excludeArgs = { "-frounding-math" },
		},
	},
}

return M
