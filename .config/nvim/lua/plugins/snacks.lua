return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
				-- {
				-- 	section = "terminal",
				-- 	-- cmd = "chafa ~/Downloads/ayanami.jpg --format symbols --symbols vhalf --size 50x50",
				-- 	cmd = "ascii-image-converter ~/Downloads/ayanami.jpg -C -c",
				--                 -- random = 10,
				--                 pane = 2,
				--                 indent = 4,
				-- 	heigth = 30,
				-- },
			},
		},
		picker = {
			hidden = true,
			ignored = true,
		},
		explorer = {
			enabled = true,
			hidden = true,
			ignored = true,
			layout = {
				cycle = false,
			},
		},
	},
	keys = {
		{
			"<leader>th",
			function()
				require("snacks").picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>n",
			function()
				require("snacks").explorer()
			end,
			desc = "File Explorer",
		},
	},
}
