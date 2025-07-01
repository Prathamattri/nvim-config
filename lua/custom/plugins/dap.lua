return {
  'mfussenegger/nvim-dap',
  config = function()
    -- Key mappings for DAP
    vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<CR>', { noremap = true, silent = true, desc = 'Start/Continue Debugging' }) -- Start/Continue Debugging
    vim.api.nvim_set_keymap('n', '<F10>', ':lua require"dap".step_over()<CR>', { noremap = true, silent = true, desc = 'Step Over' }) -- Step Over
    vim.api.nvim_set_keymap('n', '<F11>', ':lua require"dap".step_into()<CR>', { noremap = true, silent = true, desc = 'Step Into' }) -- Step Into
    vim.api.nvim_set_keymap('n', '<F12>', ':lua require"dap".step_out()<CR>', { noremap = true, silent = true, desc = 'Step Out' }) -- Step Out
    vim.api.nvim_set_keymap('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true, desc = 'Toggle Breakpoint' }) -- Toggle Breakpoint
    vim.api.nvim_set_keymap(
      'n',
      '<leader>dB',
      ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
      { noremap = true, silent = true, desc = 'Conditional Breakpoint' }
    ) -- Conditional Breakpoint
    vim.api.nvim_set_keymap(
      'n',
      '<leader>dlb',
      ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
      { noremap = true, silent = true, desc = 'Log Point' }
    ) -- Log Point
    vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { noremap = true, silent = true, desc = 'Open REPL' }) -- Open REPL
    vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require"dap".run_last()<CR>', { noremap = true, silent = true, desc = 'Run Last Debugger' }) -- Run Last Debugger

    local dap = require 'dap'

    -- Configure the Go adapter using delve
    dap.adapters.go = {
      type = 'server',
      port = 38697, -- Delve's default port
      executable = {
        command = 'dlv',
        args = { 'dap', '--listen=:38697', '--headless', '--api-version=2', '--check-go-version=false' },
      },
    }

    -- Configure Go launch settings
    dap.configurations.go = {
      {
        type = 'go',
        name = 'Launch file',
        request = 'launch',
        program = '${file}',
        dlvToolPath = vim.fn.exepath 'dlv', -- Automatically find the dlv executable
      },
      {
        type = 'go',
        name = 'Attach to Process',
        request = 'attach',
        pid = require('dap.utils').pick_process, -- Automatically pick process
      },
    }
  end,
}
