return {
  'rcarriga/nvim-dap-ui',
  requires = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio ' }, -- nvim-dap is a required dependency
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Set up dap-ui
    dapui.setup()

    -- Automatically open and close dap-ui with debugger events
    dap.listeners.after['event_initialized']['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before['event_terminated']['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before['event_exited']['dapui_config'] = function()
      dapui.close()
    end
  end,
  -- Lazy load dap-ui on dap events or specific keymaps
  event = 'VeryLazy', -- Lazy load when the first dap event happens
  -- Alternatively, you can use 'cmd' for a specific command or 'ft' for a specific filetype
  -- ft = 'go',  -- Lazy load when a go file is opened
}
