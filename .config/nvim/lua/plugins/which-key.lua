return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>wk",
			function()
				require("which-key").show({ global = false })
			end,
			mode = { "n" },
			desc = "Buffer local keymaps (which-key)",
		},
	},
	opts = {
		preset = "modern",
	},
}
