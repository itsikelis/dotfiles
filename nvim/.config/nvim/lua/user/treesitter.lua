local ts_configs_status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not ts_configs_status_ok then
	return
end

ts_configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" }, -- Always install "c", "lua", "vim", "vimdoc", "query" .
	sync_install = false, -- Install parsers synchronously
	auto_install = true, -- Automatically install missing parsers when entering buffer
	ignore_install = { "" }, -- List of parsers to ignore installing (or "all")
	indent = { enable = false, disable = { "yaml" } }, -- Disable aut-indent for yaml.
	-- Text highlighting.
	highlight = {
		enable = true, -- Enable text highlighting.
		additional_vim_regex_highlighting = false, -- Disable vim regex highlighting
	},
	-- Enable autopair completion (with autopairs plugin).
	autopairs = {
		enable = true,
	},
	-- Enable line and block comments.
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
