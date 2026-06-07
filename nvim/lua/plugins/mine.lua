return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        -- This shows hidden files in all picker layouts
        hidden = true,
        -- Optional: If you also want to show files ignored by .gitignore
        ignored = true,
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
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
    },
  },
}
