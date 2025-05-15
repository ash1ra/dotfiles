return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.keymap.set("n", "c-h", ":TmuxNavigateLeft<CR>")
		vim.keymap.set("n", "c-j", ":TmuxNavigateDown<CR>")
		vim.keymap.set("n", "c-k", ":TmuxNavigateUp<CR>")
		vim.keymap.set("n", "c-l", ":TmuxNavigateRight<CR>")
	end,
}
