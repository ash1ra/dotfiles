local default_diagnostic_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

local qmlls_diagnostic_filter = function(err, result, context, config)
	if result.diagnostics then
		local filtered_diagnostics = {}
		for _, diag in ipairs(result.diagnostics) do
			local msg = diag.message

			local ignore_qs = msg:match("import.*qs%.")
			local ignore_unqualified = msg:match("Unqualified access")
			local ignore_panel_window = msg:match("Type PanelWindow is not creatable")

			if not (ignore_qs or ignore_unqualified or ignore_panel_window) then
				table.insert(filtered_diagnostics, diag)
			end
		end
		result.diagnostics = filtered_diagnostics
	end
	default_diagnostic_handler(err, result, context, config)
end

---@type vim.lsp.Config
return {
	cmd = { 'qmlls' },
	filetypes = { 'qml' },
	root_markers = { '.git', '.qmlls.ini', 'qmldir' },

	cmd_env = {
		QML_IMPORT_PATH = "/usr/lib/qt6/qml"
	},

	settings = {
		qml = {
			importPaths = {
				"/usr/lib/qt6/qml"
			}
		}
	},

	handlers = {
		["textDocument/publishDiagnostics"] = qmlls_diagnostic_filter
	}
}
