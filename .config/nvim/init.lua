require("editor")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local tree_sitter_path = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"
package.path = package.path .. ";" .. tree_sitter_path .. "/lua/?.lua;" .. tree_sitter_path .. "/lua/?/init.lua"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({ import = "plugins" })


-- TODO
-- https://github.com/rest-nvim/rest.nvim
-- https://github.com/nvim-neorg/neorg
-- https://github.com/nvim-telekasten/telekasten.nvim
-- https://github.com/stevearc/conform.nvim
