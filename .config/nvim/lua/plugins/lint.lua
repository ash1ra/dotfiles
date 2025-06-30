return {
	"mfussenegger/nvim-lint",
	keys = {
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
			mode = { "n" },
			desc = "Trigger linting for current file",
		},
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
