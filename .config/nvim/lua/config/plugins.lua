vim.pack.add({
	{ src = "https://github.com/metalelf0/black-metal-theme-neovim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

vim.cmd("colorscheme darkthrone")

require("mason").setup()
