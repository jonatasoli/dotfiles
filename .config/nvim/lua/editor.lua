-- main editor configs
local api = vim.api
local opt = vim.opt
local g = vim.g

local function set_globals()
  g.mapleader = " "
  g.python3_host_prog = "/home/rivendel/.pyenv/shims/python"
  g.python_host_prog = "/home/rivendel/.pyenv/shims/python"
end

local function set_mappings()

  local opts = {noremap = true}
  local mappings = {

    {"n", "∆", "<Cmd>m .+1<CR>==", opts},
    {"n", "˚", "<Cmd>m .-2<CR>==", opts},
    {"i", "∆", "<Esc><Cmd>m .+1<CR>==gi", opts},
    {"i", "˚", "<Esc><Cmd>m .-2<CR>==gi", opts},
    {"v", "∆", "<Cmd>m '>+1<CR>gv=gv", opts},
    {"v", "˚", "<Cmd>m '<-2<CR>gv=gv", opts},
    {"n", "<leader>,", "<Cmd>nohl<CR>", opts},
    {"n", "<leader>ls", "'0<CR>", opts},

    -- buffer and aplist navigation
    {"n", "<leader>h", "<C-w>h<CR>", opts},
    {"n", "<leader>j", "<C-w>j<CR>", opts},
    {"n", "<leader>k", "<C-w>k<CR>", opts},
    {"n", "<leader>l", "<C-w>l<CR>", opts},
    {"n", "<leader>Q", "<C-w>c<CR>", opts},
    {"n", "<leader>w", "<Cmd>w<CR>", opts},
    {"n", "<leader>z", "<Cmd>bp<CR>", opts},
    {"n", "<leader>x", "<Cmd>bn<CR>", opts},
    {"n", "<leader>qa", "<Cmd>bufdo bw<CR>", opts},
    {"n", "<leader>q", "<Cmd>bw<CR>", opts},

    -- disable arrows
    {"n", "<up>", "<nop>", opts},
    {"n", "<down>", "<nop>", opts},
    {"n", "<left>", "<nop>", opts},
    {"n", "<right>", "<nop>", opts},
    {"i", "<up>", "<nop>", opts},
    {"i", "<down>", "<nop>", opts},
    {"i", "<left>", "<nop>", opts},
    {"i", "<right>", "<nop>", opts},

    -- Tagbar
    {"n", "<silent><leader>4", "<Cmd>TagbarToggle<CR>", opts },

    --LSP
    {"n", "<leader>vd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts },
    {"n", "<leader>vi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts },
    {"n", "<leader>vsh", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts },
    {"n", "<leader>vrr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts },
    {"n", "<leader>vrn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts },
    {"n", "<leader>vh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts },
    {"n", "<leader>vca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts },
    {"n", "<leader>vsd", "<Cmd>lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>", opts },
    {"n", "<leader>vn", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts },
  }

  for _, val in pairs(mappings) do
    api.nvim_set_keymap(unpack(val))
  end
end

local function set_options()
  local options = {

    ruler = true,
    number = true,
    relativenumber = true,

    foldmethod="indent",
    foldlevel=20,

    encoding="utf-8",
    fileencoding="utf-8",
    fileencodings="utf-8",

    backspace="indent,eol,start",
    smartindent=true,

    tabstop=4,
    softtabstop=0,
    shiftwidth=4,
    expandtab=true,
    smarttab=true,

    hidden=true,
    hlsearch=true,
    incsearch=true,
    ignorecase=true,
    smartcase=true,

    fileformats="unix,dos,mac",

    shell="/usr/bin/bash",

    clipboard="unnamedplus",

    history=1000,

    inccommand="split",

    wrap= true,
    wm=2,
    textwidth=180,

    colorcolumn = "80,88,120",
    termguicolors = true,
    wildignore = "*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite",
    autoread = true,
    tags=tags,
    updatetime=300,
  }
  for key, val in pairs(options) do
    opt[key] = val
  end

  vim.cmd(
    [[
  augroup LineNumbers
    autocmd!
    autocmd InsertEnter  * set relativenumber
    autocmd FocusGained * set relativenumber
    autocmd BufEnter * set relativenumber
    autocmd InsertLeave * set norelativenumber
    autocmd BufLeave * set norelativenumber
    autocmd FocusLost * set norelativenumber
  augroup END
  ]]
  )

  vim.cmd(
      [[
    augroup vimrc-sync-fromstart
      autocmd!
      autocmd BufEnter * :syntax sync maxlines=200
    augroup END
    ]]
    )


  vim.cmd(
      [[
    augroup vimrc-remember-cursor-position
      autocmd!
      autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END
    ]]
    )

  vim.cmd(
    [[
  augroup MarkDownExts
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal ft=markdown " .md ->markdown
    autocmd BufNewFile,BufRead *.adoc setlocal ft=asciidoc " .adoc ->asciidoc
  augroup END
  ]]
  )

  vim.cmd([[colorscheme dracula]])

  vim.cmd([[command! FixWhitespace :%s/\s\+$//e ]])

  -- TODO is there a Lua API for those?
  vim.cmd(
    [[
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qa qa
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev WQ wq
cnoreabbrev Wqa wqa
]]
  )
end

set_globals()
set_mappings()
set_options()
