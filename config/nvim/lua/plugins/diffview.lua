return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<leader>do", "<Cmd>DiffviewOpen<CR>", desc = "Open worktree (Diffview)" },
		{ "<leader>dc", "<Cmd>DiffviewClose<CR>", desc = "Close (Diffview)" },
		{ "<leader>dh", "<Cmd>DiffviewFileHistory %<CR>", desc = "Show current file history (Diffview)" },
	},
}
