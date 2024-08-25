return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<leader>gs", "<Cmd>Neogit<CR>", desc = "Show status (Neogit)" },
		{ "<leader>gb", "<Cmd>Neogit branch<CR>", desc = "Show branches (Neogit)" },
		{ "<leader>gc", "<Cmd>Neogit commit<CR>", desc = "Commit (Neogit)" },
		{ "<leader>gd", "<Cmd>Neogit diff<CR>", desc = "Show diff (Neogit)" },
		{ "<leader>gp", "<Cmd>Neogit pull<CR>", desc = "Pull (Neogit)" },
		{ "<leader>gP", "<Cmd>Neogit push<CR>", desc = "Push (Neogit)" },
		{ "<leader>gl", "<Cmd>Neogit log<CR>", desc = "Show logs (Neogit)" },
	},
}
