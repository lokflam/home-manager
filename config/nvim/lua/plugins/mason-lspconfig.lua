return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = lsp_capabilities,
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = lsp_capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								workspace = {
									checkThirdParty = false,
									library = {
										"lua",
										vim.env.VIMRUNTIME,
										"nvim-test",
										"${3rd}/busted/library",
										"${3rd}/luassert/library",
										"${3rd}/luv/library",
									},
								},
							},
						},
					})
				end,
				["yamlls"] = function()
					require("lspconfig").yamlls.setup({
						capabilities = lsp_capabilities,
						on_attach = function(client)
							client.server_capabilities.documentFormattingProvider = true
						end,
						settings = {
							yaml = {
								schemaStore = {
									enable = true,
								},
							},
						},
					})
				end,
			},
		})

		require("lspconfig").nil_ls.setup({
			capabilities = lsp_capabilities,
		})
	end,
}
