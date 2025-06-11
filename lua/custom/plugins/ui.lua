local function wc()
  if vim.bo.filetype == 'md' or vim.bo.filetype == 'text' or vim.bo.filetype == 'markdown' or vim.bo.filetype == 'org' or vim.bo.filetype == 'typst' then
    if vim.fn.wordcount().visual_words == 1 then
      return tostring(vim.fn.wordcount().visual_words) .. ' word'
    elseif not (vim.fn.wordcount().visual_words == nil) then
      return tostring(vim.fn.wordcount().visual_words) .. ' words'
    else
      return tostring(vim.fn.wordcount().words) .. ' words'
    end
  else
    return ''
  end
end

return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        background_colour = '#000000',
        fps = 30,
        icons = {
          DEBUG = '',
          ERROR = '',
          INFO = '',
          TRACE = '✎',
          WARN = '',
        },
        level = 2,
        minimum_width = 50,
        render = 'default',
        stages = 'fade_in_slide_out',
        time_formats = {
          notification = '%T',
          notification_history = '%FT%T',
        },
        timeout = 5000,
        top_down = true,
      }

      vim.notify = require 'notify'
    end,
  },
  {

    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          -- theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp' } }, wc },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
    -- See `:help lualine.txt`
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    'romgrk/barbar.nvim',
    lazy = false,
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    setup = true,
    keys = {

      -- Move to previous/next
      { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = '' },
      { '<A-.>', '<Cmd>BufferNext<CR>', desc = '' },

      -- Re-order to previous/next
      { '<A-<>', '<Cmd>BufferMovePrevious<CR>', desc = '' },
      { '<A->>', '<Cmd>BufferMoveNext<CR>', desc = '' },

      -- Goto buffer in position...
      { '<A-1>', '<Cmd>BufferGoto 1<CR>', desc = '' },
      { '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = '' },
      { '<A-3>', '<Cmd>BufferGoto 3<CR>', desc = '' },
      { '<A-4>', '<Cmd>BufferGoto 4<CR>', desc = '' },
      { '<A-5>', '<Cmd>BufferGoto 5<CR>', desc = '' },
      { '<A-6>', '<Cmd>BufferGoto 6<CR>', desc = '' },
      { '<A-7>', '<Cmd>BufferGoto 7<CR>', desc = '' },
      { '<A-8>', '<Cmd>BufferGoto 8<CR>', desc = '' },
      { '<A-9>', '<Cmd>BufferGoto 9<CR>', desc = '' },
      { '<A-0>', '<Cmd>BufferLast<CR>', desc = '' },

      -- Pin/unpin buffer
      { '<A-p>', '<Cmd>BufferPin<CR>', desc = '' },

      -- Goto pinned/unpinned buffer
      --                 :BufferGotoPinned
      --                 :BufferGotoUnpinned

      -- Close buffer
      { '<A-c>', '<Cmd>BufferClose<CR>', desc = '' },

      -- Wipeout buffer
      --                 :BufferWipeout

      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight

      -- Magic buffer-picking mode
      { '<C-p>', '<Cmd>BufferPick<CR>', desc = '' },
      { '<C-s-p>', '<Cmd>BufferPickDelete<CR>', desc = '' },

      -- Sort automatically by...
      { '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', desc = '' },
      { '<leader>bn', '<Cmd>BufferOrderByName<CR>', desc = '' },
      { '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', desc = '' },
      { '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', desc = '' },
      { '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', desc = '' },
    },
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
      auto_hide = false,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
