-- TODO: https://github.com/jake-stewart/multicursor.nvim ?

return {
  -- Adjust tab width based on the current file
  {
    "tpope/vim-sleuth",
    config = function () end
  },
  -- Improves comment syntax, lets Neovim handle multiple types of comments for a single language, and relaxes rules for uncommenting.
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  -- LSP configs
  {
    "neovim/nvim-lspconfig",
  },
}
