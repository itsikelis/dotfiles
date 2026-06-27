-- Highlight on yank
local yank_highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_highlight_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Remove spaces at eol
local daniel_save_group = vim.api.nvim_create_augroup("MyOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = daniel_save_group,
	pattern = "*",
	callback = function()
		local _, lnum, col, _, _ = unpack(vim.fn.getcursorcharpos())
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setcursorcharpos({ lnum, col })
	end,
})

-- Spell check in text filetypes
local my_filetype_group = vim.api.nvim_create_augroup("MyFiletype", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = my_filetype_group,
	pattern = { "gitcommit", "markdown", "tex", "latex" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

-- Compile latex on save
local latex_compile_group = vim.api.nvim_create_augroup("LatexCompile", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = latex_compile_group,
	pattern = "*.tex",
	callback = function()
		local file = vim.fn.expand("%")
		vim.fn.jobstart({ "latexmk", "-pdf", "-aux-directory=aux", "-interaction=nonstopmode", "main.tex" }, {
			on_exit = function(_, code)
				if code == 0 then
					print("Compilation successful!")
				else
					print("Compilation failed with code " .. code)
				end
			end,
		})
	end,
})
