local plugins = {
  'https://github.com/numToStr/Comment.nvim',
  'https://github.com/folke/snacks.nvim',
}
vim.pack.add(plugins)
require('Comment').setup()
---@type snacks.Config
local opts = {
  animate = {
    enabled = false,
  },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  image = { enabled = true },
  input = { enabled = true },
  scope = { enabled = true },
  words = { enabled = true },
  scroll = { enabled = false },
  styles = {
    notification = {
      -- wo = { wrap = true } -- Wrap notifications
    },
  },
}
require('snacks').setup(opts)
