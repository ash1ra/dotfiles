return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"stevearc/resession.nvim",
	},
	config = function()
		require("cokeline").setup({
			vim.keymap.set("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)<CR>", { silent = true }),
			vim.keymap.set("n", "<Tab>", "<Plug>(cokeline-focus-next)<CR>", { silent = true }),
			vim.keymap.set("n", "<A-p>", "<Plug>(cokeline-switch-prev)<CR>", { silent = true }),
			vim.keymap.set("n", "<A-n>", "<Plug>(cokeline-switch-next)<CR>", { silent = true }),

			vim.keymap.set("n", "1", "<Plug>(cokeline-focus-1)><CR>", { silent = true }),
			vim.keymap.set("n", "2", "<Plug>(cokeline-focus-2)><CR>", { silent = true }),
			vim.keymap.set("n", "3", "<Plug>(cokeline-focus-3)><CR>", { silent = true }),
			vim.keymap.set("n", "4", "<Plug>(cokeline-focus-4)><CR>", { silent = true }),
			vim.keymap.set("n", "5", "<Plug>(cokeline-focus-5)><CR>", { silent = true }),
			vim.keymap.set("n", "6", "<Plug>(cokeline-focus-6)><CR>", { silent = true }),
			vim.keymap.set("n", "7", "<Plug>(cokeline-focus-7)><CR>", { silent = true }),
			vim.keymap.set("n", "8", "<Plug>(cokeline-focus-8)><CR>", { silent = true }),
			vim.keymap.set("n", "9", "<Plug>(cokeline-focus-9)><CR>", { silent = true }),
			vim.keymap.set("n", "10", "<Plug>(cokeline-focus-10)><CR>", { silent = true }),
		})
	end,
}
