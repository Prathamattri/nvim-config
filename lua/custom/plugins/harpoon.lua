return {
  'ThePrimeagen/harpoon',
  config = function()
    vim.keymap.set('n', '<leader>ha', function()
      require('harpoon.mark').add_file()
    end, { desc = 'Marks file on harpoon' })

    vim.keymap.set('n', '<leader>hj', function()
      require('harpoon.ui').nav_prev()
    end, { desc = 'Go to previous file in harpoon' })

    vim.keymap.set('n', '<leader>hk', function()
      require('harpoon.ui').nav_next()
    end, { desc = 'Go to next file in harpoon' })

    vim.keymap.set('n', '<leader>hf', function()
      require('harpoon.ui').toggle_quick_menu()
    end, { desc = 'Open Harpoon Buffer' })
  end,
}
