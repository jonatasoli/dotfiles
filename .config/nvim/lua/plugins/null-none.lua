return {
  -- Lazy plugin with Mason and lspconfig dependencies
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      -- Define your sources here
      local sources = {
        -- Lua diagnostics using `lua-language-server` (replace with your needs)
        null_ls.builtins.diagnostics.lua,

        -- Python formatting and linting using `black` (replace with your needs)
        {
          cmd = "black .",
          name = "black",
          parser = "python",
        },
      }

      -- Initialize null-ls with the specified sources
      null_ls.setup({
        sources = sources,
      })
    end,
  },
}
