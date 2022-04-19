local actions = require("telescope.actions")
require("telescope").setup(
  {defaults = {mappings = {i = {["<Esc>"] = actions.close}}}}
)

_G.find_dotfiles = function()
  require("telescope.builtin").find_files(
    {
      search_dirs = {"~/Dropbox/Projects/dotfiles", "~/src/dotfiles"},
      hidden = true,
      follow = true,
    }
  )
end

local opts = {noremap = true}
local mappings = {
  {"n", "<Leader>fg", [[<Cmd>Telescope git_files<CR>]], opts},
  {"n", "<Leader>fG", [[<Cmd>Telescope git_status<CR>]], opts},
  {"n", "<Leader>ff", [[<Cmd>Telescope find_files<CR>]], opts},
  {"n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], opts},
  {"n", "<Leader>fh", [[<Cmd>Telescope oldfiles<CR>]], opts},
  {"n", "<Leader>fp", [[<Cmd>Telescope live_grep<CR>]], opts},
  {"n", "<Leader>m", [[<Cmd>Telescope keymaps<CR>]], opts},
  {"n", "<Leader>df", [[<Cmd>lua find_dotfiles()<CR>]], opts},
}
for _, val in pairs(mappings) do
  vim.api.nvim_set_keymap(unpack(val))
end
