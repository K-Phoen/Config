return {
  -- catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      background = {
        light = "latte",
        dark = "frappe",
      },
    },
  },
  -- Auto-detect light/dark mode
  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },
}
