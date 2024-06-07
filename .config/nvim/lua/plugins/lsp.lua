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

    -- Setup Mason-Lspconfig
    require("mason-lspconfig").setup {
      automatic_installation = true,
      ensure_installed = {
        "bashls",
        "lua_ls",
        "rust_analyzer",
        "svelte",
        "clangd",
        "neocmake",
        "denols",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "html",
        "htmx",
        "jinja_lsp",
        "marksman",
        "pyright",
        "ruff_lsp",
        "sqlls",
        "somesass_ls",
        "tailwindcss",
        "cssls",
        "biome",
        "volar",
        "jsonls",
        "yamlls"
      },
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
    local lspconfig = require "lspconfig"
    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    local servers = {
      bashls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
              enable = false
            }
          }
        }
      },
      rust_analyzer = {},
      svelte = {},
      clangd = {},
      neocmake = {},
      denols = {},
      dockerls = {},
      docker_compose_language_service = {},
      eslint = {},
      html = {},
      htmx = {},
      jinja_lsp = {},
      marksman = {},
      pyright = {},
      ruff_lsp = {},
      sqlls = {},
      somesass_ls = {},
      tailwindcss = {},
      cssls = {},
      biome = {},
      volar = {},
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },
    }

      for server, config in pairs(servers) do
        lspconfig[server].setup(vim.tbl_extend("force", {
          capabilities = capabilities,
        }, config))
      end
    end,
  },
}
