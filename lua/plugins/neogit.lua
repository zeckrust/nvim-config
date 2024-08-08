return {
	"NeogitOrg/neogit",
  	dependencies = {
    	"nvim-lua/plenary.nvim",    -- required
    	"sindrets/diffview.nvim",	-- optional - Diff integration
  	},
	config = function()
		require("neogit").setup({})
		vim.keymap.set("n", "<leader>g", ":Neogit<CR>", {})
	end
}
