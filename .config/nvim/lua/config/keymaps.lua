-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })

-- nvim-tmux-navigator
vim.keymap.set("n", "c-h", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "c-j", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "c-k", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "c-l", ":TmuxNavigateRight<CR>")

-- which-key
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

-- telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { desc = "Telescope help tags" })

-- lsp
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- linter
vim.keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- formatter
vim.keymap.set({ "n", "v" }, "<leader>gf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file" })
