return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		local gen_loader = require("mini.snippets").gen_loader

		-- require("mini.snippets").setup({
		-- 	snippets = {
		-- 		-- Load custom file with global snippets first
		-- 		gen_loader.from_file("~/.config/nvim/snippets/global.json"),
		--
		-- 		-- Load snippets based on current language by reading files from
		-- 		-- "snippets/" subdirectories from 'runtimepath' directories.
		-- 		gen_loader.from_lang(),
		-- 	},
		-- })
		require("mini.comment").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup()
		require("mini.surround").setup()
		require("mini.animate").setup()
		require("mini.icons").setup()
		require("mini.fuzzy").setup()
	end,
}
