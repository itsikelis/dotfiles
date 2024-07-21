require("itsikelis.options")
require("itsikelis.keymaps")

require("plugins.launch")

-- LSP
spec("plugins.schemastore")
spec("plugins.cmp")
spec("plugins.mason")
spec("plugins.lspconfig")
spec("plugins.null-ls")

-- Core
spec("plugins.treesitter")
spec("plugins.colorscheme")

spec("plugins.nvim-tree")
spec("plugins.bufferline")
spec("plugins.lualine")

spec("plugins.telescope")
spec("plugins.which-key")

-- Extras
spec("plugins.autopairs")
spec("plugins.rainbow-delimiters")
spec("plugins.comment")
spec("plugins.gitsigns")
spec("plugins.undotree")

require("plugins.lazy")
