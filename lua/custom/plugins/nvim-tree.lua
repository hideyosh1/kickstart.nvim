return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function() require('nvim-tree').setup {} end,
    keys = {
      { '\\', ':NvimTreeFindFileToggle<CR>', desc = 'Toggle nvim-tree', silent = true },
    },
  },
}
