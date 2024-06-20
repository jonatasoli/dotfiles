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
        -- "denols",
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
        "yamlls",
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
    local on_attach = function(client, bufnr)
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    end

    local servers = {
      bashls = {},
      lua_ls = {},
      rust_analyzer = {},
      svelte = {},
      clangd = {},
      neocmake = {},
      -- denols = {},
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
        if server == "svelte" then
          lspconfig[server].setup(vim.tbl_extend("force", {
            capabilities = capabilities,
            filetypes = { 'typescript', 'javascript', 'svelte', 'html', 'css' },
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
              local bufopts = { noremap=true, silent=true, buffer=bufnr }
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
                callback = function(ctx)
                  client.notify("$/onDidChangeTsOrJsFile", { uri = vim.uri_from_bufnr(ctx.buf) })
                end,
              })
            end,
            settings = {
              svelte = {
                plugin = {
                  typescript = {
                    enabled = true,
                  },
                },
              },
            },
          }, config))
        else
          lspconfig[server].setup(vim.tbl_extend("force", {
            capabilities = capabilities,
            on_attach = on_attach,
          }, config))
        end
      end
    end,
  },
}
