return {
	"akinsho/bufferline.nvim",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup()

		vim.keymap.set("n", "<leader>n", ":BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<leader>b", ":BufferLineCyclePrev<CR>", {})
		vim.keymap.set("n", "<leader>q", ":BufferLinePickClose<CR>", {})
	end
}
