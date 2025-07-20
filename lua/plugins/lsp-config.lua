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
				ensure_installed = { "lua_ls",
									 "zls",
									 "rust_analyzer",
									 "basedpyright",
									 "clangd",
									 "denols",
									 "cssls",
				}
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
			lspconfig.basedpyright.setup({})
			lspconfig.clangd.setup({})
			lspconfig.denols.setup({})
			lspconfig.cssls.setup({})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
			vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local gdscript_config = {
				capabilities = capabilities,
				settings = {},
			}

			if vim.fn.has "win32" == 1 then -- Windows
				gdscript_config["cmd"] = { "ncat", "localhost", os.getenv "GDScript_Port" or "6005" }
			else -- Linux
				local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
				if not vim.loop.fs_stat(pipepath) then
					vim.fn.serverstart(pipepath)
				end
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
		config = function()
			require("flutter-tools").setup {}
			vim.keymap.set('n', '<leader>ft', require('telescope').extensions.flutter.commands,
				{ desc = 'Open command Flutter' })
		end
	},
}
