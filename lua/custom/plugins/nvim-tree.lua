
local plugins = {
  'https://github.com/nvim-tree/nvim-tree.lua',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

require('nvim-tree').setup {}

vim.keymap.set('n', '\\', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle nvim-tree', silent = true })
