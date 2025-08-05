return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { desc = "Telescope help tags" })
	end,
}
