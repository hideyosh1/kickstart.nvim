vim.g.barbar_auto_setup = false -- disable auto-setup
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

local plugins = {
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/romgrk/barbar.nvim',
}
vim.pack.add(plugins)

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
  merge_duplicates = true,
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'auto',
    section_separators = { left = '<U+E0B4>', right = '<U+E0B6>' },
    component_separators = { left = '<U+E0B5>', right = '<U+E0B7>' },
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
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

require('barbar').setup {}

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

vim.notify = require 'notify'
-- {
--   'romgrk/barbar.nvim',
--   lazy = false,
--   dependencies = {
--     'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
--     'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
--   },
--   setup = true,
--   keys = {
--
--     -- Move to previous/next
--     { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = '' },
--     { '<A-.>', '<Cmd>BufferNext<CR>', desc = '' },
--
--     -- Re-order to previous/next
--     { '<A-<>', '<Cmd>BufferMovePrevious<CR>', desc = '' },
--     { '<A->>', '<Cmd>BufferMoveNext<CR>', desc = '' },
--
--     -- Goto buffer in position...
--     { '<A-1>', '<Cmd>BufferGoto 1<CR>', desc = '' },
--     { '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = '' },
--     { '<A-3>', '<Cmd>BufferGoto 3<CR>', desc = '' },
--     { '<A-4>', '<Cmd>BufferGoto 4<CR>', desc = '' },
--     { '<A-5>', '<Cmd>BufferGoto 5<CR>', desc = '' },
--     { '<A-6>', '<Cmd>BufferGoto 6<CR>', desc = '' },
--     { '<A-7>', '<Cmd>BufferGoto 7<CR>', desc = '' },
--     { '<A-8>', '<Cmd>BufferGoto 8<CR>', desc = '' },
--     { '<A-9>', '<Cmd>BufferGoto 9<CR>', desc = '' },
--     { '<A-0>', '<Cmd>BufferLast<CR>', desc = '' },
--
--     -- Pin/unpin buffer
--     { '<A-p>', '<Cmd>BufferPin<CR>', desc = '' },
--
--     -- Goto pinned/unpinned buffer
--     --                 :BufferGotoPinned
--     --                 :BufferGotoUnpinned
--
--     -- Close buffer
--     { '<A-c>', '<Cmd>BufferClose<CR>', desc = '' },
--
--     -- Wipeout buffer
--     --                 :BufferWipeout
--
--     -- Close commands
--     --                 :BufferCloseAllButCurrent
--     --                 :BufferCloseAllButPinned
--     --                 :BufferCloseAllButCurrentOrPinned
--     --                 :BufferCloseBuffersLeft
--     --                 :BufferCloseBuffersRight
--
--     -- Magic buffer-picking mode
--     { '<C-p>', '<Cmd>BufferPick<CR>', desc = '' },
--     { '<C-s-p>', '<Cmd>BufferPickDelete<CR>', desc = '' },
--
--     -- Sort automatically by...
--     { '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', desc = '' },
--     { '<leader>bn', '<Cmd>BufferOrderByName<CR>', desc = '' },
--     { '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', desc = '' },
--     { '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', desc = '' },
--     { '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', desc = '' },
--   },
--   opts = {
--     -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
--     -- animation = true,
--     -- insert_at_start = true,
--     -- …etc.
--     auto_hide = false,
--   },
--   version = '^1.0.0', -- optional: only update when a new 1.x version is released
-- },
