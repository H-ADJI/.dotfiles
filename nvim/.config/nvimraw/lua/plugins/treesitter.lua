return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "templ", "sql", "go", "gomod", "gowork", "gosum" },
			-- sync_install = false,
			-- auto_install = true,
			-- ignore_install = { "javascript" },
		})
	end,
}
