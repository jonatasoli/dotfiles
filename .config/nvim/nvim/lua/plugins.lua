-- bootstrap Packer
local packer_path = "/site/pack/packer/start/packer.nvim"
local install_path = vim.fn.stdpath("data") .. packer_path
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  local repo = "https://github.com/wbthomason/packer.nvim"
  local clone = {"git", "clone", "--depth", "1", repo, install_path}
  PackerBboostraped = vim.fn.system(clone)
end

vim.cmd([[packadd packer.nvim]])

if PackerBboostraped then
  require("packer").sync()
end

vim.cmd(
  [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

-- add plugins
local startup = function(use)
  use {"wbthomason/packer.nvim"}

    -- colorscheme
    use { "dracula/vim", as = 'dracula' }

    -- File Tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("modules.tree")
      end,
    }

    -- Telescope and Tree Shitter
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"},
      config = function()
        require("modules.telescope")
      end,
    }
    use {
      "gelguy/wilder.nvim",
      run = ":UpdateRemotePlugins",
      config = function()
        require("modules.wilder")
      end,
    }

    --Comentários
    use { 'tpope/vim-commentary' } --Permite fazer comentários com gc

    -- lsp, completion, linting and snippets
    use {
      "nvim-treesitter/nvim-treesitter",
      run = "TSUpdate",
      config = function()
        require("modules.treesitter")
      end,
    }
    use {
      "neovim/nvim-lspconfig",
      requires = {{"williamboman/nvim-lsp-installer"}},
      config = function()
        require("modules.lsp")
      end,
    }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "f3fora/cmp-spell",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "quangnguyen30192/cmp-nvim-tags",
        "ray-x/cmp-treesitter",
        "lukas-reineke/cmp-rg",
        "petertriho/cmp-git",
      },
      config = function()
        require("modules.cmp")
      end,
    }
    -- code formatter
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("modules.formatter")
      end,
    }
    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("modules.symbols_outline")
      end,
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("modules.trouble")
      end,
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


end


-- load plugins
return require("packer").startup(startup)
