local M = { "smartinellimarco/nvcheatsheet.nvim" }

M.opts = {
	keymaps = {
		["snacks.nvim"] = {
			{ "File explorer", "<leader>n" },
			{ "Colorschemes", "<leader>th" },
		},
		-- ["mini.nvim"] = {},
		["telescope.nvim"] = {
			{ "Find files", "<leader>ff" },
			{ "Live grep", "<leader>fg" },
			{ "Buffers", "<leader>fb" },
			{ "Help tags", "<leader>fh" },
		},
		["which-key.nvim"] = {
			{ "Show keymaps", "<leader>wk" },
		},
		["LSP"] = {
			{ "Go to definition", "<leader>gd" },
			{ "Code actions", "<leader>ca" },
		},
		["DAP"] = {
			{ "Toggle breakpoint", "<leader>db" },
			{ "Start / continue", "<leader>dc" },
			{ "Step over", "<leader>do" },
			{ "Step into", "<leader>di" },
			{ "Step out", "<leader>dO" },
			{ "Terminate debugging", "<leader>dq" },
			{ "Toggle DAP UI", "<leader>du" },
		},
		["Linting"] = {
			{ "Trigger linting for current file", "<leader>l" },
		},
		["Formatting"] = {
			{ "Format file", "<leader>gf" },
		},
		["LazyGit"] = {
			{ "Open LazyGit", "<leader>lg" },
		},
		["Other"] = {
			{ "Toggle cheetsheet", "<leader>?" },
			{ "Yank to clipboard", "<leader>y" },
		},
	},
}

function M.config(_, opts)
	local nvcheatsheet = require("nvcheatsheet")

	nvcheatsheet.setup(opts)

	-- You can also close it with <Esc>
	vim.keymap.set("n", "<leader>?", nvcheatsheet.toggle)
end

return M
