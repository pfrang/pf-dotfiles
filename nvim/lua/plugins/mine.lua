return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				sources = {
					files = {
						hidden = true,
						ignored = false,
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
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			-- current_line_blame_opts = {
			-- 	delay = 500,
			-- },
		},
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
