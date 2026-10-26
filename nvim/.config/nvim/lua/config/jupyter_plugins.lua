vim.pack.add({
	"https://github.com/GCBallesteros/jupytext.nvim",
	"https://github.com/3rd/image.nvim",
	"https://github.com/benlubas/molten-nvim",
})

require("jupytext").setup({
	style = "percent",
	output_extension = "py",
	force_ft = "python",
})

require("image").setup({
	backend = "kitty",
	max_width = 100,
	max_height = 20,
	max_width_window_percentage = math.huge,
	max_height_window_percentage = math.huge,
	window_overlap_clear_enabled = true,
})

vim.g.molten_image_location = "virt"
vim.g.molten_image_provider = "image.nvim"
vim.g.molten_output_win_max_height = 20
vim.g.molten_virt_lines_off_by_1 = true
vim.g.molten_virt_text_output = true
vim.g.molten_wrap_output = true

local map = vim.keymap.set

map("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
map("n", "<leader>mn", function() vim.fn.search("^#\\s*%%", "W") end,
	{ silent = true, desc = "Goto next cell" })
map("n", "<leader>mp", function() vim.fn.search("^#\\s*%%", "bW") end,
	{ silent = true, desc = "Goto previous cell" })
map("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Run line" })
map("n", "<leader>rr", ":<C-u>silent MoltenEvaluateOperator<CR>vip", { silent = true, desc = "Run cell" })
map("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "Run visual selection" })

local function get_cells()
	local total_lines = vim.api.nvim_buf_line_count(0)
	local cells = {}
	local current_start = nil

	for i = 1, total_lines do
		local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
		if line:match("^#%s*%%%%") then
			if current_start then
				table.insert(cells, { start_line = current_start, end_line = i - 1 })
			end
			current_start = i
		end
	end

	if current_start then
		table.insert(cells, { start_line = current_start, end_line = total_lines })
	elseif total_lines > 0 then
		table.insert(cells, { start_line = 1, end_line = total_lines })
	end

	return cells
end

local function run_cell_range(start_line, end_line)
	local total_lines = vim.api.nvim_buf_line_count(0)
	local first_line = vim.api.nvim_buf_get_lines(0, start_line - 1, start_line, false)[1]
	if first_line:match("^#%s*%%%%") and start_line < total_lines then
		start_line = start_line + 1
	end

	while end_line > start_line do
		local l = vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, false)[1]
		if l:match("%S") then break end
		end_line = end_line - 1
	end

	if start_line <= end_line then
		vim.api.nvim_buf_set_mark(0, "<", start_line, 0, {})
		local last_line_len = #vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, false)[1]
		vim.api.nvim_buf_set_mark(0, ">", end_line, last_line_len, {})
		vim.cmd("MoltenEvaluateVisual")
	end
end

map("n", "<leader>ra", function()
	local cells = get_cells()
	for _, cell in ipairs(cells) do
		run_cell_range(cell.start_line, cell.end_line)
	end
end, { silent = true, desc = "Run all cells" })

map("n", "<leader>ru", function()
	local cur_row = vim.api.nvim_win_get_cursor(0)[1]
	local cells = get_cells()
	for _, cell in ipairs(cells) do
		if cell.start_line <= cur_row then
			run_cell_range(cell.start_line, cell.end_line)
		end
	end
end, { silent = true, desc = "Run above and current" })

map("n", "<leader>rd", function()
	local cur_row = vim.api.nvim_win_get_cursor(0)[1]
	local cells = get_cells()
	for _, cell in ipairs(cells) do
		if cell.end_line >= cur_row then
			run_cell_range(cell.start_line, cell.end_line)
		end
	end
end, { silent = true, desc = "Run current and below" })
