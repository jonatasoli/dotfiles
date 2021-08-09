" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/rivendel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rivendel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rivendel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rivendel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rivendel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  black = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/black"
  },
  ["buftabline.nvim"] = {
    config = { "\27LJ\2\n\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\17index_format\b%d \20buffer_id_index\2\nicons\2\19hlgroup_normal\fTabLine\nsetup\15buftabline\frequire\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/buftabline.nvim"
  },
  delimitMate = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  dracula = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/dracula"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22modules.formatter\frequire\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["go.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/opt/go.nvim"
  },
  ["gofmt.vim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/gofmt.vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%f\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t%p%%†\3\1\0\6\0\24\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0034\4\3\0003\5\15\0>\5\1\4=\4\16\0035\4\17\0=\4\18\0034\4\3\0003\5\19\0>\5\1\4=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\0\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\0\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\bî‚µ\bî‚·\23section_separators\1\0\1\ntheme\fdracula\1\3\0\0\bî‚´\bî‚¶\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16modules.lsp\frequire\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n€\3\0\0\6\0\14\0\0296\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1$\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\28<Cmd>NvimTreeToggle<CR>\15<Leader>nt\6n\20nvim_set_keymap\bapi!nvim_tree_width_allow_resize\20nvim_tree_width\1\b\0\0\v\\.pyc$\16__pycache__\t.git\14.DS_Store\17.ropeproject\14.coverage\vcover/\21nvim_tree_ignore%nvim_tree_highlight_opened_files\27nvim_tree_add_trailing\6g\bvim\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nå\3\0\0\5\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0004\4\0\0=\4\a\3=\3\b\0025\3\t\0005\4\n\0=\4\v\3=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\6+\21node_decremental\6-\19init_selection\15<leader>is\22scope_incremental\6w\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\21ensure_installed\1\0\0\1\30\0\0\tbash\bcss\15dockerfile\tfish\ago\tdart\6c\bcpp\fc_sharp\ngomod\fgraphql\thtml\tjava\njsdoc\vkotlin\15javascript\tjson\blua\vpython\nregex\brst\truby\trust\tscss\ttoml\btsx\15typescript\bvue\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { '\27LJ\2\nÓ\3\0\0\f\0\f\0"5\0\0\0004\1\a\0005\2\1\0>\0\4\2>\2\1\0015\2\2\0>\0\4\2>\2\2\0015\2\3\0>\0\4\2>\2\3\0015\2\4\0>\0\4\2>\2\4\0015\2\5\0>\0\4\2>\2\5\0015\2\6\0>\0\4\2>\2\6\0016\2\a\0\18\4\1\0B\2\2\4H\5\a€6\a\b\0009\a\t\a9\a\n\a6\t\v\0\18\v\6\0B\t\2\0A\a\0\1F\5\3\3R\5÷K\0\1\0\vunpack\20nvim_set_keymap\bapi\bvim\npairs\1\4\0\0\6n\15<Leader>fp!<Cmd>Telescope live_grep<CR>\1\4\0\0\6n\15<Leader>fh <Cmd>Telescope oldfiles<CR>\1\4\0\0\6n\15<Leader>fb\31<Cmd>Telescope buffers<CR>\1\4\0\0\6n\15<Leader>ff"<Cmd>Telescope find_files<CR>\1\4\0\0\6n\15<Leader>fG"<Cmd>Telescope git_status<CR>\1\4\0\0\6n\15<Leader>fg!<Cmd>Telescope git_files<CR>\1\0\1\fnoremap\2\0' },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\nu\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\29<Cmd>StripWhitespace<CR>\15<Leader>fw\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-rainbow"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-rainbow"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/rivendel/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

time("Defining packer_plugins", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\n\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%f\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t%p%%†\3\1\0\6\0\24\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0034\4\3\0003\5\15\0>\5\1\4=\4\16\0035\4\17\0=\4\18\0034\4\3\0003\5\19\0>\5\1\4=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\0\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\0\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\bî‚µ\bî‚·\23section_separators\1\0\1\ntheme\fdracula\1\3\0\0\bî‚´\bî‚¶\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n€\3\0\0\6\0\14\0\0296\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1$\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\28<Cmd>NvimTreeToggle<CR>\15<Leader>nt\6n\20nvim_set_keymap\bapi!nvim_tree_width_allow_resize\20nvim_tree_width\1\b\0\0\v\\.pyc$\16__pycache__\t.git\14.DS_Store\17.ropeproject\14.coverage\vcover/\21nvim_tree_ignore%nvim_tree_highlight_opened_files\27nvim_tree_add_trailing\6g\bvim\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: buftabline.nvim
time("Config for buftabline.nvim", true)
try_loadstring("\27LJ\2\n\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\17index_format\b%d \20buffer_id_index\2\nicons\2\19hlgroup_normal\fTabLine\nsetup\15buftabline\frequire\0", "config", "buftabline.nvim")
time("Config for buftabline.nvim", false)
-- Config for: formatter.nvim
time("Config for formatter.nvim", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22modules.formatter\frequire\0", "config", "formatter.nvim")
time("Config for formatter.nvim", false)
-- Config for: vim-better-whitespace
time("Config for vim-better-whitespace", true)
try_loadstring("\27LJ\2\nu\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\29<Cmd>StripWhitespace<CR>\15<Leader>fw\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-better-whitespace")
time("Config for vim-better-whitespace", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring('\27LJ\2\nÓ\3\0\0\f\0\f\0"5\0\0\0004\1\a\0005\2\1\0>\0\4\2>\2\1\0015\2\2\0>\0\4\2>\2\2\0015\2\3\0>\0\4\2>\2\3\0015\2\4\0>\0\4\2>\2\4\0015\2\5\0>\0\4\2>\2\5\0015\2\6\0>\0\4\2>\2\6\0016\2\a\0\18\4\1\0B\2\2\4H\5\a€6\a\b\0009\a\t\a9\a\n\a6\t\v\0\18\v\6\0B\t\2\0A\a\0\1F\5\3\3R\5÷K\0\1\0\vunpack\20nvim_set_keymap\bapi\bvim\npairs\1\4\0\0\6n\15<Leader>fp!<Cmd>Telescope live_grep<CR>\1\4\0\0\6n\15<Leader>fh <Cmd>Telescope oldfiles<CR>\1\4\0\0\6n\15<Leader>fb\31<Cmd>Telescope buffers<CR>\1\4\0\0\6n\15<Leader>ff"<Cmd>Telescope find_files<CR>\1\4\0\0\6n\15<Leader>fG"<Cmd>Telescope git_status<CR>\1\4\0\0\6n\15<Leader>fg!<Cmd>Telescope git_files<CR>\1\0\1\fnoremap\2\0', "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\nå\3\0\0\5\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0004\4\0\0=\4\a\3=\3\b\0025\3\t\0005\4\n\0=\4\v\3=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\6+\21node_decremental\6-\19init_selection\15<leader>is\22scope_incremental\6w\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\21ensure_installed\1\0\0\1\30\0\0\tbash\bcss\15dockerfile\tfish\ago\tdart\6c\bcpp\fc_sharp\ngomod\fgraphql\thtml\tjava\njsdoc\vkotlin\15javascript\tjson\blua\vpython\nregex\brst\truby\trust\tscss\ttoml\btsx\15typescript\bvue\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16modules.lsp\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
