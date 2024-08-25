return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	dependencies = { "echasnovski/mini.icons" },
	init = function()
		require("fzf-lua").register_ui_select()
	end,
	opts = {
		fzf_colors = true,
		grep = {
			multiline = 1,
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files (Fzf)",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find buffers (Fzf)",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Find keymaps (Fzf)",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "Live grep buffer (Fzf)",
		},
		{
			"<leader>fG",
			function()
				require("fzf-lua").live_grep_glob()
			end,
			desc = "Live grep project (Fzf)",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "Resume query (Fzf)",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "Find LSP document symbols (Fzf)",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").lsp_document_diagnostics()
			end,
			desc = "Find LSP document diagnostics (Fzf)",
		},
		{
			"<leader>fD",
			function()
				require("fzf-lua").lsp_workspace_diagnostics()
			end,
			desc = "Find LSP workspace diagnostics (Fzf)",
		},
	},
}
