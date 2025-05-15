return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file" })
	end,
}
