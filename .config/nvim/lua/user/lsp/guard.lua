local status_ok, ft = pcall(require, "guard.filetype")
if not status_ok then
	return
end

ft("c"):fmt("clang-format"):lint("clang-tidy")

ft("lua"):fmt("stylua")

ft("python"):fmt("black"):lint("flake8")

-- Call setup() last.
require("guard").setup({
	-- Choose to format on every write to a buffer
	fmt_on_save = true,
	-- Use lsp if no formatter was defined for this filetype
	lsp_as_default_formatter = true,
	-- By default, Guard writes the buffer on every format
	-- You can disable this by setting:
	-- save_on_fmt = false,
})
