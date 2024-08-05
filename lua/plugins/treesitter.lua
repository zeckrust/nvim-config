return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter_config = require("nvim-treesitter.configs")
		treesitter_config.setup({
			ensure_installed = { "lua", "zig", "rust", "c" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	
	end
}
