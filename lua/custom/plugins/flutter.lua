return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('flutter-tools').setup {
        debugger = {
          enabled = true,
          register_configurations = function(_)
            require('dap').configurations.dart = {}
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
      }

      require('telescope').load_extension 'flutter'
    end,
  },
}
