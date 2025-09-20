vim.pack.add({
	{ src = "https://github.com/metalelf0/black-metal-theme-neovim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                  version = vim.version.range("^1") },
})

-- Colorscheme
vim.cmd("colorscheme darkthrone")

-- LSP
require("mason").setup()

require('blink.cmp').setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = { preset = "enter" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
		documentation = {
			auto_show = false,
			auto_show_delay_ms = 0,
		},
	},
	cmdline = {
		enabled = false,
	},
	signature = {
		enabled = true,
	},
	-- snippets = { preset = "mini_snippets" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

})
