return {
	"akinsho/bufferline.nvim",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup()

		vim.keymap.set("n", "<leader>w", ":BufferLinePick<CR>", {})
		vim.keymap.set("n", "<leader>q", ":BufferLinePickClose<CR>", {})
	end
}
