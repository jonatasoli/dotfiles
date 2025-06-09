return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    priority = 100,
    dependencies = {
      "R-nvim/cmp-r",
    },
    run = ":TSUpdate",
    config = function()
    end,
  },

}
