return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		ensure_installed = {
			-- ls
			"lua_ls",
			"ansiblels",
			"bashls",
			"cssls",
			"dockerls",
			"docker_compose_language_service",
			"eslint",
			"gopls",
			"html",
			"helm_ls",
			"jsonls",
			"tsserver",
			"marksman",
			"sqlls",
			"bzl",
			"taplo",
			"tailwindcss",
			"templ",
			"terraformls",
			"yamlls",

			-- formatter
			"prettier",
			"stylua",

			-- linter
			"eslint_d",
		},
	},
}
