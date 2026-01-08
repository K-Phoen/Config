-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
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
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "catppuccin-macchiato",
      colorscheme = "catppuccin-frappe",
    },
  },
  -- Auto-detect light/dark mode
  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },
}
