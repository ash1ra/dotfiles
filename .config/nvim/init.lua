require("config.options")
require("config.keymaps")
require("config.plugins")
require("config.lsp")

local highlights = {
	"Normal",
	"NormalFloat",
	"NormalNC",
	"SignColumn",
	"StatusLine",
	"StatusLineNC",
	"WinBar",
	"WinBarNC",
	"Folded",
	"EndOfBuffer",
	"LineNr",
	"CursorLineNr",
	"CursorLine",
}

for _, group in ipairs(highlights) do
	vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end
