return {
  -- Prevent the time from being displayed in the bottom right corner
  -- See https://www.lazyvim.org/plugins/ui#lualinenvim
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
}
