-- packer setup
local packer_exists = pcall(vim.cmd, [[ packadd packer.nvim ]])
if not packer_exists then
  local dest = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))
  local repo_url = "https://github.com/wbthomason/packer.nvim"

  vim.fn.mkdir(dest, "p")

  print("Downloading packer…")
  vim.fn.system(
    string.format("git clone %s %s", repo_url, dest .. "packer.nvim")
  )
  vim.cmd([[packadd packer.nvim]])
  vim.cmd("PackerSync")
  print("packer.nvim installed!")
end

vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile ]])

-- load plugins
return require("packer").startup(
         function(use)
    use {"wbthomason/packer.nvim"}

    -- colorscheme
    use { "dracula/vim", as = 'dracula' }

    -- File Tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        vim.g.nvim_tree_add_trailing = 1
        vim.g.nvim_tree_highlight_opened_files = 1
        vim.g.nvim_tree_ignore = {
          [[\.pyc$]],
          "__pycache__",
          ".git",
          ".DS_Store",
          ".ropeproject",
          ".coverage",
          "cover/",
        }
        vim.g.nvim_tree_width = 36
        vim.g.nvim_tree_width_allow_resize = 1

        vim.api.nvim_set_keymap(
          "n", "<Leader>nt", "<Cmd>NvimTreeToggle<CR>", {noremap = true}
        )
      end,
    }

    -- Telescope and Tree Shitter
    use {
      "nvim-telescope/telescope.nvim", -- vai fazer as buscas
      requires = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"},
      config = function()
        local opts = {noremap = true}
        local mappings = {
          {"n", "<Leader>fg", [[<Cmd>Telescope git_files<CR>]], opts},
          {"n", "<Leader>fG", [[<Cmd>Telescope git_status<CR>]], opts},
          {"n", "<Leader>ff", [[<Cmd>Telescope find_files<CR>]], opts},
          {"n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], opts},
          {"n", "<Leader>fh", [[<Cmd>Telescope oldfiles<CR>]], opts},
          {"n", "<Leader>fp", [[<Cmd>Telescope live_grep<CR>]], opts},
        }
        for _, val in pairs(mappings) do
          vim.api.nvim_set_keymap(unpack(val))
        end
      end,
    }

    use { 'nvim-telescope/telescope-fzy-native.nvim' }

    -- language syntax highlight and small motions
    use {
      "nvim-treesitter/nvim-treesitter",
      run = "TSUpdate",
      config = function()
        require"nvim-treesitter.configs".setup {
          ensure_installed = {
            "bash",
            "css",
            "dockerfile",
            "fish",
            "go",
            "dart",
            "c",
            "cpp",
            "c_sharp",
            "gomod",
            "graphql",
            "html",
            "java",
            "jsdoc",
            "kotlin",
            "javascript",
            "json",
            "lua",
            "python",
            "regex",
            "rst",
            "ruby",
            "rust",
            "scss",
            "toml",
            "tsx",
            "typescript",
            "vue",
            "yaml",
          },
          highlight = {enable = true, disable = {}},
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<leader>is",
              node_incremental = "+",
              scope_incremental = "w",
              node_decremental = "-",
            },
          },
          indent = {enable = true},
        }
      end,
    }

    -- code formatter
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("modules.formatter")
      end,
    }

    --Comentários
    use { 'tpope/vim-commentary' } --Permite fazer comentários com gc

    -- lsp, completion, linting and snippets
    use {"kabouzeid/nvim-lspinstall"}
    use {"rafamadriz/friendly-snippets"}
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("modules.lsp")
      end,
      requires = {
        "glepnir/lspsaga.nvim",
        "hrsh7th/nvim-compe",
        "hrsh7th/vim-vsnip",
        "hrsh7th/vim-vsnip-integ",
        "simrat39/symbols-outline.nvim",
      },
    }

    --Utilitários
    use 'mhinz/vim-startify' --Mostra na tela inicial do vim os ultimos arquivos abertos
    use 'Yggdroot/indentLine' --Coloca um tracejado pra guiar a hierarquia das funções
    use {
      "ntpeters/vim-better-whitespace", --Permite ver espacos desnecessarios
      config = function()
        vim.api.nvim_set_keymap(
          "n", "<Leader>fw", "<Cmd>StripWhitespace<CR>", {noremap = true}
        )
      end,
    }
    use 'Raimondi/delimitMate' --Auto fechamento de aspas, parenteses chaves e colchetes
    use 'frazrepo/vim-rainbow' --Muda o destaque de tags e parenteses e etcs
    use 'tpope/vim-surround' --troca simbolos de maneira mais facil

    -- Tmux
    use 'christoomey/vim-tmux-navigator' -- Pra navegar no tmux

    -- Git
    use {"tpope/vim-fugitive"} -- Permite fazer commandos git e fazer merge visual
    use {
      "lewis6991/gitsigns.nvim", -- Permite visualizar as alteracoes de um arquivo
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require"gitsigns".setup({numhl = true})
      end,
    }
    use 'airblade/vim-gitgutter' --Simbolos do git 

    -- Status BAR
    -- status & tab lines
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = function()
        require("lualine").setup {
          options = {
            section_separators = {"", ""},
            component_separators = {"", ""},
            theme = "dracula",
          },
          sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch", "diff"},
            lualine_c = {
              function()
                return "%f"
              end,
            },
            lualine_x = {"encoding", "fileformat", "filetype"},
            lualine_y = {
              function()
                return "%p%%"
              end,
            },
            lualine_z = {"location"},
          },
        }
      end,
    }
    use {
      "jose-elias-alvarez/buftabline.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("buftabline").setup {
          index_format = "%d ",
          icons = true,
          buffer_id_index = true,
          hlgroup_normal = "TabLine",
        }
      end,
    }

    -- Ctags
    use {
            'liuchengxu/vista.vim',
        }
    use 'majutsushi/tagbar'


    -- Plugins especificos de linguagens
    -- Go
    use {"npxbr/go.nvim", ft = {"go"}}
    --Rust
    use 'rust-lang/rust.vim'
    use 'tweekmonster/gofmt.vim'
    -- Python
    use 'ambv/black'


    end)


