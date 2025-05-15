return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")

		dapui.setup()
		dap_python.setup("python3")
		require("nvim-dap-virtual-text").setup({
			commented = true,
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		-- 	dapui.close()
		-- end

		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle breakpoint" })

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, { desc = "Start / continue" })

		vim.keymap.set("n", "<leader>do", function()
			dap.step_over()
		end, { desc = "Step over" })

		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, { desc = "Step into" })

		vim.keymap.set("n", "<leader>dO", function()
			dap.step_out()
		end, { desc = "Step out" })

		vim.keymap.set("n", "<leader>dq", function()
			require("dap").terminate()
		end, { desc = "Terminate debugging" })

		vim.keymap.set("n", "<leader>du", function()
			dapui.toggle()
		end, { desc = "Toggle DAP UI" })
	end,
}
