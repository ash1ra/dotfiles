return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"shfmt",
			},
			automatic_installation = true,
		})

		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettier.with({ filetypes = { "json", "markdown" } }),
				formatting.shfmt.with({ args = { "-i", "4" } }),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
	end,
}
