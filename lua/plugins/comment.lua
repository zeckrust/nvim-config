return {
	"terrortylor/nvim-comment",
	config = function()
		require("nvim_comment").setup({
			comment_empty = false
		})

		vim.keymap.set({"n","v"}, "<leader>é", ":CommentToggle<CR>")
	end
}
