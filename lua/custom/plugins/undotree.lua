return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>vu', vim.cmd.UndotreeToggle, {
      desc = 'Toggle Undo Tree',
    })
  end,
}
