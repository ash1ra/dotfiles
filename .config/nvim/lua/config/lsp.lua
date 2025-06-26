vim.lsp.enable({
	"css_variables",
	"cssls",
	"cssmodules_ls",
	"html",
	"lua_ls",
	"oxlint",
	"pyright",
	"ruff",
	-- "ty",
})

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
