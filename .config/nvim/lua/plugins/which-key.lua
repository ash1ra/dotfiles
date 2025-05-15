return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
	},
	config = function()
		vim.keymap.set("n", "<leader>wk", function()
			require("which-key").show({ global = false })
		end, { desc = "Buffer Local Keymaps (which-key)" })
	end,
}
