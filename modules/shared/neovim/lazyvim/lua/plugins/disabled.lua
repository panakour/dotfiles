return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.explorer = opts.explorer or {}
      opts.explorer.enabled = false
      return opts
    end,
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
}
