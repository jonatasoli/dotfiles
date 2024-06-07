return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "frappe",
        },
        transparent_background = true,
        show_end_of_buffer = true,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })
    vim.cmd.colorscheme "catppuccin"
    end,
  },
}
