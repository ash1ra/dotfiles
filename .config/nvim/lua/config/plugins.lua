vim.pack.add({
	{ src = "https://github.com/metalelf0/black-metal-theme-neovim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                  version = vim.version.range("^1") },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/toppair/peek.nvim" },
})

-- Colorscheme
vim.cmd("colorscheme darkthrone")

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python" },
	auto_install = true,
	highlight = {
		enable = true,
	}
})

-- LSP
require("mason").setup()

require('blink.cmp').setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = {
		preset = "enter",
		['<C-space>'] = {},
		['<C-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-e>'] = { 'hide', 'fallback' },
		['<CR>'] = { 'accept', 'fallback' },

		['<Tab>'] = { 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'fallback' },

		['<Up>'] = { 'select_prev', 'fallback' },
		['<Down>'] = { 'select_next', 'fallback' },
		['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
		['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

		['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

		['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
	},
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
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

})

-- mini.nvim
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()

-- peek
require('peek').setup({
	auto_load = true,       -- whether to automatically load preview when
	-- entering another markdown buffer
	close_on_bdelete = true, -- close preview window on buffer delete
	syntax = true,          -- enable syntax highlighting, affects performance
	theme = 'dark',         -- 'dark' or 'light'
	update_on_change = true,
	app = 'browser',        -- 'webview', 'browser', string or a table of strings
	filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
	-- relevant if update_on_change is true
	throttle_at = 200000,   -- start throttling when file exceeds this
	-- amount of bytes in size
	throttle_time = 'auto', -- minimum amount of time in milliseconds
	-- that has to pass before starting new render
})

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
