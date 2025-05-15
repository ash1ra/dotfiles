return {
	"saghen/blink.cmp",
	-- dependencies = "rafamadriz/friendly-snippets",
	version = "1.*",
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			use_nvim_cmp_as_default = true,
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
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
