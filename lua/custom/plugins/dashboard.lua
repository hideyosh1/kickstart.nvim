local plugins = {
   'https://github.com/goolord/alpha-nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/rmagatti/auto-session',
}
vim.pack.add(plugins)


local dashboard = require 'alpha.themes.dashboard'
dashboard.section.header.val = {
[[__     __        __     __            __                ]],
[[╲ ╲    ╲ ╲       ╲ ╲    ╲ ╲           ╲ ╲               ]],
[[ ╲ ╲____╲ ╲ ______╲ ╲____╲ ╲____ ______╲ ╲  ________    ]],
[[  ╲  __ ╲╲ ╲╲  __ ╲╲  __ ╲╲  __ ╲╲  __ ╲╲ ╲╱ ╱╲  __ ╲   ]],
[[   ╲ ╲_╲ ╲╲ ╲╲ ╲_╲ ╲╲ ╲ ╲ ╲╲ ╲_╲ ╲╲ ╲_╲ ╲╲  ╱╲ ╲ ╲_╲ ╲  ]],
[[    ╲_____╲╲_╲╲_____╲╲_╲ ╲_╲╲_____╲╲_____╲╲_╲_╲ ╲_____╲ ]],
[[                     ╲                    ╲            ╲]],
}

local config_folder = vim.fn.stdpath 'config'
dashboard.section.buttons.val = {
dashboard.button('e', '  New file', '<cmd>ene <BAR> startinsert <CR>'),
dashboard.button('c', '  Open config', '<cmd>cd ' .. config_folder .. ' <BAR>NvimTreeToggle<CR>'),
-- dashboard.button("l", "  Load last session", "<cmd><CR>"),
dashboard.button('ll', '  Load session', '<cmd>AutoSession search<CR>'),
dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
}
-- dashboard.config.opts.noautocmd = false

require('alpha').setup(dashboard.config)
-- {
--   lazy = false,
--
  ---enables autocomplete for opts
---@module "auto-session"
---@type AutoSession.Config
local opts = {
    args_allow_files_auto_save = false,
    args_allow_single_directory = true,
    auto_create = true,
    auto_restore = false,
    auto_restore_last_session = false,
    auto_save = true,
    close_unsupported_windows = true,
    continue_restore_on_error = true,
    cwd_change_handling = false,
    enabled = true,
    git_use_branch_name = false,
    lazy_support = true,
    log_level = 'error',
    lsp_stop_on_restore = false,
    root_dir = '/home/blahbaka/.local/share/nvim/sessions/',
    session_lens = {
      load_on_setup = true,
      mappings = {
        alternate_session = { 'i', '<C-S>' },
        copy_session = { 'i', '<C-Y>' },
        delete_session = { 'i', '<C-D>' },
      },
      picker_opts = {
        layout_config = {
          height = 0.8,
          width = 0.8,
        },
      },
      previewer = 'summary',
      session_control = {
        control_dir = '/home/blahbaka/.local/share/nvim/auto_session/',
        control_filename = 'session_control.json',
      },
    },
    show_auto_restore_notif = false,
}

require("auto-session").setup(opts)
