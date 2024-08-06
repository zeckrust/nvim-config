return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio"
	},
	config = function()
		local dap = require 'dap'
		local dapui = require 'dapui'

		require('mason-nvim-dap').setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {},
		})

		dapui.setup({
			icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
			controls = {
				icons = {
					pause = '⏸',
					play = '▶',
					step_into = '⏎',
					step_over = '⏭',
					step_out = '⏮',
					step_back = 'b',
					run_last = '▶▶',
					terminate = '⏹',
					disconnect = '⏏',
				},
			},
		})

		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		dap.adapters.godot = {
			type = "server",
			host = "127.0.0.1",
			port = 6006,
		}

		dap.configurations.gdscript = {
			{
				type = "godot",
				request = "launch",
				name = "Launch scene",
				project = "${workspaceFolder}",
				launch_scene = true,
			}
		}

		-- Debug Keybinds
		vim.keymap.set('n', '<F5>', dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set('n', '<F6>', function()
			dap.terminate()
			dapui.close()
		end)
		vim.keymap.set('n', '<F10>', dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set('n', '<F11>', dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set('n', '<leader>B', dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
	end
}
