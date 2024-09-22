return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "zls", "rust_analyzer" }
			})
		end
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.zls.setup({})
			lspconfig.rust_analyzer.setup({})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local gdscript_config = {
				capabilities = capabilities,
				settings = {},
			}

			if vim.fn.has "win32" == 1 then
				gdscript_config["cmd"] = { "ncat", "localhost", os.getenv "GDScript_Port" or "6005" }
			end

			lspconfig.gdscript.setup(gdscript_config)
		end
	},
	{
		"folke/lazydev.nvim",
		config = function()
			require("lazydev").setup()
		end
	},
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = function ()
			require("flutter-tools").setup{}

			vim.keymap.set('n', '<leader>r', require('telescope').extensions.flutter.commands, { desc = 'Open command Flutter' })
			vim.keymap.set('n', '<leader>br', function()
				vim.cmd('20new')
				vim.cmd('te fvm flutter packages pub run build_runner build --delete-conflicting-outputs')
				vim.cmd('2sleep | normal G')
    		end
			)
		end
	},
}
