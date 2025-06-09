return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "stevearc/conform.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      -- Mason
      require("mason").setup({
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }
    })
    servers = {
      "bashls",
      "lua_ls",
      "rust_analyzer",
      "svelte",
      "clangd",
      "neocmake",
      "dockerls",
      "docker_compose_language_service",
      "eslint",
      "html",
      "htmx",
      "jinja_lsp",
      "marksman",
      "pyright",
      "ruff",
      "sqlls",
      "somesass_ls",
      "tailwindcss",
      "cssls",
      "biome",
      "jsonls",
      "yamlls",
    }

    -- Setup Mason-Lspconfig
    require("mason-lspconfig").setup {
      automatic_installation = true,
      servers,
    }

    -- Setup Mason-Tool-Installer
    require("mason-tool-installer").setup {
      ensure_installed = {
        "stylua",
        "prettier",
        "eslint_d"
      },
      auto_update = true,
      run_on_start = true
    }

    -- LSP Configuration
      capabilities = require("cmp_nvim_lsp").default_capabilities()
      for _, server in pairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        end,
      })
      end
  },
}
