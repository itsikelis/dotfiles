-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Protected call to check if lazy is installed.
local lazy_status_ok, lazy = pcall(require, "lazy")
if not lazy_status_ok then
	return
end

-- Install plugins here.
lazy.setup({
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim.
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins.

	-- File tree plugin.
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
	},

	-- Colourscheme.
	-- { "lunarvim/colorschemes" }, -- A bunch of colourschemes to try out.
	{ "lunarvim/darkplus.nvim", event = "VeryLazy" }, -- Darkplus colourscheme.

	-- Plugins for autocompletion.
	{ "hrsh7th/nvim-cmp", lazy = true }, -- The completion plugin.
	{ "hrsh7th/cmp-buffer", lazy = true }, -- Buffer completions.
	{ "hrsh7th/cmp-path", lazy = true }, -- Path completions.
	{ "hrsh7th/cmp-cmdline", lazy = true }, -- Command line completions.
	{ "saadparwaiz1/cmp_luasnip", lazy = true }, -- Snippet completions.
	{ "hrsh7th/cmp-nvim-lsp", lazy = true }, -- LSP completions.

	-- Snippets for luasnip.
	{ "L3MON4D3/LuaSnip" }, -- Snippet engine.
	{ "rafamadriz/friendly-snippets" }, -- A bunch of useful snippets.

	-- Language Server Protocol.
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = true,
			})
		end,
		lazy = true,
	}, -- Enable LSP.
	{ "williamboman/mason.nvim", lazy = true }, -- Simple to use installer for language servers.
	{ "williamboman/mason-lspconfig.nvim", lazy = true }, -- Integrate mason with nvim-lspconfig.

	-- Guard formatter and linter integration.
	{ "nvimdev/guard.nvim", dependencies = { "nvimdev/guard-collection" } },

	-- Telescope fuzzy finder.
	{ "nvim-telescope/telescope.nvim", event = "VeryLazy" },

	-- Treesitter for syntax highlighting.
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{ "HiPhish/rainbow-delimiters.nvim", event = "VeryLazy" }, -- Colour delimiter pairs.

	-- Comments
	{ "numToStr/Comment.nvim", event = "VeryLazy" }, -- Easily comment stuff.

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Undotree
	{ "mbbill/undotree", event = "VeryLazy" },

	-- Git
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy" },

	-- Bufferline.
	{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- Lualine.
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
})
