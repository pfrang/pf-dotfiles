return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				sources = {

					files = {

						-- This shows hidden files in all picker layouts
						hidden = true,
						-- Optional: If you also want to show files ignored by .gitignore
						ignored = true,
					},

					grep = {
						hidden = false,
						ignored = false,
					},

					explorer = {
						hidden = true,
						ignored = true,
					},
				},
			},
		},
	},
	-- {
	-- 	"mason-org/mason.nvim",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"typescript-language-server",
	-- 			"prettier",
	-- 			"eslint_d",
	-- 		},
	-- 	},
	-- },
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {
			border = "rounded",
			max_width = 80,
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	},
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
			},
			cmdline = {
				keymap = {
					["<C-j>"] = { "select_next", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
				},
			},
		},
	},
}
