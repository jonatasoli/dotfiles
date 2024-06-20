return {
  -- Lazy plugin with Mason and lspconfig dependencies
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      -- Define your sources here
      local sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }
      local external_sources = {
        'none-ls-external-sources.diagnostics.flake8',
        'none-ls-external-sources.diagnostics.eslint_d',

        'none-ls-external-sources.formatting.eslint',
        'none-ls-external-sources.formatting.rustfmt',

        'none-ls-external-sources.code_actions.eslint_d',
      }

      -- Initialize null-ls with the specified sources
      null_ls.setup({
        sources = sources,
        external_sources = external_sources,
      })
    end,
  },
}
