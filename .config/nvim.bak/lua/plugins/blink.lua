return {
	"saghen/blink.cmp",
	dependencies = "echasnovski/mini.snippets",
	version = "1.*",
	opts = {
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
	},
}
